<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<style>
.postBtn_group {
	border: 5px solid rgb(255, 215, 128);
	background-color: rgba(255, 215, 128);
	border-radius: 0.5rem;
}

.thStyle {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body >
	<jsp:include page="/WEB-INF/views/board/header_customer.jsp"></jsp:include>

	<section style="padding-left: 110px;">
		<div class="container" style="padding-left: 30px;">
			<br>
			<div class="row" style="align-items: center;">
				<div class="col-md-12">
					<h3 align="center">HnM 소개</h3>
				</div>
			</div>
			<br>
			<!-- 게시판 -->
			<div class="table-responsive"
				style="min-height: 580px; padding: 10px; border-radius: 1rem; text-align: center; background-color: white;">
				<img src="../../resources/images/Hnm_Introduce.png" width="90%" height="70%">
			</div>
		</div>
		<!-- 채팅 아이콘-->
		<div class="dropdown">
			<a class="fixed dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-expanded="false"> <img
				src="${ pageContext.servletContext.contextPath }/resources/images/chat_icon.png"
				width="80" height="80">
			</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="${ pageContext.servletContext.contextPath }/chat/one">1:1채팅</a></li>
				<li><a href="#">그룹채팅</a></li>
				<li><a href="#"
					onclick="window.open('${ pageContext.servletContext.contextPath }/chat/location', 'miniChat', 'width=1200, height=675')">
						동네오픈채팅</a></li>
			</ul>
		</div>
	</section>
<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>