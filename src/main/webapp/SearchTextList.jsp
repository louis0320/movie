<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int category = Integer.parseInt(request.getParameter("searchCondition"));
	String keyword = (String)request.getParameter("searchWord");
	String temp = "";
	ArrayList<GhblListVO> v = null;
	GhblRentDAO gdao = null;
	if(category == 1){
		temp = "이름";
		gdao = new GhblRentDAO();
		v = gdao.getNameMovie(keyword);
	}else if(category == 2){
		temp = "내용";
		gdao = new GhblRentDAO();
		v = gdao.getInfoMovie(keyword);
	}
	
%>
                <h2><%=temp %>으로 검색결과</h2>
                <div class="list">
                    <ul>
<%		
	for(int i=0; i < v.size(); i++){
		GhblListVO bean = v.get(i);
%>
                        <li>
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
                                <option value="1">공포/스릴러</option>
                                <option value="2">코미디/멜로</option>
                                <option value="3">액션</option>
                            </select>
                            <input type="submit" value="검색">
                        </div>
                    </form>
	                <button type="button" onclick="location.href='index.jsp?content=SearchAllList.jsp'">전체검색</button>
                </div>