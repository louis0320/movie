package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import biz.vo.GhblListVO;
import biz.vo.GhblReserveVO;
import biz.vo.GhblViewVO;

public class GhblRentDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	// 커넥션 풀을 이용한 데이터베이스 연결
	public void dbConn() {
		try {
			Context initctx = new InitialContext();
			System.out.println("1.Context생성");
			Context envctx = (Context) initctx.lookup("java:comp/env");
			System.out.println("2.환경설정");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			System.out.println("3.DataSource");
			con = ds.getConnection();
			System.out.println("4.DB접속완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 세션을 이용한 로그인 메서드
	public int getMember(String id, String pass) {
		// 결괏값이 0이면 회원없음
		int result = 0;
		dbConn();
		try {
			String sql = "select count(*) from new_guest where id=? and password=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// 결과 리턴
			rs = pstmt.executeQuery();
			
			// 만약 결괏값이 있으면
			if(rs.next()) {
				// 0 또는 1이 저장됨, 위의 rs에 리턴의 첫번째값만 있음. count때문에 0또는1만 옴
				result = rs.getInt(1); 
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	// 최신순으로 3개 영화를 리턴하는 메소드
	public ArrayList<GhblListVO> getSelectMovie() {
		// 리턴타입 설정
		ArrayList<GhblListVO> v = new ArrayList<>();
		// 커넥션이 연결되어야 쿼리 실행 가능
		dbConn();
		try {
			String sql = "SELECT * FROM movierent ORDER BY NO DESC"; // 최신글 순으로 가져오기, 내림차순
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행 결과를 ResultSet타입으로 리턴
			rs = pstmt.executeQuery();
			int count = 0; //Vector중에서 3개의 데이터만 가져오기 위한 변수
			while (rs.next()) { // 레코드셋이 존재하는 만큼만 반복
				GhblListVO bean = new GhblListVO();
				// psmt 순서대로 데이터 세팅
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				// 벡터에 빈클래스를 저장
				v.add(bean);
				count++;
				if(count > 2) { // 안하면 모든 데이터가 출력되므로 인덱스번호 0,1,2  |  3개만 벡터에 저장 | (중요)저장을 먼저 하기에count>2로 해야
					break; // 조건문 빠져나가기
				}
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v; // 반드시 리턴 코딩		
	}
	
	
	// 하나의 영화 정보를 리턴하는 메소드
	public GhblListVO getOneMovie(int no) {
		// 리턴타입 선언
		GhblListVO bean = new GhblListVO();
		dbConn();
		try {
			String sql = "select * from movierent where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			// 반복문을 돌려면 데이터 저장
			while(rs.next()) {
				bean = new GhblListVO();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return bean;
		
	}	
	
	// 예약 최종 페이지 메서드
	public void setReserveMovie(GhblReserveVO bean) {
		dbConn();
		try {
			String sql = "insert into moviereserve values(moviereserve_seq.nextval,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			// ???에 값을 대입
			pstmt.setInt(1, bean.getNo());
     		pstmt.setString(2, bean.getId());
     		pstmt.setInt(3, bean.getQty());
     		pstmt.setInt(4, bean.getDday());
     		pstmt.setString(5, bean.getRday());
     		pstmt.setInt(6, bean.getUsein());
     		pstmt.setInt(7, bean.getUsewifi());
     		pstmt.setInt(8, bean.getUseseat());
     		pstmt.setInt(9, bean.getUsenavi());
     		
     		pstmt.executeUpdate();
     		
     		pstmt.close();
     		con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	
	// 예약 확인 페이지
	// 회원의 예약정보 리턴 메소드
	public ArrayList<GhblViewVO> getAllReserve(String id) {
		ArrayList<GhblViewVO>  v = new ArrayList<>();
		GhblViewVO bean = null;
		
		dbConn();
		
		try {
			/*
				예약 확인 페이지 (조인을 이용한 쿼리)
				SQL Join문을 이용하여 공통의 컬럼을 기준으로 두 테이블을 묶어줌
				: 훨씬 합리적이고 DB를 이용하여 필요한 데이터를 가져옴
				  natural join 사용함 
			*/
			// 조건절 현재시스템보다 크면 rDay는 문자열이므로 날짜형으로 바꿈
			String sql = "select * from movierent natural join moviereserve where sysdate<to_date(rday,'YYYY-MM-DD') AND id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			// 결과
			rs = pstmt.executeQuery();
			// 해당 id면 나머지 정보도 가져오기
			while(rs.next()) {
				bean = new GhblViewVO();
				// (중요) 1번부터 아니고 위의 sql결과컬럼에서 해당 순서로 가져오기
    			bean.setName(rs.getString(2));
    			bean.setPrice(rs.getInt(4));
    			bean.setImg(rs.getString(7));
    			bean.setQty(rs.getInt(11));
    			bean.setDday(rs.getInt(12));
    			bean.setRday(rs.getString(13));
    			bean.setUserin(rs.getInt(14));
    			bean.setUsewifi(rs.getInt(15));
    			bean.setUsenavi(rs.getInt(16));
    			bean.setUseseat(rs.getInt(17));
    			
    			// 빈 클래스 벡터에 저장
    			v.add(bean);
			}
			rs.close();
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return v;
	}
	
	
	// 예약 확인 페이지에서 예약 삭제하기
	public void movieRemoveReserve(String id, String rday) {
		dbConn();
		
		try {
			String sql = "delete from moviereserve where id=? and rday=?";
			pstmt = con.prepareStatement(sql);
			// ?
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			// 쿼리실행
			pstmt.executeUpdate();

			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	
	// ## 검색 기능
	// 카테고리별 영화정보 리스트를 저장하는 메소드
	private GhblListVO bean;
	public ArrayList<GhblListVO> getCategoryMovie(int cate) {
		
		// 벡터형으로 빈클래스 자료형으로 생성
		ArrayList<GhblListVO> v = new ArrayList<>();
		bean = null;
		
		// DB 연결
		dbConn();
		// 레코드셋
		try {
			String sql = "select * from movierent where category=?";
			pstmt = con.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, cate);
			// 결괏값 리턴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GhblListVO bean = new GhblListVO();
				// psmt 순서대로 데이터 세팅
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				// 벡터에 빈클래스를 저장
				v.add(bean);
				
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return v;			
	}
	
	// 모든 영화를 검색하는 메서드
	public ArrayList<GhblListVO> getAllMovie() {
		// 벡터형으로 빈클래스 자료형으로 생성
		ArrayList<GhblListVO> v = new ArrayList<>();
		bean = null;
		
		// DB 연결
		dbConn();
		// 레코드셋
		try {
			// where 조건절만 삭제하고 ?를 지우면 끝
			String sql = "select * from movierent";
			pstmt = con.prepareStatement(sql);

			// 결괏값 리턴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GhblListVO bean = new GhblListVO();
				// psmt 순서대로 데이터 세팅
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				// 벡터에 빈클래스를 저장
				v.add(bean);
				
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return v;
	}
	
	// 제목 키워드 검색후 영화정보 반환해주는 메서드
	public ArrayList<GhblListVO> getNameMovie(String keyword) {
		ArrayList<GhblListVO> v = new ArrayList<>();
		dbConn();
		try {
			String sql = "select * from movierent where name like '%'||?||'%' order by no desc";
			// ?
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			// 결괏값 리턴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GhblListVO bean = new GhblListVO();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				// 벡터에 빈클래스를 저장
				v.add(bean);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return v;			
	}
	
	
	// 내용 키워드 검색후 영화정보 반환해주는 메서드
	public ArrayList<GhblListVO> getInfoMovie(String keyword) {
		ArrayList<GhblListVO> v = new ArrayList<>();
		dbConn();
		try {
			String sql = "select * from movierent where info like '%'||?||'%' order by no desc";
			// ?
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			// 결괏값 리턴
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GhblListVO bean = new GhblListVO();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setRating(rs.getInt(5));
				bean.setCasting(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				// 배열객체에 빈클래스를 저장
				v.add(bean);
				
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 리턴
		return v;			
	}
	

// ## TEST
public ArrayList<GhblListVO> getSearchMovie(String searchField, String searchText) {
	ArrayList<GhblListVO> list = new ArrayList<>();
	dbConn();
	String sql = "select * from movierent WHERE "+searchField.trim();
	try {
		if(searchText != null && !searchText.equals("")){
			sql += " LIKE '%"+searchText.trim()+"%' order by no desc";
		}
		// ?
		pstmt = con.prepareStatement(sql);
		// 결괏값 리턴
		rs = pstmt.executeQuery();
		while(rs.next()) {
			GhblListVO bean = new GhblListVO();
			bean.setNo(rs.getInt(1));
			bean.setName(rs.getString(2));
			bean.setCategory(rs.getInt(3));
			bean.setPrice(rs.getInt(4));
			bean.setRating(rs.getInt(5));
			bean.setCasting(rs.getString(6));
			bean.setImg(rs.getString(7));
			bean.setInfo(rs.getString(8));
			// 배열객체에 빈클래스를 저장
			list.add(bean);
			
		}
		rs.close();
		pstmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	// 리턴
	return list;			
}	
	
	
}
