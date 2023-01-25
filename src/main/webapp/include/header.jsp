<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String logout = request.getParameter("logout"); // 값 1 넘어옴
	if(logout != null) {
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);
	}
	
	String id = (String)session.getAttribute("id");
	if(id==null){
		id = "Guest";
	}
%>
			<div class="logo">
                <h1><a href="<%=request.getContextPath()%>">NAVER <span>시리즈온</span></a></h1>
                <aside>
<%
	if(id.equals("Guest")){
%>
                    <div>
                    	<strong><%=id %></strong>님  반갑습니다.
	                    <button onclick='location.href="index.jsp?content=login.jsp"'>로그인</button>
                    </div>
<%		
	} else{
%>
					<div>
						<strong><%=id %></strong>님 반갑습니다.
              			<button onclick='location.href="index.jsp?logout=1"'>로그아웃</button>
					</div>
<%		
	}
%>               
                </aside>
            </div>
            <hr class="hr"/>
            <nav class="gnb">
                <ul>
                    <li><a href="./index.jsp?content=/company/company.jsp">마이페이지</a></li>
                    <li><a href="./index.jsp?content=ReserveMain.jsp">대여하기</a></li>
                    <li><a href="./index.jsp?content=ReserveView.jsp">대여확인</a></li>
                </ul>
	          	<ul class="searchText">
	          		<li>
		                <form action="index.jsp?content=SearchTextList.jsp" method="post">
		                    <div class="search_form">
		                        <select name="searchCondition">
		                            <option value="1">제목
									<option value="2">내용
		                        </select>
		                         &nbsp;&nbsp;&nbsp;<input type="text" name="searchWord" required placeholder="검색어를 입력해주세요.">
		                        <input type="submit" value="검색">
		                    </div>
		                </form>
	          		</li>
	            </ul>
            </nav>
            <hr class="hr"/>
