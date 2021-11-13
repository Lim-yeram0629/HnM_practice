<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

.row h3 {
	text-align-last: center;
}

.dropdown-item {
	display: flex;
	align-items: center;
	flex-direction: column;
}

#location {
	width: 100px;
}
/* 게시판 테스트 */

/* margin-left:20px; margin-bottom: 50px;  */
</style>
</head>

<body style="background: #FFEDBD;">
	<header>
		<jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
	</header>
	<section>
		<script>
		$(function() {
			<c:forEach items="${ sessionScope.locationList }" var="locationList">
			$('#location').append('<option value = ' + '<c:out value = "${ locationList.LOCATION_CODE }"/>' + '>'
						 + '<c:out value = "${ locationList.LOCATION_NAME }" /></option>')
			</c:forEach>
			$('#location').val('${ sessionScope.location }').prop("selected",true);
			if($('#location').val() == null) {
				$('#location').val('L1').prop("selected",true);
			}
			
			$('#location').on('change', function() {
				let location = $('#location').val();
				$.ajax({
					url: '/1km/management/management_board',
					data: { location : location },
					type: 'post',
					success: function(data) {
						window.location.reload();
						console.log(data);
					}
				})
			});
		});
		</script>
		<c:set var="boardCode1" value="1_${ sessionScope.location }"/>
		<c:set var="boardCode2" value="2_${ sessionScope.location }"/>
		<c:set var="boardCode3" value="3_${ sessionScope.location }"/>
		<c:set var="boardCode4" value="4_L0"/>
		<c:set var="boardCode5" value="5_L0"/>
		<!-- 게시물 보드 -->
		<div class="container">
			<div align="right">
				<select id="location" name="location">
				</select>
			</div>

			
			<div class="row">
				<div class="col-md-4 d-flex">
					<h3>우리동네 이모저모</h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
								<table class="table table-responsive table-borderless">
									<br>
									<thead>
										<tr class="bg-light">
											<th scope="col" width="10%">글번호</th>
											<th scope="col" width="10%">작성일자</th>
											<th scope="col" width="55%">제 목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${ requestScope.postList }">
											<c:set var="bc" value="${ post.boardCode }"/>
											<c:if test="${ bc eq boardCode1 }">
												<tr class="bg-light">
													<th scope="col" width="10%">${ post.postNo }</th>
													<th scope="col" width="10%">${ post.postDate }</th>
													<th scope="col" width="55%">${ post.postContents }</th>
													<th scope="col" width="10%">${ post.email }</th>
													<th scope="col" class="text-end" width="10%"><span>${ post.cntView }</span></th>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<h3>신고된 게시물</h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
								<table class="table table-responsive table-borderless">
									<br>
									<thead>
										<tr class="bg-light">
											<th scope="col" width="10%">글번호</th>
											<th scope="col" width="10%">작성일자</th>
											<th scope="col" width="55%">제 목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
										</tr>
									</thead>
									<tbody>
										<tr class="bg-light">
											<th scope="col" width="10%">1</th>
											<th scope="col" width="10%">21/10/14</th>
											<th scope="col" width="55%">여기 음식이 대체로 싱거워요</th>
											<th scope="col" width="10%">초보꿀벌</th>
											<th scope="col" class="text-end" width="10%"><span>
													조회35 </span></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 d-flex">
					<h3>꿀팁</h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
								<table class="table table-responsive table-borderless">
									<br>
									<thead>
										<tr class="bg-light">
											<th scope="col" width="10%">글번호</th>
											<th scope="col" width="10%">작성일자</th>
											<th scope="col" width="55%">제 목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${ requestScope.postList }">
											<c:set var="bc" value="${ post.boardCode }"/>
											<c:if test="${ bc eq boardCode2 }">
												<tr class="bg-light">
													<th scope="col" width="10%">${ post.postNo }</th>
													<th scope="col" width="10%">${ post.postDate }</th>
													<th scope="col" width="55%">${ post.postContents }</th>
													<th scope="col" width="10%">${ post.email }</th>
													<th scope="col" class="text-end" width="10%"><span>${ post.cntView }</span></th>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<h3>고객센터</h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
								<table class="table table-responsive table-borderless">
									<br>
									<thead>
										<tr class="bg-light">
											<th scope="col" width="10%">글번호</th>
											<th scope="col" width="10%">작성일자</th>
											<th scope="col" width="55%">제 목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${ requestScope.postList }">
											<c:set var="bc" value="${ post.boardCode }"/>
											<c:if test="${ bc eq boardCode5 }">
												<tr class="bg-light">
													<th scope="col" width="10%">${ post.postNo }</th>
													<th scope="col" width="10%">${ post.postDate }</th>
													<th scope="col" width="55%">${ post.postContents }</th>
													<th scope="col" width="10%">${ post.email }</th>
													<th scope="col" class="text-end" width="10%"><span>${ post.cntView }</span></th>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 d-flex">
					<h3>우리동네 가게</h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
								<table class="table table-responsive table-borderless">
									<br>
									<thead>
										<tr class="bg-light">
											<th scope="col" width="10%">글번호</th>
											<th scope="col" width="10%">작성일자</th>
											<th scope="col" width="55%">제 목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${ requestScope.postList }">
											<c:set var="bc" value="${ post.boardCode }"/>
											<c:if test="${ bc eq boardCode3 }">
												<tr class="bg-light">
													<th scope="col" width="10%">${ post.postNo }</th>
													<th scope="col" width="10%">${ post.postDate }</th>
													<th scope="col" width="55%">${ post.postContents }</th>
													<th scope="col" width="10%">${ post.email }</th>
													<th scope="col" class="text-end" width="10%"><span>${ post.cntView }</span></th>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<h3></h3>
					<div style="background-color: white; border-radius: 2rem;">
						<div class="p-card bg-white p-2 rounded px-3">
							<div class="table-responsive2" style="text-align: center;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>


<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />

</body>

</html>