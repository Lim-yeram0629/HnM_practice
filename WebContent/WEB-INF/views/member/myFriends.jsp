<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.fr_profile {
	align-items: center;
}

.fr_info {
	display: flex;
	flex-direction: column;
}

.profile_img {
	width: 120px;
	height: 120px;
	border-radius: 70%;
	border: 1px solid black;
	overflow: hidden;
}
.btn_style{
	border: none;
	background: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		
		$('.chatBtn').click(function(){
			
		});
		
		$('.deleteMyfreindBtn').click(function(){
			console.log($(this).val());
			let likedEmail = $(this).val();
			$.ajax({
				url:"${ pageContext.servletContext.contextPath }/member/mypage/deleteMyFriend",
				type : "GET",
				data: {likedEmail : likedEmail},
		        success: function(data) {
		           alert(data);
		          location.reload();
		        },
		        error: function (xhr, status, error) {
		            console.log(error);
		            alert(data);
		        }
			});
		});
		
	});

</script>
</head>
<body>
	<jsp:include page="header_myPage.jsp" />

	<section style="padding-left: 110px;">
		<br>
		<h3 align="center">관심 친구</h3>
		<div class="container" style="padding-left: 30px;">
			<div class="row" id="friendDiv"
				style="min-height: 550px; padding: 20px; border-radius: 1rem; text-align: center; background-color: white;">
				<c:forEach var="myFriends" items="${requestScope.myFriendList }">
					<div class="col-md-3" style="margin-top: 5%">
						<div class="fr_profile">
							<div class="dropdown">
								<img
									src="${ pageContext.servletContext.contextPath}/resources/upload/profiles/<c:out value='${ myFriends.PROFILE_PATH }' />"
									class="profile_img dropdown-toggle" role="button"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
								<div class="dropdown-menu" aria-labelledby="dropdownMenu">
									<ul style="list-style: none;">
										<li><button class="btn_style chatBtn" value="${ myFriends.LIKED_EMAIL }" onclick='addchat(this.value);'>1 대 1 채팅</button></li>
										<li><button class="btn_style deleteMyfreindBtn" value="${ myFriends.LIKED_EMAIL }">관심친구 해제</button></li>
									</ul>
								</div>
								<script>
									function addchat(value) {
										let frEmail = value;
										
										$.ajax({
											url: "/1km/chat/check",
											type: 'post',
											data: { frEmail : frEmail },
											success: function(data) {
												if(data == "dup") {
													location.href="${ pageContext.servletContext.contextPath }/chat/one";
												} else if(data == "okay") {
													location.href="${ pageContext.servletContext.contextPath }/chat/one?frEmail=" + frEmail;
												}
											}
										});
									}
								</script>
							</div>
							<h4 style="color: #3771c8;">
								<c:out value='${ myFriends.NICKNAME }' />
								님
							</h4>
						</div>
						<div class="fr_info">
							<div>
								관심사 : <span><c:out value="${ myFriends.LIKES_NAME }" /></span>
							</div>
							<div>
								관심 지역 : <span><c:out value="${ myFriends.LOCATION_NAME }" /></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>


		<<!-- 채팅 아이콘-->
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