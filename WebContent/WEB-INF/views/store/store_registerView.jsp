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
					<a href="FindEmail.html">?????????/???????????? ??????</a>
					&nbsp;&nbsp;
					<a href="#">???????????? -></a>
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
						?????? ????????? ?????? ????????? ??????????????????.
					</p>
					<p class="font-italic text-muted">????????????
						<button type="button" style="background: none; border:none;"
						data-toggle="modal" data-target="#registerModal"><u>??????</u></button>
					</p>
					<p class="font-italic text-muted">
						????????? ???????????????. <input type="checkbox"  id="agreed">
					</p>
				</div>
			</div>
			<!-- ????????? -->
			<div class="modal-dialog modal-dialog-scrollable" >
				<div class="modal" tabindex="-1" id="registerModal">
					<div class="modal-dialog">
					  <div class="modal-content">
						<div class="modal-header">
						  <h5 class="modal-title">????????????</h5>
						  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						  </button>
						</div>
						<div class="modal-body">
						  <p>?????? ????????? (????????? ??????)
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							<br><br><br><br><br><br>
							??? ?????????
							</p>
						</div>
						<div class="modal-footer">
						  <button type="button" class="btn btn-secondary" data-dismiss="modal">???????????? ??????</button>
						  <button type="button" class="btn btn-primary" data-dismiss="modal" id="agreeBtn">??????</button>
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
					// ????????? ?????? ??????
				    $('#authEmailBtn').click(function(){
				    	email = $('#email').val();
				    	$.ajax({
				    		url:"${ pageContext.servletContext.contextPath }/member/AuthEmail",
				    		type : "get",
				    		data: { email : email },
				    		success: function(data, textStatus, xhr){
				    			alert("???????????? ???????????? ????????? ???????????????.");
				    			
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
				    // ????????? ?????? ?????? ??????
				    $('#authKeyBtn').click(function(){
				    	const userAuthKey = document.getElementById("authKey").value;
				    	if(userAuthKey != ""){
				    		if(authKey == userAuthKey){
				    			$('#emailAuthLabel').text("????????? ????????? ?????????????????????.").css('color','#0093FF');
				    		}else{
				    			$('#emailAuthLabel').text("??????????????? ??????????????????.").css('color','#E54F4F');
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
						<!-- ????????? ???????????? -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend" >
								<h4>&nbsp; ????????? ????????????</h4>
							</div>
						</div>
						<!-- ?????? ?????? -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								?????????</span>
							</div>
							<input id="StoreName" type="text" name="StoreName"
								placeholder="Store name"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- ?????? ?????? -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-phone-square text-muted"></i>
								?????? ????????????</span>
							</div>
								<input id="telNumber" type="tel" name="tel"
								placeholder="Store Tel"
								class="form-control bg-white border-md border-left-0 pl-3">
						</div>

						<!-- ????????? ?????? -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								????????? ??????</span>
							</div>
							<input id="name" type="text" name="name"
								placeholder="name"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- ????????? Phone Number -->
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

						<!-- ????????? ???????????? -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								????????? ????????????</span>
							</div>
							<input id="StoreRegisterNo" type="text" name="StoreRegisterNo"
								placeholder="????????? ????????????"
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
								<button type="button" id="authEmailBtn" class="btn btn-primary" disabled="true">????????? ??????</button>
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
				    						$('#emailCheck').text("???????????? ???????????? ???????????????.").css('color','#E54F4F');
				    					} else {
				    						$('#emailCheck').text("?????? ????????? ??????????????????.").css('color','#0093FF');
				    						$('#authEmailBtn').attr('disabled', false);
				    					}
				    				},
				    				error: function(xhr, status, error){
				    					console.log(error);
				    				}
								});
							});
						</script>
						
						<!-- ???????????? ?????? -->
						<div class="input-group col-lg-6">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i> ????????????
								</span>
							</div>
							<input id="authKey" type="text" name="authKey" class="form-control bg-white border-left-0 border-md">
							<button type="button" id="authKeyBtn" class="btn btn-primary" disabled="true">?????? ??????</button>
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
								?????? ??????</span>
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
								????????????</span>
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
								???????????? ??????</span>
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
									$('#passwordCheck').text('??????????????? ???????????????.').css('color','#0093FF');
								} else {
									$('#passwordCheck').text('??????????????? ???????????? ????????????.').css('color','#E54F4F');
								}
							});
						</script>

						<!-- ????????? ?????? -->
						<!-- <div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								?????????</span>
							</div>
							<select id="adType" name="adType"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="0">????????? ??????</option>
								<option value="super">??????(?????? ????????? ??????)</option>
								<option value="common">??????(?????? ??????x)</option>
							</select>
						</div> -->
						<!-- location -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								?????? ?????? ??????</span>
							</div>
							<select id="location" name="location"
								class="form-control custom-select bg-white border-left-0 border-md">
							</select>
						</div>

						<!-- Already Registered -->
						<div class="form-group col-lg-8" align="right">
							<p class="text-muted font-weight-bold" >
								?????? ??????????????????? <a href="${ pageContext.servletContext.contextPath }/member/loginpage">Login</a>
							</p>
						</div>

						<!-- Submit Button -->
						<div class="form-group col-lg-4" align="right">
							<button type="submit" style="background : #0093FF; color : white; border : none; border-radius : 5px 5px 5px 5px;">????????????</button>
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

						            // ????????????
						            // 2?????? ??????, ?????????
						            if(!chk(/^[???-???]{2,}$/,name,"????????? ??????????????????.")){
						                return false;
						            }
						            
						            // ?????? ???????????? ??????
						            if(storeTel == "") {
						            	alert('?????? ??????????????? ??????????????????.')
						            	return false;
						            }

						            // ???????????? ?????? 010 - xxxx - xxxx
						            if(!chk(/^010$/,phone1,"??????????????? ??????????????????.")){
						                return false;
						            }
						            if(!chk(/^[0-9]{4}$/,phone2,"??????????????? ??????????????????.")){
						                return false;
						            }
						            if(!chk(/^[0-9]{4}$/,phone3,"??????????????? ??????????????????.")){
						                return false;
						            }
						            
						            if(storeName == "") {
										alert("???????????? ??????????????????.");
										return false;
									}
						            
						            if(StoreRegisterNo == "") {
						            	alert('????????? ??????????????? ??????????????????.')
						            	return false;
						            }
						            
						            if(StoreRegisterNo.length != 10) {
						            	alert('????????? ??????????????? ??????????????????.')
						            	return false;
						            }
						            
						            if(!chk(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/,email,"????????? ????????? ???????????????.")){
						                return false;
						            }
						            
						            if(emailCheck == '???????????? ???????????? ???????????????.') {
						            	alert('???????????? ??????????????????.');
						            	return false;
						            }
									
						            if(birthday == "") {
						            	alert('??????????????? ??????????????????.');
						            	return false;
						            }
						            
						            if(address == "") {
						            	alert('????????? ??????????????????.');
						            	return false;
						            }
						            
						            if(location == '0') {
										alert('??????????????? ??????????????????.');
										return false;
									}
						            
						            // ???????????? ????????????
						            if(password != password2){
						                alert("??????????????? ??????????????????.");
						                return false;
						            }
						            
						            if(!checked){
										alert('????????? ??????????????????.');
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
						            
						            alert('??????????????? ?????????????????????!')

								}
						          
								const formtag = document.getElementById("form");

								// ????????? ??????, ????????? ?????? ??????
								function handleSubmit(event) {
								  event.preventDefault()
								}
							
						</script>
					</div>
				</form>
                
                <div class="row" >
					<div class="col-lg-12" style="padding-top: 5%;">
						<a href="${ pageContext.servletContext.contextPath }" > 
							<span> <- ??????????????? ????????????</span>
						</a>
					</div>	
				</div>
			</div>
		</div>
    </div>
</body>
</html>