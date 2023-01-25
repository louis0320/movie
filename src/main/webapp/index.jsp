<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	// 해당 링크 콘텐츠만 보이도록 설정
	String content = request.getParameter("content");
	// 처음 로딩시 null 처리
	if(content == null){
		content = "/include/mainContents.jsp";
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="kimchanyang">
    <meta name="description" content="movie rental webpage portfolio">
    <title>시리즈온 | 포트폴리오</title>
    <!-- 폰트어썸 CND -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 제이쿼리 플러그인 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-3.4.1.min.js"></script>
    <!-- prefix 자동설정 -->
    <script src="./js/prefixfree.min.js"></script>
    <script src="https://kit.fontawesome.com/9cffac1a99.js" crossorigin="anonymous"></script>

    <!-- 기본 코딩 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <!-- slick slider -->
    <link rel="stylesheet" href="./css/slick.css">
    <link rel="stylesheet" href="./css/slick-theme.css">
</head>
<body>
    <div id="wrap">
        <header>
        	<jsp:include page="/include/header.jsp"/>
        </header>
        <main role="main">
            <section class="contents">
            	<jsp:include page="<%=content %>"/>
            </section>
        </main>
        <footer>
        	<jsp:include page="/include/footer.jsp"/>
        </footer>
    </div>
    <!-- 페이지js -->
    <script src="./js/slick_custom.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>
