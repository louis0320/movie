<%@page import="biz.vo.GhblViewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String usein = request.getParameter("usein");
	String usewifi = request.getParameter("usewifi");
	String usenavi = request.getParameter("usenavi");
	String useseat = request.getParameter("useseat");

	String id = (String)session.getAttribute("id");
	if(id==null){
%>
	<script>
		alert('로그인을 해 주세요');
		location.href = "index.jsp?content=login.jsp";
	</script>
<%	
	}
	// 로그인이 되어 있으면 회원의 예약정보를 가져옴
	GhblRentDAO gdao = new GhblRentDAO();
	ArrayList<GhblViewVO> v = gdao.getAllReserve(id);
%>
                <h2> Movies Reserve Result Page</h2>
                <div class="reserve_title">
                    <ul>
                        <li>이미지</li>
                        <li>이름</li>
                        <li>대여일</li>
                        <li>대여기간</li>
                        <li>금액</li>
                        <li>수량</li>
                        <li>옵션1</li>
                        <li>옵션2</li>
                        <li>옵션3</li>
                        <li>옵션4</li>
                        <li>삭제</li>
                    </ul>
                </div>    
                <div class="reserve_result">
<%
	for(int i=0; i<v.size(); i++){
		GhblViewVO bean = v.get(i);
%>
                        <ul>
                            <li>
                            	<img src="images/<%=bean.getImg()%>" width="120" height="70">
                            </li>
                            <li><%=bean.getName()%></li>
                            <li><%=bean.getDday()%></li>
                            <li><%=bean.getRday()%></li>
                            <li><%=bean.getPrice()%></li>
                            <li><%=bean.getQty()%></li>
                            <!-- 옵션 value값인 1아니면 0 -->
                            <li><%=bean.getUserin()%></li>
                            <li><%=bean.getUsewifi()%></li>
                            <li><%=bean.getUsenavi()%></li>
                            <li><%=bean.getUseseat()%></li>
                            <li>
                            	<button type="button" onclick="alert('해당일자 모든 대여를 삭제하시겠습니까?');">
                            		<a href="ReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>">삭제</a>
                            	</button>
                            </li>
                        </ul>
<%
	}
%>
                    </div>