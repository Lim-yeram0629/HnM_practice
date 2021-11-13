<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

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

.head-part{
    height: 20%;
}

.body-part{
    height: 80%;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
        $(function () {
    $('input, select').on('focus', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
    });
    $('input, select').on('blur', function () {
        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
    });

    $('#agreeBtn').on('click', function () {
		$('#agreed').prop('checked','true');
    });

	
});
    </script>
</head>
<body style=" background-color: #FFEDBD;">

	<div class="container-fluid" style="background-color: #FFEDBD;">    
		
			<div class="row" style="position: relative; padding-top: 30px;">
				<div class="col-md-4">
				</div>
				<div class="col-md-8" align = "right">
					<a href="FindEmail.html">이메일/비밀번호 찾기</a>
					&nbsp;&nbsp;
					<a href="#">고객센터 -></a>
				</div>
			</div>
			
			<div class="row" style="position: relative; background-color: #FFEDBD; height: calc(100%-30px);" >
				<!-- For Demo Purpose -->
				<div class="col-md-4" >
					<a href="#" style="position: absolute; color:black;">
						<h3><B>Honey-tip & Meeting</B></h3>
					</a>
				<div style="padding-top: 90%;">
					<p class="font-italic text-muted mb-0">
						밑에 확인을 눌러 약관에 동의해주세요.
					</p>
					<p class="font-italic text-muted">이용약관
						<button type="button" style="background: none; border:none;"
						data-toggle="modal" data-target="#registerModal"><u>확인</u></button>
					</p>
					<p class="font-italic text-muted">
						약관에 동의합니다. <input type="checkbox"  id="agreed">
					</p>
				</div>
			</div>
			<!-- 모달창 -->
			<div class="modal-dialog modal-dialog-scrollable" >
				<div class="modal" tabindex="-1" id="registerModal">
					<div class="modal-dialog">
					  <div class="modal-content">
						<div class="modal-header">
						  <h5 class="modal-title">이용약관</h5>
						  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						  </button>
						</div>
						<div class="modal-body">
						  <p>크기 테스트 (스크롤 생성)
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							맨 아래줄
							</p>
						</div>
						<div class="modal-footer">
						  <button type="button" class="btn btn-secondary" data-dismiss="modal">동의하지 않음</button>
						  <button type="button" class="btn btn-primary" data-dismiss="modal" id="agreeBtn">동의</button>
						</div>
					  </div>
					</div>
				  </div>
			</div>

			<script>
				$(function() {
					<c:forEach items= "${ locationList }" var="locationList">
					$('#location').append('<option value = ' + '<c:out value = "${ locationList.LOCATION_CODE }"/>' + '>'
								 + '<c:out value = "${ locationList.LOCATION_NAME }" /></option>')
					</c:forEach>
					
					let authKey = "";
					let email = "";
					// 이메일 인증 버튼
				    $('#authEmailBtn').click(function(){
				    	email = $('#email').val();
				    	$.ajax({
				    		url:"${ pageContext.servletContext.contextPath }/member/AuthEmail",
				    		type : "get",
				    		data: { email : email },
				    		success: function(data, textStatus, xhr){
				    			alert("이메일로 인증번호 요청을 보냈습니다.");
				    			
				    			$('#authKeyBtn').attr('disabled', false);
				    			$('#authEmailBtn').attr('disabled', true);
				    			
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
				    			$('#emailAuthLabel').text("이메일 인증이 완료되었습니다.").css('color','#0093FF');
				    		}else{
				    			$('#emailAuthLabel').text("인증번호를 확인헤주세요.").css('color','#E54F4F');
				    		}
				    	}else{
				    	}
				    });
				});
			</script>
			

			<!-- Registeration Form -->
			<div class="col-md-8" style="position: relative; background-color: white;">
				
				<form action="${ pageContext.servletContext.contextPath }/store/regist" method="POST" id="form" onsubmit="return validate();">
					<div class="row" style="padding-top: 30px;">
						<!-- 스토어 회원가입 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend" >
								<h4>&nbsp; 스토어 회원가입</h4>
							</div>
						</div>
						<!-- 상호 이름 -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								상호명</span>
							</div>
							<input id="StoreName" type="text" name="StoreName"
								placeholder="Store name"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- 가게 전화 -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-phone-square text-muted"></i>
								가게 전화번호</span>
							</div>
								<input id="telNumber" type="tel" name="tel"
								placeholder="Store Tel"
								class="form-control bg-white border-md border-left-0 pl-3">
						</div>

						<!-- 대표자 이름 -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								대표자 이름</span>
							</div>
							<input id="name" type="text" name="name"
								placeholder="name"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- 대표자 Phone Number -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-phone-square text-muted"></i>
								Phone</span>
							</div>
								<input id="phoneNumber" type="text" name="phone"
								placeholder="Phone Number"
								class="form-control bg-white border-md border-left-0 pl-3">
						</div>

						<!-- 사업자 등록번호 -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								사업자 등록번호</span>
							</div>
							<input id="StoreRegisterNo" type="text" name="StoreRegisterNo"
								placeholder="사업자 등록번호"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Email Address -->
						<div class="input-group col-lg-12">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								Email</span>
							</div>
							<input id="email" type="email" name="email"
								placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md">
								<button type="button" id="authEmailBtn" class="btn btn-primary" disabled="true">이메일 인증</button>
						</div>
						<div class="input-group col-lg-12">
							<div class="input-group-prepend">
								<span class="px-4  border-right-0">
									<label id="emailCheck" class="fa fa-user" ></label> 
								</span>
							</div>
						</div>
						<script>
							$('#email').on('keyup',function(){
								let email = $('#email').val();
								
								$.ajax({
									url: '/1km/member/emailcheck',
									data: {'email' : email},
									type: 'post',
									success: function(data, textStatus, xhr){
				    					if(data == "success") {
				    						console.log(data);
				    						$('#emailCheck').text("중복되는 이메일이 존재합니다.").css('color','#E54F4F');
				    					} else {
				    						$('#emailCheck').text("사용 가능한 이메일입니다.").css('color','#0093FF');
				    						$('#authEmailBtn').attr('disabled', false);
				    					}
				    				},
				    				error: function(xhr, status, error){
				    					console.log(error);
				    				}
								});
							});
						</script>
						
						<!-- 인증번호 입력 -->
						<div class="input-group col-lg-6">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> 인증번호
								</span>
							</div>
							<input id="authKey" type="text" name="authKey" class="form-control bg-white border-left-0 border-md">
							<button type="button" id="authKeyBtn" class="btn btn-primary" disabled="true">인증 확인</button>
						</div>
						<div class="input-group col-lg-12">
							<div class="input-group-prepend">
								<span class="px-4  border-right-0">
									<label id="emailAuthLabel" class="fa fa-user" ></label> 
								</span>
							</div>
						</div>
						
						<!-- Address -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								가게 주소</span>
							</div>
							<input id="address" type="text" name="address"
								placeholder="Address"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Password -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								비밀번호</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="Password"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Password Confirmation -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								비밀번호 확인</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="Confirm Password"
								class="form-control bg-white border-left-0 border-md">
						</div>
						<div class="input-group col-lg-12">
							<div class="input-group-prepend">
								<span class="px-4  border-right-0">
									<label id="passwordCheck" class="fa fa-user" ></label> 
								</span>
							</div>
						</div>
						<script>
							$('#passwordConfirmation').on('keyup',function() {
								let pwd1 = $('#password').val();
								let pwd2 = $('#passwordConfirmation').val();
								if(pwd1 == pwd2) {
									$('#passwordCheck').text('비밀번호가 일치합니다.').css('color','#0093FF');
								} else {
									$('#passwordCheck').text('비밀번호가 일치하지 않습니다.').css('color','#E54F4F');
								}
							});
						</script>

						<!-- 요금제 선택 -->
						<!-- <div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								요금제</span>
							</div>
							<select id="adType" name="adType"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="0">요금제 선택</option>
								<option value="super">슈퍼(광고 상단에 고정)</option>
								<option value="common">일반(광고 고정x)</option>
							</select>
						</div> -->
						<!-- location -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								광고 지역 선택</span>
							</div>
							<select id="location" name="location"
								class="form-control custom-select bg-white border-left-0 border-md">
							</select>
						</div>

						<!-- Already Registered -->
						<div class="form-group col-lg-8" align="right">
							<p class="text-muted font-weight-bold" >
								이미 회원이신가요? <a href="${ pageContext.servletContext.contextPath }/member/loginpage">Login</a>
							</p>
						</div>

						<!-- Submit Button -->
						<div class="form-group col-lg-4" align="right">
							<button type="submit" style="background : #0093FF; color : white; border : none; border-radius : 5px 5px 5px 5px;">회원가입</button>
						</div>
						
						<script>
								function validate() {
									let name = $('#name').val();
									let phone = $('#phoneNumber').val().replaceAll("-","").trim();
									let phone1 = phone.substring(0,3);
									let phone2 = phone.substring(3,7);
									let phone3 = phone.substring(7);
									let storeName = $('#StoreName').val();
									let email = $('#email').val();
									let emailCheck = $('#emailCheck').text();
									let birthday = $('#birthDay').val();
									let address = $('#address').val();
									let location = $('#location').val();
									let password = $('#password').val();
									let password2 = $('#passwordConfirmation').val();
									let checked = $('#agreed').is(":checked");
									let storeTel = $('#telNumber').val().replaceAll("-","").trim();
									let StoreRegisterNo = $('#StoreRegisterNo').val().replaceAll("-","").trim();

						            // 이름검사
						            // 2글자 이상, 한글만
						            if(!chk(/^[가-힣]{2,}$/,name,"이름을 확인해주세요.")){
						                return false;
						            }
						            
						            // 가게 전화번호 검사
						            if(storeTel == "") {
						            	alert('가게 전화번호를 입력해주세요.')
						            	return false;
						            }

						            // 전화번호 검사 010 - xxxx - xxxx
						            if(!chk(/^010$/,phone1,"전화번호를 확인해주세요.")){
						                return false;
						            }
						            if(!chk(/^[0-9]{4}$/,phone2,"전화번호를 확인해주세요.")){
						                return false;
						            }
						            if(!chk(/^[0-9]{4}$/,phone3,"전화번호를 확인해주세요.")){
						                return false;
						            }
						            
						            if(storeName == "") {
										alert("상호명을 입력해주세요.");
										return false;
									}
						            
						            if(StoreRegisterNo == "") {
						            	alert('사업자 등록번호를 입력해주세요.')
						            	return false;
						            }
						            
						            if(StoreRegisterNo.length != 10) {
						            	alert('사업자 등록번호를 확인해주세요.')
						            	return false;
						            }
						            
						            if(!chk(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/,email,"이메일 형식에 어긋납니다.")){
						                return false;
						            }
						            
						            if(emailCheck == '중복되는 이메일이 존재합니다.') {
						            	alert('이메일을 확인해주세요.');
						            	return false;
						            }
									
						            if(birthday == "") {
						            	alert('생년월일을 선택해주세요.');
						            	return false;
						            }
						            
						            if(address == "") {
						            	alert('주소를 입력해주세요.');
						            	return false;
						            }
						            
						            if(location == '0') {
										alert('광고지역을 선택해주세요.');
										return false;
									}
						            
						            // 비밀번호 확인검사
						            if(password != password2){
						                alert("비밀번호를 확인해주세요.");
						                return false;
						            }
						            
						            if(!checked){
										alert('약관에 동의해주세요.');
										return false;
									}
						            
						            function chk(re,ele,msg){
						                if(!re.test(ele)){
						                    alert(msg);
						                    ele.select();
						                
						                    return false;
						                }
						                return true;
						            }
						            
						            alert('회원가입이 완료되었습니다!')

								}
						          
								const formtag = document.getElementById("form");

								// 데이터 전송, 페이지 전환 방지
								function handleSubmit(event) {
								  event.preventDefault()
								}
							
						</script>
					</div>
				</form>
                
                <div class="row" >
					<div class="col-lg-12" style="padding-top: 5%;">
						<a href="${ pageContext.servletContext.contextPath }" > 
							<span> <- 홈페이지로 돌아가기</span>
						</a>
					</div>	
				</div>
			</div>
		</div>
    </div>
</body>
</html>