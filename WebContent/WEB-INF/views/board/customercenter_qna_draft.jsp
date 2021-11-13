<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<style>
	</style>
</head>

<style>
.postBtn_group {
	border: 5px solid rgb(255, 215, 128);
	background-color: rgba(255, 215, 128);
	border-radius: 0.5rem;
}

.thStyle {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {

		$('#sortValue').change(function() {
			$('#searchForm').submit();
		});

	});
	
		function movePost(item){
			let postNo = $(item.previousElementSibling).val();
			location.href = "${ pageContext.servletContext.contextPath }/board/etc_posting_board?postNo=" + postNo;
		}
</script>

<body style="background: #FFEDBD;">
	<header>
		<jsp:include page="/WEB-INF/views/board/header_customer.jsp"></jsp:include>
	</header>

<section style="padding-left: 110px;">
		<div class="container" style="padding-left: 30px;">
			<br>
			<div class="row" style="align-items: center;">
				<div class="col-md-12">
					<h3 align="center">자주 묻는 질문</h3>
				</div>
				<div class="col-md-10" style="margin-top: 10px;">
					<div class="row">
						<form id="searchForm" method="get"
							action="${ pageContext.servletContext.contextPath }/board/customerpage/qna">
							<div class="col-md-3">
								<select id="sortValue" name="sortValue" class="postBtn_group"
									style="padding: 2px">
									<option value="">게시물 정렬</option>
									<option value="postDateDESC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "postDateDESC"? "selected": "" }>최신순</option>
									<option value="postDateASC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "postDateASC"? "selected": "" }>오래된순</option>
									<option value="cntView"
										${ requestScope.pageNumberingAndSearching.sortValue eq "cntView"? "selected": "" }>조회순</option>
								</select>
							</div>
							<div class="position-relative">
								<span class="position-absolute search"><i
									class="fa fa-search"></i></span> <input type="hidden"
									name="currentPage" value="1"> <input type="hidden"
									name="searchCondition" value="title">
								<div class="col-md-8" align="right">
									<input type="search" name="searchValue" class="form-control"
										placeholder="🔍 제목을 입력하세요"
										value="<c:out value = "${ requestScope.pageNumberingAndSearching.searchValue }"/>"
										style="background-color: white; width: 500px;">
								</div>
								<div class="col-md-1" align="left">
									<button id="submitBtn" class="postBtn_group" type="submit"
										style="float: left">검색</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="col-md-2">
					<div class="boardtitle3" align="right" style="margin-top: 10px;">
					</div>
				</div>
			</div>
			<br>
			<!-- 게시판 -->
			<div class="table-responsive"
				style="min-height: 580px; padding: 10px; border-radius: 1rem; text-align: center; background-color: white;">
				<table class="table table-responsive table-borderless">
					<thead>
						<tr class="bg-light">
							<th class="thStyle" width="10%">작성일자</th>
							<th class="thStyle" width="70%">제목</th>
							<th class="thStyle" width="10%">작성자</th>
							<th class="text-end" width="5%"><span>조회수</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qna" items="${requestScope.qnaList }">
							<input type="hidden" value='${ qna.postNo }'>
							<tr onclick="movePost(this)" >
								<td><c:out value="${ qna.postDate }" /></td>
								<td><c:out value="${ qna.postTitle }" /></td>
								<td>관리자</td>
								<td class="text-end"><span class="fw-bolder">${ qna.cntView }</span>
									<i class="fa fa-ellipsis-h ms-2"></i></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 검색  -->
				<jsp:include page="../common/paging.jsp" />
				<br> <br> <br>
			</div>
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