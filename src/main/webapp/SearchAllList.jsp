<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <h2>시리즈온 전체 영화</h2>
                <div class="list">
                    <ul>
<%		
	// 1. DB 접근 객체 
	GhblRentDAO gdao = new GhblRentDAO();
	// 2. DAO 메서드 만들어서 벡터데이터형으로 할당하기
	ArrayList<GhblListVO> v = gdao.getAllMovie();  // category값 매개변수값으로 넘겨줌
	// 객체 배열 꺼내옴
	for(int i=0; i < v.size(); i++){
		// 벡터에 저장되어 있는 빈클래스 추출
		GhblListVO bean = v.get(i);
%>
                        <li>
                            <a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
                                <img src="./images/<%=bean.getImg()%>" alt="이미지">
                            </a>
                            <p>영화명 : <%=bean.getName() %></p>
                        </li>
<%
	}
%>                        
                    </ul>
                </div>
                <div class="search">
                    <h3>장르별 검색하기</h3>
                    <form action="index.jsp?content=SearchCategoryList.jsp" method="post">
                        <div class="search_form">
                            <select name="category" class="form-control">
                            	<!-- 3개 값중에 하나를 넘겨줘야 함 -->
                                <option value="1">공포/스릴러</option>
                                <option value="2">코미디/멜로</option>
                                <option value="3">액션</option>
                            </select>
                            <input type="submit" value="검색">
                        </div>
                    </form>
	                <button type="button" onclick="location.href='index.jsp?content=SearchAllList.jsp'">전체검색</button>
                </div>