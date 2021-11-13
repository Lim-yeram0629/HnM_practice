<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h1>
							코로나<br> 방역수칙
						</h1>
					</div>
					<div class="col-md-8" style="text-align: center; margin-top: 5%;">
						<a
							href="${ pageContext.servletContext.contextPath }/management/management_board"
							style="color: black;">
							<h1 style="display: inline;">Honey & Meeting</h1>
							<h1 style="color: #2A8BF2; padding-top: 4px; display: inline;">&nbsp;Manager</h1>
						</a>
					</div>
					<!-- Small manager groups (default and split) -->
					<div class="col-md-2"
						style="display: flex; vertical-align: bottom; flex-direction: column; align-items: center; padding: 20px 0px 0px 60px;">
						<ul style="list-style: none;">
							<li><a href="${ pageContext.servletContext.contextPath }/member/logout" style="color: black;">로그아웃</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/management/memberAll"
								style="color: black;">회원관리</a></li>
							<li><a
								href="${ pageContext.servletContext.contextPath }/management/ad"
								style="color: black;">광고관리</a></li>
						</ul>
					</div>
					<!-- =====  ====== -->
					<div class="row2">
						<div class="col-xs-12">
							<ul class="nav nav-pills">
								<li role="presentation"><a
									href="${ pageContext.servletContext.contextPath }/management/etcBoard">우리동네
										이모저모</a></li>
								<li role="presentation"><a
									href="${ pageContext.servletContext.contextPath }/management/honeyTip">꿀Tip</a></li>
								<li role="presentation"><a
									href="${ pageContext.servletContext.contextPath }/management/myLocalStore">우리동네
										가게</a></li>
								<li role="presentation"><a
									href="${ pageContext.servletContext.contextPath }/management/custReport">신고
										된 게시물</a></li>
								<li role="presentation"><a
									href="${ pageContext.servletContext.contextPath }/management/custServiceCenter">고객센터</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</header>

</body>
</html>