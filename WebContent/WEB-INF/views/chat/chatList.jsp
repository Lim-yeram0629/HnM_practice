<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/chat.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
	<section>
	<br>
		<div class="container">
			<div class="row clearfix">
				<div class="col-lg-12">
					<div class="card chat-app">
						<div id="plist" class="people-list">
							
							<h5>채팅방</h5>
							<ul class="list-unstyled chat-list mt-2 mb-0">
							<c:forEach var="chatList" items="${ requestScope.chatList }">
								<li class="clearfix chatFR">
									<img src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/${ chatList.PROFILE_PATH }"
										alt="avatar">
									<div class="about">
										<div class="name">${ chatList.NICKNAME }</div>
										<input type="hidden" id="chatCode" value="${ chatList.CHAT_CODE }">
										<input type="hidden" id="frEmail" value="${ chatList.EMAIL }">
										<input type="hidden" id="profilePath" value="${ chatList.PROFILE_PATH }">
										<c:forEach var="frList" items="${ requestScope.likedFR }">
											<c:if test="${ chatList.EMAIL eq frList }">
												<div class="status">
													<i class="fa fa-circle online"></i> 관심친구
												</div>
											</c:if>
										</c:forEach>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
						<script>
							$(function(){
								if($('#FRnick').text() == "" || $('#FRnick').text() == null) {
									$('#proA').css('display','none');
								}
							});
						
							let myEmail = '${ sessionScope.member.email }';	
						
							$('.chatFR').on('click', function() {
								$('#proA').css('display','block');
								let nick = $(this).children().eq(1).children().eq(0).text();
								$('#FRnick').text(nick);
								let frem = $(this).children().eq(1).children().eq(2).val();
								$('#frEmail2').val(frem);
								let chatCode = $(this).children().eq(1).children().eq(1).val();
								$('#chatCode2').val(chatCode);
								let profilePath = $(this).children().eq(1).children().eq(3).val();
								$('#pro2').attr('src', "${ pageContext.servletContext.contextPath }/resources/upload/profiles/" + profilePath);
								
								let chatinterval = setInterval(function() {
									console.log('restart');
									chatListFunction(chatCode);
									if(nick != $('#FRnick').text()) {
										clearInterval(chatinterval);
									}
								} , 500);
							})
							
							function chatListFunction(chatCode) {
								
								$.ajax({
									url: "${ pageContext.servletContext.contextPath }/chat/one",
									type: 'post',
									data: { chatCode : chatCode },
									success: function(data) {
										console.table(data);
										$('#chatBox').html('');
										for(let i = 0; i < data.length; i++){
											if(data[i].myEmail == '${ sessionScope.member.email }') {
												$('#chatBox').append(
														'<li class="clearfix">'	+
														'<div class="message-data text-right">' +
														'<span class="message-data-time">' +
														data[i].chatTime +
														'&nbsp;</span>' +
														'<img src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/${sessionScope.member.profilePath}" alt="avatar">' +
														'</div>' +
														'<div class="message other-message float-right">' +
														data[i].chatContents +
														'</div>' +
														'</li>'
													);
											} else {
												$('#chatBox').append(
														'<li class="clearfix">'	+	
														'<div class="message-data">' +
														'<img src="' + $('#pro2').attr('src') + '" alt="avatar">' +
														'<span class="message-data-time">' +
														data[i].chatTime +
														'</span>' +
														'</div>' +
														'<div class="message my-message">' +
														data[i].chatContents +
														'</div>' +
														'</li>'
													);
											}
										}
										
										$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
									}
								});
							}
						</script>
						<div class="chat">
							<div class="chat-header clearfix">
								<div class="row">
									<div class="col-lg-6">
										<a href="javascript:void(0);" data-toggle="modal"
											data-target="#view_info" id="proA"> 
										<img src="${ pageContext.servletContext.contextPath }/resources/upload/profiles/profile.png"
											alt="avatar" id="pro2">
										</a>
										<div class="chat-about">
											<h6 class="m-b-0" id="FRnick"></h6>
											<input type="hidden" id="frEmail2">
											<input type="hidden" id="chatCode2">
										</div>
									</div>
								</div>
							</div>
							<div class="chat-history">
								<ul class="m-b-0" id="chatBox">
									
								</ul>
							</div>
							<div class="chat-message">
								<div class="input-group col-md-12 mb-0">
									<span class="input-group"><i class="fa fa-send"></i></span>
									<div style="display: flex;">
										<input type="text" class="form-control"
											placeholder="Enter text here..." id="sendMessage" onKeypress="javascript:if(event.keyCode==13) {insertMsg();}">
										<button type="button" style="width:40px;" onclick="insertMsg();">전송</button>
									</div>
									<script>
										
										function insertMsg() {
											let msg = $('#sendMessage').val();
											let frEmail = $('#frEmail2').val();
											let chatCode = $('#chatCode2').val();
											
											/* 차단 체크 */
											<c:forEach var="b" items="${ requestScope.blockedFR }">
												if(${ b } == frEmail) {
													alert('차단당한 상대입니다.');
													return;
												}
											</c:forEach>
											
											if(msg != null || msg.trim() != '') {
												$.ajax({
													url: '/1km/chat/send',
													type: 'post',
													data: {
														msg : msg,
														frEmail : frEmail,
														chatCode : chatCode
													},
													success: function(data) {
														$('#sendMessage').val('');
														console.log(data);
													}
												});
											}
										}
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>