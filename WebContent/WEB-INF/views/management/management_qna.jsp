<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>

/* 게시판 테스트 */
th {
	text-align: center;
}

.boardtitle1 {
	padding-left: 10%;
	float: left;
	width: 33%;
	height: 5%;
}

.boardtitle2 {
	padding-top: 0px;
	margin: 0px;
	float: left;
	width: 33%;
	height: 5%;
	text-align: center;
}

.boardtitle3 {
	padding-right: 10%;
	float: right;
	width: 33%;
	height: 5%;
	text-align: right;
}

/* margin-left:20px; margin-bottom: 50px;  */
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
		case "ManagementCustServiceCenterServlet.jsp": 
			$('#custServiceCenter').css('background-color','#FFEDBD');
			break;
		case "management_member_blacklist.jsp": 
			$('#qna').css('background-color','#FFEDBD');
			break;
		}
		
		$('#deleteBtn').click(function() {
			const postNoArr = new Array();
			$('.checkPostNo').each(function(index, item) {
				if ($(this).prop('checked')) {
					postNoArr.push($(this).val());
				}
			});
			console.log(postNoArr);

			if (postNoArr.length > 0) {
				if (confirm('선택한 게시물을 정말로 삭제하시겠습니까?')) {
					$
							.ajax({
								url : "${ pageContext.servletContext.contextPath }/management/deletePost",
								type : "get",
								data : {
									"postNoArr" : postNoArr
								},
								success : function(data,
										textStatus, xhr) {
									alert("총 " + data
											+ "개의 게시물을 삭제했습니다.");
									location.reload();
								},
								error : function(xhr, status, error) {
									alert("게시물 삭제에 실패하였습니다.");
									console.log(error);
								}
							});
				}
			} else {
				alert('삭제할 게시물을 선택해 주세요.');
			}
		});
		
	});

</script>
</head>
<body style="background: #FFEDBD;">
	<header>
		<jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
		<!-- 사이드바-->
		<div class="sidebar-container">
			<div class="sidebar-logo">Honey-tip & Meeting</div>
			<ul class="sidebar-navigation">
				<li class="header">고객센터</li>
				<li><a href="${ pageContext.servletContext.contextPath }/management/custServiceCenter" id="custServiceCenter"> 
					<i class="fa fa-modifyInfo" aria-hidden="true"></i> 공지사항 </a></li>
				<li><a href="${ pageContext.servletContext.contextPath }/management/qna"  id="qna"> 
					<i class="fa fa-myContents" aria-hidden="true"></i> 자주 묻는 질문 </a></li>
			</ul>
		</div>
	</header>

	<section style="padding-left: 10%;">
		<!-- 게시판  -->
		<br>
		<!--글정렬 드롭 박스  http://bootstrapk.com/components/#btn-groups -->
		<div class="btn-group"
			style="float: left; width: 30%; padding-left: 6%;">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown" aria-expanded="false">
				글정렬 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">정확성순</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="#">오래된순</a></li>
				<!-- <li class="divider"></li>
          <li><a href="#">Separated link</a></li> -->
			</ul>
		</div>
		<div class="boardtitle2">
			<h3>자주 묻는 질문</h3>
		</div>
		<div class="boardtitle3">
			<button type="button" class="btn btn-default" id="deleteBtn">글삭제</button>
			<button type="button" class="btn btn-default" onclick="location.href='${ pageContext.servletContext.contextPath }/management/posting?boardCode=5_L0'">글 작성</button>
		</div>

		<br>
		<br>
		<br>

		<div class="container mt-5 px-2"
			style="background-color: white; border-radius: 2rem;">
			<div class="mb-2 d-flex justify-content-between align-items-center">


			</div>
			<div class="table-responsive" style="text-align: center;">
				<table class="table table-responsive table-borderless" style="text-align-last: center;">
					<thead>
						<tr class="bg-light">
							<th scope="col" width="5%">삭제</th>
							<th scope="col" width="5%">글번호</th>
							<th scope="col" width="10%">작성일자</th>
							<th scope="col" width="50%">제목</th>
							<th scope="col" width="10%">작성자</th>
							<th scope="col" width="10%">추천수</th>
							<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="postContents" items="${requestScope.postList }">
							<tr>
								<th scope="row"><input class="form-check-input checkPostNo"
								type="checkbox" value="${ postContents.postNo }"></th>
								<td><c:out value="${ postContents.postNo }" /></td>
								<td><c:out value="${ postContents.postDate }" /></td>
								<td><c:out value="${ postContents.postTitle }" /></td>
								<td><c:out value="${ postContents.email }" /></td>
								<td><c:out value="${ postContents.cntLike }" /></td>
								<td class="text-end"><span class="fw-bolder">${ postContents.cntView }</span>
									<i class="fa fa-ellipsis-h ms-2"></i></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--페이지 네이션 http://bootstrapk.com/components/#%ED%81%AC%EA%B8%B0-%EC%A1%B0%EC%A0%88 -->
				<jsp:include page="../common/paging.jsp" />
			</div>
			<br>
			<!-- 검색  -->
			<div class="position-relative">
				<span class="position-absolute search"><i
					class="fa fa-search"></i></span>
				<form id="searchForm"
					action="${ pageContext.servletContext.contextPath }/board/etcpage"
					method="get">
					<input type="hidden" name="currentPage" value="1"> <input
						type="hidden" name="searchCondition" value="title">
					<div class="col-md-9" align="right">
						<input type="search" name="searchValue" class="form-control"
							placeholder="🔍검색어를 입력하세요"
							value="<c:out value = "${ requestScope.PageNumberingAndSearching.searchValue }"/>"
							style="background-color: white; width: 500px;">
					</div>
					<div class="col-md-3" align="left">
						<button class="postBtn_group" type="submit" style="float: left">검색</button>
					</div>
				</form>
			</div>
			<br> <br>
		</div>
	</section>
	<script>
		
		if(document.getElementsByTagName("td")) {
			
			const $tds =$('td');
			for(let i = 0; i < $tds.length; i++) {
				
			
				  $tds[i].onclick = function() {
					let postNo = this.parentNode.children[1].innerText;
					console.log(postNo);
					location.href = "${ pageContext.servletContext.contextPath }/management/post?postNo=" + postNo + "&boardCode=5_L0";
				} 
			}
		}
		
	</script>
	<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />



</body>
</html>