<%@page import="biz.dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 삭제 버튼 클릭시 넘어오는 값
	// 접속자 id와 대여일을 파라메터로 넘겨줌 = 같은 날짜에 예약이 되어 있으면 모두 다 지워짐
	String id = request.getParameter("id");
	String rday = request.getParameter("rday");
	
	GhblRentDAO gdao = new GhblRentDAO();
	// 예약 삭제 메서드 호출
	gdao.movieRemoveReserve(id, rday);
	
	response.sendRedirect("index.jsp?content=ReserveView.jsp");
%>