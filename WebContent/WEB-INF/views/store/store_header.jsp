<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/store.css">
    

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../resources/js/store.js"></script>
</head>
<body>
    <!-- 위쪽 네비 바-->
    <header>
        <nav>
            <div class="container">
                <div></div>
                <a href="./store_main.html" id="main_logo"><h1>Honey-tip n Meeting - </h1><h1 style="color: #2A8BF2; padding-top: 4px;">&nbsp;광고</h1></a>
                <div style="margin-right: 10px;"><span id="ad_name">${ sessionScope.store.storeName }</span>&nbsp;님
                	<a href="${ pageContext.servletContext.contextPath }/member/logout">로그아웃</a>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>