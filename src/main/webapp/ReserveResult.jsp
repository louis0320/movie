<%@page import="biz.vo.GhblListVO"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%
// 한글처리
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="rbean" class="biz.vo.GhblReserveVO">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>

	<!-- 로그인 처리 -->
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
		<script>
			alert("로그인을 해주세요");
			location.href="index.jsp?content=login.jsp";
		</script>
<%
	}
%>


	<!-- 날짜 처리 -->
<%
	Date prevDay = new Date(); // java.util에서 import
	Date nowDay = new Date();
	// 날짜형식 년-월-일 형식으로 포멧해주는 클래스 선언
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	prevDay = sdf.parse(rbean.getRday()); // 빈 클래스에서 입력 날짜 가져옴
	nowDay = sdf.parse(sdf.format(nowDay)); // 현재 날짜의 입력포멧
	
	int compare = prevDay.compareTo(nowDay); // 두 날짜를 비교
	// 예약하는 날짜보다 현재날짜보다 크다면 -1 리턴
	// 예약하는 날짜보다 현재날짜와 같다면 0 리턴
	// 예약하는 날짜가 더 크다면 1 리턴
	if(compare <= 0) { // 현재 날짜거나 현재 날짜보다 이전이라면, 현재 날짜 예약 불가능하면 1
%>
	<script>
		alert("현재 날짜이거나, 이전 날짜는 선택할수 없음");
		history.go(-1);
	</script>
<%		
		
	}
	
	// 결과적으로 예약 정보가 아무런 문제가 없으면 데이터 DB 저장후 결과 페이지 보여주기
	// 새로 만든 빈클래스에 id값은 없기떄문에 다시 id값을 저장해줌
	String id1 = (String)session.getAttribute("id");
	rbean.setId(id1);
	
	// 데이터베이스에 빈클래스 저장
	GhblRentDAO gdao = new GhblRentDAO();
	gdao.setReserveMovie(rbean); // useBean id값
	
	GhblListVO cbean = gdao.getOneMovie(rbean.getNo());

	int totalmovie = cbean.getPrice() * rbean.getQty() * rbean.getDday();
	

	int usein =  0;
	if(rbean.getUsein()==10000){
		usein = 10000;
	}
	int usewifi =  0;
	if(rbean.getUsewifi()==10000){
		usewifi = 10000;
	}
	int usenavi =  0;
	if(rbean.getUsenavi()==10000){
		usenavi = 10000;
	}
	int useseat =  0;
	if(rbean.getUseseat()==10000){
		useseat = 10000;
	}
	// 총 옵션 가격
	int totaloption = (rbean.getQty() * rbean.getDday()) * (usein + usewifi + usenavi + useseat);
%>
                <h2>Ghibli Studio Movies Result</h2>
                <div class="info">
                    <ul>
                        <li>
                            <a href="#">
                                <img src="./images/<%=cbean.getImg()%>" alt="<%=cbean.getName() %>">
                            </a>
                        </li>
                    </ul>
                    <ul class="movie_info">
                        <li>
                            영화 기본 대여 금액 : &nbsp;&nbsp;&nbsp;
                            <%=totalmovie%>원
                        </li>
                        <li>
                            영화 옵션 대여 금액 : &nbsp;&nbsp;&nbsp;
                            <%=totaloption %>원
                        </li>
                        <li>
                            영화 총 대여 금액 : &nbsp;&nbsp;&nbsp;
                            <%=totaloption+totalmovie%>원
                        </li>
                    </ul>
                </div>
                <div>
                    <button type="button" class="btn btn-success"><a href="index.jsp?content=ReserveView.jsp">영화대여확인하기</a></button>
                </div>