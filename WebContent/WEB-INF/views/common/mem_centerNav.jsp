<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
  <!-- css 파일 -->
  <link rel="stylesheet" href="/1km/resources/css/CenterLeftNav.css">

</head>
<body style="background: #FFEDBD;">
	<header>
		<nav class="nav">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<h2>
							<br> ${ sessionScope.locationName } 
						</h2>
					</div>
					<div class="col-md-8">
					<a href="${ pageContext.servletContext.contextPath }/board/mainpage">
						<h1 align="center" style="color : black">Honey & Meeting</h1>
						</a>
					</div>
					<div class="col-md-2"
						style="display: flex; vertical-align: bottom; flex-direction: column; align-items: center; padding: 20px 0px 0px 60px;">
						<div class="box" style="background: #BDBDBD;">
							<img class="profile" src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/${ sessionScope.member.profilePath}">
						</div>
						<!-- Small button groups (default and split) -->
						<div class="btn-group">
							<button class="btn btn-secondary btn-sm dropdown-toggle"
								type="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="background: none;">${ sessionScope.member.nickName } 님</button>
							<div class="dropdown-menu">
								<ul style="list-style:none">
									<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/modifyInfo">마이페이지</a></li>
									<li><a href="${ pageContext.servletContext.contextPath }/member/logout">로그아웃</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<ul class="nav nav-pills">
								<li role="presentation"><a href="${ pageContext.servletContext.contextPath }/board/etcpage">우리동네 이모저모</a></li>
								<li role="presentation"><a href="${ pageContext.servletContext.contextPath }/board/honeytippage">꿀Tip</a></li>
								<li role="presentation"><a href="${ pageContext.servletContext.contextPath }/board/localstorepage">우리동네 가게</a></li>
								<li role="presentation"><a href="${ pageContext.servletContext.contextPath }/board/matchedfrpage">나와 비슷한 사람들</a></li>
								<li role="presentation"><a href="${ pageContext.servletContext.contextPath }/board/customerpage">고객센터</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>

</body>
</html>