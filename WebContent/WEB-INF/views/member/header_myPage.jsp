<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script>
		console.log('${ pageContext.request.requestURL }');
		let currentURL = "${ pageContext.request.requestURL }";
		jspPage = currentURL.split('/');
		jspPage = jspPage[jspPage.length-1];
		console.log(jspPage);
	$(function(){
		
		switch(jspPage){
		case "modify_info.jsp": 
			$('#modifyInfo').css('background-color','#FFEDBD');
			break;
		case "myContents.jsp": 
			$('#myContents').css('background-color','#FFEDBD');
			break;
		case "scrapContents.jsp": 
			$('#scrapContents').css('background-color','#FFEDBD');
			break;
		case "myFriends.jsp": 
			$('#myFriends').css('background-color','#FFEDBD');
			break;
		case "blockFriends.jsp": 		
			$('#blockFriends').css('background-color','#FFEDBD');
			break;
		}
		
	});
	
	$(function(){
		$('#updatePassword').click(function(){
			$('#updatePassword').css('background-color','#FFEDBD');
			$('#deActicateModal').modal('toggle');
		});
	});
	
	function checkPassword(){
		let password = $('#password').val();
		console.log(password);
		$.ajax({
			url : "${ pageContext.servletContext.contextPath }/member/updatePassword2",
			type : "post",
			data: { password : password },
			success : function(data,textStatus, xhr) {
				if(data > 0){
					location.href="${ pageContext.servletContext.contextPath }/member/updatePassword?"
																	+ "email=${ sessionScope.loginUser.email }";
				}else{
					alert('비밀번호가 일치 하지 않습니다.');
				}
			},
			error : function(xhr, status, error) {
				alert(data);
				console.log(error);
			}
		});
		$('#password').val("");
	}
</script>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
		<!-- 사이드바-->
		<div class="sidebar-container">
			<div class="sidebar-logo">Honey-tip & Meeting</div>
			<ul class="sidebar-navigation">
				<li class="header">My Page</li>
				<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/modifyInfo" id="modifyInfo"> <i
						 class="fa fa-modifyInfo" aria-hidden="true"></i> 회원정보수정
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/myContents"  id="myContents"> <i class="fa fa-myContents"
						aria-hidden="true"></i> 나의게시물
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/scrapContents"  id="scrapContents"> <i
						class="fa fa-scrapContents" aria-hidden="true"></i> 스크랩한 게시물
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/myFriends"  id="myFriends"> <i class="fa fa-myFriends"
						aria-hidden="true"></i> 관심 친구 목록
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/member/mypage/blockFriends"  id="blockFriends"> <i
						class="fa fa-blockFriends" aria-hidden="true"></i> 차단한 친구 목록
				</a></li>
				<li><a id="updatePassword"> <i
						class="fa fa-findPassword" aria-hidden="true"></i> 비밀번호 변경
				</a></li>
			</ul>
		</div>
	</header>
	
		<!-- 탈퇴 모달창 -->
  <div class="modal-dialog modal-dialog-scrollable">
	<div class="modal" tabindex="-1" id="deActicateModal">
		<div class="modal-dialog" >
		  <div class="modal-content" > 
			<div class="modal-header">
			  <h5 class="modal-title" ><b>비밀번호 확인</b></h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body" >
				<!-- 비밀번호 -->
				<div class= "row" style= "padding:5%">
					<div class="input-group col-lg-12 mb-4">
						<div class="input-group-prepend">현재 비밀번호 입력</div>
						<input id="password" type="password" name="password"
							class="form-control bg-white border-left-0 border-md">
					</div>
				</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="checkPassword();">확인</button>
			  </div>
		  </div>
		</div>
	  </div>
	</div>
</body>
</html>