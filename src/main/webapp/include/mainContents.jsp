<%@page import="biz.vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	GhblRentDAO gdao = new GhblRentDAO();
	ArrayList<GhblListVO> v = gdao.getAllMovie(); 
%>
                <h2>HOT & NEW</h2>
                <div class="list">
            		<div id="slider-div">
<%
	for(int i=0; i<v.size(); i++){
		GhblListVO bean = v.get(i);
%>
		                <div class="div">
			                <a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
		                        <img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
		                    </a>
		                    <div class="divInfo">
			                    <p class="movieName"><%=bean.getName() %></p>
			                    <p><i class="fa fa-star" aria-hidden="true"></i><%=bean.getRating() %></p>
			                    <p>구매 <%=bean.getPrice() %>원</p>
		                    </div>
		                </div>
<%
	}
%>
            		</div>
        		</div>
   				<h2>최신 이벤트</h2>
        		<div class="movieContent">
        			<div class="leftPart">
	        			<ul class="banner">
	        				<li>
	        					<img src="./images/img/banner01.jpg" alt="배너01" />
	        				</li>
	        				<li>
	        					<img src="./images/img/banner02.png" alt="배너02" />
	        				</li>
	        			</ul>
		        		<h2>최근 업데이트 한 영화</h2>
	        			<ul class="movieUpdate">
	        			<%
							for(int i=10; i<20; i++){
								GhblListVO bean = v.get(i);
						%>
							<li>
		        				<a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
			                        <img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
			                    </a>
			                    <h3><%=bean.getName() %></h3>
			                    <p><i class="fa fa-star" aria-hidden="true"></i><%=bean.getRating() %></p>
		        				<a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
				                	구매 <%=bean.getPrice() %>원
			                    </a>
		                    </li>
						<%
							}
						%>
	        			</ul>
        			</div>
        			<div class="rightPart">
        				<img src="./images/img/banner03.jpg" alt="배너03" />
        				<div class="cash">
        					<h3>보유중 캐시</h3>
        					<div class="cashForm">
								<p><i class="fa fa-credit-card" aria-hidden="true"></i>&nbsp;0 캐시</p>
								<button type="button">충전하기</button>
        					</div>
        				</div>
        			</div>
        		</div>
                
                    
                
