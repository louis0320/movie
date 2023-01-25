<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 마지막 작업. 소형 중형 대형 타이틀 제목 작업 = 아래 카테고리 먼저 작업한거 주석후 가져옴 -->
<%
	int category = Integer.parseInt(request.getParameter("category"));
	String temp = "";
	if(category == 1){
		temp = "공포/스릴러";
	}else if(category == 2){
		temp = "코미디/멜로";
	}else if(category == 3){
		temp = "액션";
	}
%>
			<h2><%=temp %> 카테고리</h2>
                <div class="list">
                    <ul>
<%
	System.out.println(category); 
			
	GhblRentDAO gdao = new GhblRentDAO();
	ArrayList<GhblListVO> v = gdao.getCategoryMovie(category); 
	

	for(int i=0; i < v.size(); i++){
		GhblListVO bean = v.get(i);
%>
                        <li>
<% /* } */ %><!-- if문 닫기 -->
                            <a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
                                <img src="./images/<%=bean.getImg()%>" alt="이미지">
                            </a>
                            <p><%=bean.getName() %></p>
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