<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

body {
	display: flex;
	flex-direction: column;
}

section {
	flex: 1;
}

* {
	font-family: 'Jua';
}

.nav {
	background: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 8px;
}

.nav-pills {
	background: white;
	display: flex;
	padding: 8px;
}

.fixed {
	border: none;
	background: none;
	position: fixed;
	bottom: 50px;
	right: 100px;
}

.box {
	width: 70px;
	height: 70px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

body {
	background: #eee
}

.filter {
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px
}

.profiles img {
	margin-right: -6px
}

.col-md-4 {
	margin-top: 26px
}

.rounded-circle {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border: 1px solid black;
	margin-bottom: 5px;
}

.thStyle {
	text-align: center;
}
</style>
<script>
	
	function moveStoreBoard(){ 
		location.href="${ pageContext.servletContext.contextPath }/board/localstorepage";
		};
	function moveHoneyTipBoard(){ 
		location.href="${ pageContext.servletContext.contextPath }/board/honeytippage";
		};
	function moveEtcBoard(){ 
		location.href="${ pageContext.servletContext.contextPath }/board/etcpage";
		};
	function moveMatchedBoard(){ 
		location.href="${ pageContext.servletContext.contextPath }/board/matchedfrpage";
		};

</script>
</head>
<body style="background: #FFEDBD;">
	<jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
	<section>
		<!-- 게시물 보드 soo -->
		<div class="container">
			<div class="row">
				<div class="col-md-4 d-flex">
					<h3 align="center">우리동네 가게</h3>
					<div class="table-responsive"
						style="background-color: white; padding: 2%; border-radius: 2rem; text-align: center;">
						<table class="table table-responsive table-borderless" onclick="moveStoreBoard();">
							<thead>
								<tr class="bg-light">
									<th class="thStyle" width="10%">작성일자</th>
									<th class="thStyle" width="30%">제 목</th>
									<th class="thStyle" width="10%">작성자</th>
									<th class="thStyle" width="10%"><span>추천수</span></th>
									<th class="text-end " width="10%"><span>조회수</span></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="mainBoard"
									items="${requestScope.mainBoardList }">
									<c:if test="${fn: contains( mainBoard.BOARD_CODE, '3_') }">
										<tr>
											<td><c:out value="${ mainBoard.POST_DATE }" /></td>
											<td><c:out value="${ mainBoard.POST_TITLE }" /></td>
											<td><c:out value="${ mainBoard.NICKNAME }" /></td>
											<td><c:out value="${ mainBoard.CNT_LIKE }" /></td>
											<td class="text-end"><c:out
													value="${ mainBoard.CNT_VIEW }" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<h3 align="center">꿀 Tip</h3>
					<div class="table-responsive"
						style="background-color: white; padding: 2%; border-radius: 2rem; text-align: center;">
						<table class="table table-responsive table-borderless" onclick="moveHoneyTipBoard();">
							<thead>
								<tr class="bg-light">
									<th class="thStyle" width="10%">작성일자</th>
									<th class="thStyle" width="30%">제 목</th>
									<th class="thStyle" width="10%">작성자</th>
									<th class="thStyle" width="10%"><span>추천수</span></th>
									<th class="text-end " width="10%"><span>조회수</span></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="mainBoard"
									items="${requestScope.mainBoardList }">
									<c:if test="${fn: contains( mainBoard.BOARD_CODE, '2_') }">
										<tr>
											<td><c:out value="${ mainBoard.POST_DATE }" /></td>
											<td><c:out value="${ mainBoard.POST_TITLE }" /></td>
											<td><c:out value="${ mainBoard.NICKNAME }" /></td>
											<td><c:out value="${ mainBoard.CNT_LIKE }" /></td>
											<td class="text-end"><c:out
													value="${ mainBoard.CNT_VIEW }" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-md-6 d-flex">
					<br>
					<h3 align="center">우리 동네 이모저모</h3>
					<div class="table-responsive"
						style="background-color: white; padding: 2%; border-radius: 2rem; text-align: center;">
						<table class="table table-responsive table-borderless" onclick="moveEtcBoard();">
							<thead>
								<tr class="bg-light">
									<th class="thStyle" width="10%">작성일자</th>
									<th class="thStyle" width="30%">제 목</th>
									<th class="thStyle" width="10%">작성자</th>
									<th class="thStyle" width="10%"><span>추천수</span></th>
									<th class="text-end " width="10%"><span>조회수</span></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="mainBoard"
									items="${requestScope.mainBoardList }">
									<c:if test="${fn: contains( mainBoard.BOARD_CODE, '1_') }">
										<tr>
											<td><c:out value="${ mainBoard.POST_DATE }" /></td>
											<td><c:out value="${ mainBoard.POST_TITLE }" /></td>
											<td><c:out value="${ mainBoard.NICKNAME }" /></td>
											<td><c:out value="${ mainBoard.CNT_LIKE }" /></td>
											<td class="text-end"><c:out
													value="${ mainBoard.CNT_VIEW }" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="col-md-2 d-flex">
					<br>
					<h3 style="font-size: large;" align="center">나와 비슷한 사람들</h3>
					<div class="table-responsive" onclick="moveMatchedBoard();"
						style="background-color: white; padding: 2%; border-radius: 2rem; text-align: center;">
						<div class="table-responsive" style="text-align: center;"  id="matchedBoard">
							<div class="profiles">
								<c:forEach var="mainMatchedList"
									items="${requestScope.mainMatchedList }">
									<br>
									<img class="rounded-circle" width="80"
										src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/<c:out value='${ mainMatchedList.PROFILE_PATH }' />">
									<br>
									<c:out value="${ mainMatchedList.NICKNAME }" />님
									<br>
								</c:forEach>
								<br>
							</div>
						</div>
					</div>
				</div>
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
			</ul>
		</div>

	</section>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>