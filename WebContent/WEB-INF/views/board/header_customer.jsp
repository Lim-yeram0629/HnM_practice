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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
		console.log('${ pageContext.request.requestURL }');
		let currentURL = "${ pageContext.request.requestURL }";
		jspPage = currentURL.split('/');
		jspPage = jspPage[jspPage.length-1];
		console.log(jspPage);
	
		$(function(){
		
		switch(jspPage){
		case "customercenter_notice_board_draft.jsp": 
			$('#notice').css('background-color','#FFEDBD');
			break;
		case "customercenter_qna_draft.jsp": 
			$('#qna').css('background-color','#FFEDBD');
			break;
		case "customercenter_HnM_introduce_draft.jsp": 
			$('#hnm').css('background-color','#FFEDBD');
			break;
		case "customercenter_1km_introduce_draft.jsp": 
			$('#introduce_1km').css('background-color','#FFEDBD');
			break;
		}
		
	});
</script>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
		<!-- 사이드바-->
		<div class="sidebar-container">
			<div class="sidebar-logo">Honey-tip & Meeting</div>
			<ul class="sidebar-navigation">
				<li class="header">고객 센터</li>
				<li><a href="${ pageContext.servletContext.contextPath }/board/customerpage" id="notice"> <i
						 class="fa fa-modifyInfo" aria-hidden="true"></i> 공지사항
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/board/customerpage/qna"  id="qna"> <i class="fa fa-myContents"
						aria-hidden="true"></i> 자주 묻는 질문
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/board/customerpage/hnm"  id="hnm"> <i
						class="fa fa-scrapContents" aria-hidden="true"></i> HnM 소개
				</a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/board/customerpage/introduce_1km"  id="introduce_1km"> <i class="fa fa-myFriends"
						aria-hidden="true"></i> 1KM TEAM 소개
				</a></li>
			</ul>
		</div>
	</header>
</body>
</html>