<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script>
		console.log('${ pageContext.request.requestURL }');
		let currentURL = "${ pageContext.request.requestURL }";
		jspPage = currentURL.split('/');
		jspPage = jspPage[jspPage.length-1];
		console.log(jspPage);
	$(function(){
		
		switch(jspPage){
		case "management_member_all.jsp": 
			$('#memberAll').css('background-color','#FFEDBD');
			break;
		case "management_member_blacklist.jsp": 
			$('#blacklist').css('background-color','#FFEDBD');
			break;
		}
		
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
		<!-- 사이드바-->
		<div class="sidebar-container">
			<div class="sidebar-logo">Honey-tip & Meeting</div>
			<ul class="sidebar-navigation">
				<li class="header">회원관리</li>
				<li><a href="${ pageContext.servletContext.contextPath }/management/memberAll" id="memberAll"> 
					<i class="fa fa-modifyInfo" aria-hidden="true"></i> 전체 사용자 </a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/management/blacklist"  id="blacklist"> 
					<i class="fa fa-myContents" aria-hidden="true"></i> 블랙 리스트 </a></li>
			</ul>
		</div>
	</header>

</body>
</html>

