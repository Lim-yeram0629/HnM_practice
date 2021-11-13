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
	
        $(function () {
    $('input, select').on('focus', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
    });
    $('input, select').on('blur', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
    });
    
    // 비밀번호 체크
    $('.form-control').on('keyup', function(){
    	const password = document.getElementById("password").value;
    	const passConfirm = document.getElementById("passwordConfirm").value;
    	let message = "";
    
		if(password != passConfirm){
    		message = "비밀번호가 일치하지 않습니다.";
    		$('#passBtn').attr("disabled", true);
    		$('#inputLabel').css('color', '#0093FF');
    	}else{
    		message = "비밀번호가 일치합니다.";
    		$('#passBtn').attr("disabled", false);
    		$('#inputLabel').css('color', '#E54F4F');
    	}
    	$('#inputLabel').html(message);
		
    	console.log(message);
    });
    
    // 비밀번호 변경 버튼
    $('#passBtn').click(function(){
    	const password = document.getElementById("password").value;
    	$.ajax({
    		url:"${ pageContext.servletContext.contextPath }/member/updatePassword",
    		type: "post",
    		data: {	
    			password : password 
    		},
    		success: function(data, textStatus, xhr){
    			console.log(data);
    			alert(data);
    			if(data == "비밀번호 변경이 완료되었습니다."){
    				location.href= "${ pageContext.servletContext.contextPath }/member/loginpage";
    			}
    		},
    		error: function(xhr, status, error){
    			console.log(error);
    		}
    	});
    	$('input').val('');
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
				<a href="${ pageContext.servletContext.contextPath }/member/start_page">시작페이지</a>
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
								<h4>&nbsp;비밀번호 변경</h4>
							</div>
						</div>
						<!-- 비밀번호 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> 비밀번호
								</span>
							</div>
							<input id="password" type="password" name="password"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- 비밀번호 확인 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> 비밀번호 확인
								</span>
							</div>
							<input id="passwordConfirm" type="password" name="passwordConfirm"
								class="form-control bg-white border-left-0 border-md">
						</div>
						
						<!-- 비밀번호 체크 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span class="px-4  border-right-0">
									<label id="inputLabel" class="fa fa-user text-muted" ></label> 
								</span>
							</div>
						</div>

						<!-- password Button -->
						<div class="form-group col-lg-12 mb-4" align="right">
							<button type="button" id="passBtn" class="btn btn-primary" disabled="true">비밀번호 변경</button> &nbsp;&nbsp;
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