<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
    rel="stylesheet">

<style>
* {
	font-family: 'Jua';
}

html, body {
	height: 100%;
}

.container-fluid {
	height: 100%;
	overflow-y: auto;
}

.form-control:not(select) {
	padding: 1.5rem 0.5rem;
}

select.form-control {
	height: 52px;
	padding-left: 0.5rem;
}

.form-control::placeholder {
	color: #ccc;
	font-weight: bold;
	font-size: 0.9rem;
}

.form-control:focus {
	box-shadow: none;
}
</style>
<script>
	
	let authKey = "";
	let email = "";
	
        $(function () {
    $('input, select').on('focus', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
    });
    $('input, select').on('blur', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
    });
    // 정보 확인 버튼
    $('#confirmBtn').click(function(){
    	const name = document.getElementById("name").value;
    	email = document.getElementById("email").value;
    	
    	$.ajax({
    		url:"${ pageContext.servletContext.contextPath }/member/findPassword",
    		type : "post",
    		data: {
    			name : name,
    			email : email
    		},
    		success: function(data, textStatus, xhr){
    			if(data == 1){
    				alert("이메일 인증버튼을 눌러 이메일 인증을 해주세요.");
    				$('#authEmailBtn').attr('disabled', false);
    			}else if(data == 0){
    				alert("일치하는 회원이 없습니다.");
    			}else{
    				alert("빈칸을 확인해주세요.");
    			}
    		},
    		error: function(xhr, status, error){
    			console.log(error);
    		}
    	});
    });
    
    
    // 이메일 인증 버튼
    $('#authEmailBtn').click(function(){
    	$.ajax({
    		url:"${ pageContext.servletContext.contextPath }/member/AuthEmail",
    		type : "get",
    		data: { email : email },
    		success: function(data, textStatus, xhr){
    			alert("이메일로 인증번호 요청을 보냈습니다.");
    			
    			$('#authKeyBtn').attr('disabled', false);
    			/* $('#authEmailBtn').attr('disabled', true); */
    			
    			authKey = data;
    			/* console.log(authKey); */
    		},
    		error: function(xhr, status, error){
    			console.log(error);
    		}
    	});
    });
    // 이메일 인증 확인 버튼
    $('#authKeyBtn').click(function(){
    	const userAuthKey = document.getElementById("authKey").value;
    	if(userAuthKey != ""){
    		if(authKey == userAuthKey){
    			alert("비밀번호 재설정 페이지로 이동합니다.");
    			console.log(email);
    			location.href="${ pageContext.servletContext.contextPath }/member/updatePassword?email="+email;
    			$('input').val("");
    		}else{
    			alert("인증번호를 확인해주세요.");
    		}
    	}else{
    		alert("값을 입력해주세요.");
    	}
    });
    
});
    </script>
</head>
<body style="background-color: #FFEDBD;">

	<div class="container-fluid" style="background-color: #FFEDBD;">

		<div class="row" style="padding-top: 30px;">
			<div class="col-md-4" align="left"></div>
			<div class="col-md-4" align="left">
				<a href="${ pageContext.servletContext.contextPath }/member/signin"><- 회원가입</a>
			</div>
			<div class="col-md-4" align="right">
				<a href="${ pageContext.servletContext.contextPath }/member/loginpage">로그인</a> &nbsp;&nbsp; 
				<a href="${ pageContext.servletContext.contextPath }">시작페이지</a>
			</div>
		</div>

		<div class="row "
			style="background-color: #FFEDBD; height: calc(100% -30px);">
			<!-- For Demo Purpose -->
			<div class="col-md-4">
				<a href="${ pageContext.servletContext.contextPath }" style="color: black;">
					<h3>
						<B>Honey-tip & Meeting</B>
					</h3>
				</a>
			</div>

			<!-- Registeration Form -->
			<div class="col-md-8 " style="background-color: white;">

				<form >
					<div class="row" style="padding-top: 30px;">
						<!-- 비밀번호 찾기 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<h4>&nbsp;비밀번호 찾기</h4>
							</div>
						</div>
						<!-- 이름 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> Name
								</span>
							</div>
							<input id="name" type="text" name="name" placeholder="name"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Email Address -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> Email
								</span>
							</div>
							<input id="email" type="email" name="email"
								placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- confirm Button -->
						<div class="form-group col-lg-12 mb-4" align="right">
							<button type="button" id="confirmBtn" class="btn btn-primary">정보 확인</button> &nbsp;&nbsp;
							<button type="button" id="authEmailBtn" class="btn btn-primary" disabled="true">이메일 인증</button>
						</div>

						<!-- 인증번호 입력 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> 인증번호
								</span>
							</div>
							<input id="authKey" type="text" name="authKey" class="form-control bg-white border-left-0 border-md">
							<button type="button" id="authKeyBtn" class="btn btn-primary" disabled="true">인증 확인</button>
						</div>

					</div>
				</form>

				<div class="row">
					<div class="col-lg-12 pt-5 mt-1">
						<a href="${ pageContext.servletContext.contextPath }/member/findEmail"> <span> <- 이메일 찾기</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>