<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>나와 비슷한 사람들</title>
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
	border: 5px solid rgb(255, 215, 128);
	background-color: rgba(255, 215, 128);
	border-radius: 0.5rem;
}
.listBtn_style{
	border: none;
	background-color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		
		$('.chatBtn').click(function(){
			
		});
		
		$('.likedFriendBtn').click(function(){
			console.log($(this).val());
			let likedEmail = $(this).val();
			$.ajax({
				url:"${ pageContext.servletContext.contextPath }/member/mypage/addMyFriend",
				type : "GET",
				data: {likedEmail : likedEmail},
		        success: function(data) {
		           alert(data);
		        },
		        error: function (xhr, status, error) {
		            console.log(error);
		            alert(data);
		        }
			});
		});
		
		$('.blockedFriendBtn').click(function(){
			console.log($(this).val());
			let blockedEmail = $(this).val();
			$.ajax({
				url:"${ pageContext.servletContext.contextPath }/member/mypage/addBlocked",
				type : "GET",
				data: {blockedEmail : blockedEmail},
		        success: function(data) {
		           alert(data);
		        },
		        error: function (xhr, status, error) {
		            console.log(error);
		            alert(data);
		        }
			});
		});
		
		$('#sortValue').change(function(){
			$('#searchForm').submit();
		});
		
	});

</script>
</head>

<body style="background: #FFEDBD;">
  	<jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
  <section style="display: flex; flex-direction: column; align-items: center;">
    <h2 style="color: #5B5B5B;">나와 비슷한 사람들</h2>
    <br>
		<div class="container" style="padding-left: 30px;">
			<!-- 검색  -->
					<div class="row">
						<form id="searchForm"
							action="${ pageContext.servletContext.contextPath }/board/matchedfrpage"
							method="get">
							<div class="col-md-3" align="right" style="padding-left:10%;">
								<select id="sortValue" name="sortValue"
										class="btn_style" style="padding:2px">
										<option value = "">정렬</option>
										<option value = "ageASC" ${ requestScope.pageNumberingAndSearching.sortValue eq "ageASC"? "selected": "" }>나이 적은순</option>
										<option value = "ageDESC" ${ requestScope.pageNumberingAndSearching.sortValue eq "ageDESC"? "selected": "" }>나이 많은순</option>
										<option value = "nickName" ${ requestScope.pageNumberingAndSearching.sortValue eq "nickName"? "selected": "" }>닉네임순</option>
								</select>
							</div>
							<input type="hidden" name="currentPage" value="1"> 
							<div class="col-md-7" align="right">
							<input type="hidden" name="searchCondition" value="nickName">
								<input type="search" name="searchValue" class="form-control"
									placeholder="🔍 찾으실 닉네임을 입력하세요"
									value="<c:out value = "${ requestScope.pageNumberingAndSearching.searchValue }"/>"
									style="background-color: white; width: 30$;">
							</div>
							<div class="col-md-2" align="left">
								<button class="btn_style" type="submit" style="float: left">검색</button>
							</div>
						</form>
					</div>
					<br>
					<div class="row" id="friendDiv"
						style="min-height: 600px; padding: 20px; border-radius: 1rem; text-align: center; background-color: white;">
						<c:forEach var="matched" items="${requestScope.matchedList }">
							<div class="col-md-3" style="margin-top: 5%">
								<div class="fr_profile">
									<div class="dropdown">
										<img
											src="${ pageContext.servletContext.contextPath}/resources/upload/profiles/<c:out value='${ matched.PROFILE_PATH }' />"
											class="profile_img dropdown-toggle" role="button"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
										<div class="dropdown-menu" aria-labelledby="dropdownMenu">
											<ul style="list-style: none;">
												<li><button class="listBtn_style chatBtn" value="${ matched.EMAIL }" onclick='addchat(this.value);'>1 대 1 채팅</button></li>
												<li><button class="listBtn_style likedFriendBtn" value="${ matched.EMAIL }">관심친구 추가</button></li>
												<li><button class="listBtn_style blockedFriendBtn" value="${ matched.EMAIL }">차단하기</button></li>
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
										<c:out value='${ matched.NICKNAME }' />
										님
									</h4>
								</div>
								<div class="fr_info">
									<div>
										나이 : <span><c:out value="${ matched.AGE }" />세</span>
									</div>
									<div>
										관심사 : <span><c:out value="${ matched.LIKES_NAME }" /></span>
									</div>
									<div>
										관심 지역 : <span><c:out value="${ matched.LOCATION_NAME }" /></span>
									</div>
								</div>
							</div>
						</c:forEach>
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


</body>

</html>