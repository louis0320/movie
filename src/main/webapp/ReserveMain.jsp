<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 데이터 베이스를 연결하여 최신순 영화 3개만 가져옴 -->
<%
	request.setCharacterEncoding("utf-8");
	GhblRentDAO gdao = new GhblRentDAO();
	// 배열객체 이용 , 영화 데이터 3개만 출력
	ArrayList<GhblListVO> v = gdao.getSelectMovie();
%>
                <h2>최신영화</h2>
                <div class="list">
                    <ul>
<%
	for(int i=0; i<v.size(); i++){
		GhblListVO bean = v.get(i);
%>
                        <li>
                            <a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
                                <img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
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