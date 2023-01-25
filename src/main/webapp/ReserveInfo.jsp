<%@page import="biz.vo.GhblListVO"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB의 번호를 기준으로 가져올 것이므로 번호를 얻어옴 -->
<%
	int no = Integer.parseInt(request.getParameter("no"));
	// DB에 접근
	GhblRentDAO gdao = new GhblRentDAO();
	// 렌트카 하나에 대한 정보를 얻어옴
	GhblListVO bean = gdao.getOneMovie(no);
	
	// 빈에서 category 가져옴
	int category = bean.getCategory();
	String temp = "";
	if(category==1) temp = "스릴러";
	else if(category==2) temp = "액션";
	else if(category==3) temp = "코믹";
	
%>
                <h2>영화 대여하기</h2>
                <form action="index.jsp?content=ReserveOptionSelect.jsp" method="post">
                    <div class="info">
                        <ul>
                            <li>
                                <a href="#">
                                    <img src="./images/<%=bean.getImg()%>" alt="이미지">
                                </a>
                            </li>
                        </ul>
                        <ul class="movie_info">
                            <li>
                            	<h3>
	                            	<%=bean.getName() %>
                            	</h3> 
                           	</li>
                            <li>
                            	<span>
                            		영화 수량
                            	</span>	
                                <select name="qty" class="form-control">
                                    <option value ="1">1</option>
                                    <option value ="2">2</option>
                                    <option value ="3">3</option>
                                </select>
                            </li>
                            <!-- 위의 조건문에 따라 소박,중박,대박 출력해줌 -->
                            <li>
                            	<span>
	                            	영화 분류  
                            	</span>
                            	<%=temp%>
                           	</li>
                            <li>
                            	<span>
                            		가격
                            	</span>	
                            	<%=bean.getPrice()%>원
                           	</li>
                            <li>
                            	<span>
                            		평점  
                            	</span>
                            	<%=bean.getRating()%>
                           	</li>
                            <li>
                            	<span>
                            		출연
                           		</span>  
                            	<%=bean.getCasting()%>
                            </li>
                            <li>
                            	<span>
	                            	줄거리  
                            	</span>
                           		<%=bean.getInfo()%>
                            </li>
                        </ul>
                    </div>
                    <div class="infoBtn">
                        <input type = "hidden" name="no" value="<%=bean.getNo()%>">
                        <input type = "hidden" name="img" value="<%=bean.getImg()%>">
                        <input type="submit" value="옵션선택후 대여하기" class="optionBtn">
                    </div>
                </form>