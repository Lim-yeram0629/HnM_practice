<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.col-md-3 {
	margin-top: 15%;
	align-items: center;
	padding: 10px;
	height: 200px;
	display: flex;
	font-size: 20px;
	border: 1px solid black;
	border-radius: 20px;
}

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
button {
	background-color : #ffda76;;
}
</style>
<script>
	
	$(function(){
		<c:forEach items= "${ likesList }" var="likesList">
		$('#liked').append('<option value = ' + '<c:out value = "${ likesList.LIKES_CODE }"/>' + '>'
					 + '<c:out value = "${ likesList.LIKES_NAME }" /></option>')
		</c:forEach>
		
		<c:forEach items= "${ locationList }" var="locationList">
			$('#location').append('<option value = ' + '<c:out value = "${ locationList.LOCATION_CODE }"/>' + '>'
						 + '<c:out value = "${ locationList.LOCATION_NAME }" /></option>')
		</c:forEach>
		
		$('#liked').val("<c:out value='${ memberInfo.likesCode}'/>");
		$('#location').val("<c:out value='${ memberInfo.locationCode}'/>");
		
		function is_inputEmpty(){
			let result = true;
			$('input').each(function(index, item){
				if( item.value != "") { result = false; }
			});
			return result;
		}
		
		$('input').on('keyup', function(){
			if(!is_inputEmpty()){
				if($('#nickName').val() != ""){
					$('#nickNameBtn').attr('disabled', false);
					$('#nickNameCheck').html("닉네임 중복체크를 해주세요.").css('color','#0093FF');
				}else{
					$('#nickNameCheck').html("");
					$('#nickNameBtn').attr('disabled', true);
					$('#modifyBtn').attr('disabled', false);
				}
			}else{
				$('#modifyBtn').attr('disabled', true);
			}
		});
		
		$('select').click(function(){
			if($('#liked').val()=="<c:out value='${ memberInfo.likesCode}'/>" &&
					$('#location').val()=="<c:out value='${ memberInfo.locationCode}'/>"){
				$('#modifyBtn').attr('disabled', true);
			}else{
				$('#modifyBtn').attr('disabled', false);
			}
		});
		
		$('#nickNameBtn').click(function(){
			let nickName = $('#nickName').val();
			$.ajax({
				url: "${ pageContext.servletContext.contextPath }/member/CheckNickName",
				type: "post",
				data: { nickName : nickName },
				success: function(data, textStatus, xhr){
	    			if(data == "true"){
	    				$('#nickNameCheck').html("중복된 닉네입이 있습니다.").css('color','#E54F4F');
	    			}else if(data == "false"){
	    				$('#nickNameCheck').html("사용 가능한 닉네임입니다.").css('color','#0093FF');
	    				$('#modifyBtn').attr('disabled', false);
	    			}else{
	    				alert("빈칸을 확인해주세요.");
	    			}
	    		},
	    		error: function(xhr, status, error){
	    			console.log(error);
	    		}
			});
		});
		
	
		$('#modifyBtn').click(function(){
			let nickName = $('#nickName').val();
			let phone = $('#phoneNumber').val();
			let likesCode = $('#liked').val();
			let address = $('#address').val();
			let locationCode = $('#location').val();
			if(confirm("정보를 수정하시겠습니까?")==true){
				
				$.ajax({
					url: "${ pageContext.servletContext.contextPath }/member/mypage/modifyInfo",
					type: "post",
					data: {
						nickName : nickName,
						phone : phone,
						likesCode : likesCode,
						address : address,
						locationCode : locationCode
					},
					success: function(data, textStatus, xhr){
						alert(data);
						location.reload();
		    		},
		    		error: function(xhr, status, error){
		    			console.log(error);
		    		}
				});
			}
		});
		
		//프로필 기능
		$('#updateProfile').click(function(){
			const inputImage = $('#uploadProfile')[0];
			console.log(inputImage);
			
			if(inputImage.files.length === 0){
				alert("파일을 선택해주세요.");
			}else{
				const formData = new FormData();
				formData.append("profile", inputImage.files[0]);
				
				$.ajax({
					url : "${ pageContext.servletContext.contextPath }/member/mypage/updateProfile",
					type : "POST",
					processData : false,
					contentType : false,
					data : formData,
			        success: function(data, textStatus, xhr) {
			           alert(data);
			           location.reload();
			        },
			        error: function (xhr, status, error) {
			            console.log(error);
			            alert(data);
			        }
				});
			}
		});
		
		$('#deleteProfile').click(function() {
			$.ajax({
				url : "${ pageContext.servletContext.contextPath }/member/mypage/updateProfile",
				type : "GET",
		        success: function(data) {
		           alert(data);
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
	<jsp:include page="/WEB-INF/views/member/header_myPage.jsp"/>
	<section style="padding-left: 110px;">
		<div class="container" style="padding-left: 30px;">
			<br>
			<h3 align="center" style="padding-right: 110px;">회원 정보 수정</h3>
			<div class="form-inline" 
				style="padding: 5%; background-color: white; border-radius: 2rem;">
				<div class="row">
					<!-- 프로필 -->
					<div class="col-md-4 mb-4">
						<div align="center">
							<div class="profile_box">
								<img src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/<c:out value='${ member.profilePath}'/>"
									class="profile_img dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<form id="profileForm" method="post" enctype="multipart/form-data">
										<ul style="list-style: none;">
											<li><input class="dropdown-item btn" type="file" accept="image/*"
													id="uploadProfile" name="uploadProfile"></li>
											<br>
											<li><button type="button" class="dropdown-item btn" id="updateProfile">프로필 사진 변경</button>
												<button type="button" class="dropdown-item btn" id="deleteProfile">프로필 사진 삭제</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</div>
						<!-- 이름 / 이메일-->
						<div align="center" style="padding-top:5%">
							<label id="name" name="name" class="form-label"
								style="border: none;"> <i class="bi bi-person"></i>&nbsp;
								<c:out value="${ memberInfo.user.name }" /> 님 
							</label> <br><label id="email" name="email" class="form-label"
								style="padding-top: 0%; border: none; font-size: 18px;">
								<c:out value="${ memberInfo.user.email }" /></label>
						</div>
					</div>
					<div class="col-md-8">
						<!-- 닉네임 -->
						<div class="row">
							<div class="col-md-6">
								<div class="input-group-prepend">
									<span class="input-group-text bg-whiteborder-md"> 닉네임</span>
								</div>
								<input id="nickName" type="text" name="nickname"
									placeholder="<c:out value='${ memberInfo.nickName }'/>" class="form-control">
								<button type="button" id="nickNameBtn" class="btn" disabled="true">중복 확인</button>
							</div>
							<!-- 생년월일 -->
							<div class="col-md-6">
								<div class="input-group-prepend">
									<span
										class="input-group-text bg-white px-4 border-md border-right-0">
										생년월일</span>
								</div>
								<label id="birthDay" type="date" name="birthDay"
									class="form-label"><c:out value='${ memberInfo.birthDay}'/></label>
							</div>
						</div>
						<!-- 닉네임 중복확인 -->
						<div class="row">
							<div class="col-md-12">
								<div class="input-group-prepend">
									<span class="px-4  border-right-0">
										<label id="nickNameCheck" class="fa fa-user" ></label> 
									</span>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white border-md "> <i
										class="fa fa-phone-square text-muted"></i> 전화번호
									</span>
								</div>
								<input id="phoneNumber" type="text" name="phone"
									placeholder="<c:out value='${ memberInfo.user.phone }'/>"
									class="form-control bg-white border-md border-left-0 ">
							</div>
							<div class="col-md-6 mb-4">
								<div class="input-group-prepend">
									<span
										class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-black-tie text-muted"></i> 관심사
									</span>
								</div>
								<select id="liked" name="liked"
									class="form-control custom-select bg-white border-left-0 border-md">
								</select>
							</div>
						</div>
					</div>
				</div>
				<!-- 수정 Button -->
				<div class="row">
					<div class="col-lg-12" align="right" style="padding-right:10%">
						<button type="button" id="modifyBtn" class="btn" disabled="true">수정 하기</button>
					</div>
				</div>
				
				<br>

				<div class="row">
					&nbsp; &nbsp;
					<!-- 주소 -->
					<div class="col-lg-10" style="padding-left:10%">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-white px-4 border-md border-right-0">
								<i class="fa fa-envelope text-muted"></i> 주소
							</span>
						</div>
						<input id="address" type="text" name="adress"
							placeholder="<c:out value='${ memberInfo.address}'/>"
							class="form-control bg-white border-left-0 border-md"
							style="width: inherit;">
					</div>
				</div>

				<br> <br>

				<div class="row">
					<!-- location -->
					<div class="col-lg-10" style="padding-left:10%">
						<div class="input-group-prepend" >
							<span
								class="input-group-text bg-white px-4 border-md border-right-0">
								<i class="fa fa-black-tie text-muted"></i> 관심 동네
							</span>
						</div>
						<select id="location" name="location"
							class="form-control custom-select bg-white border-left-0 border-md"
							style="width: inherit;">
						</select>
					</div>
				</div>
			</div>

			<br> <br>
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