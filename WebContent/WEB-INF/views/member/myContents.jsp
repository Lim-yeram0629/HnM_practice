<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					$.ajax({
						url : "${ pageContext.servletContext.contextPath }/member/mypage/deleteContents",
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
						error : function(xhr, status,
								error) {
							alert("게시물 삭제에 실패하였습니다.");
							console.log(error);
						}
					});
				}
			} else {
				alert('삭제할 게시물을 선택해 주세요.');
			}
		});

		$('#allCheck').click(function() {
			if ($('#allCheck').prop('checked')) {
				$('.checkPostNo').each(function(index, item) {
					$(this).prop('checked', true);
				});
			} else {
				$('.checkPostNo').each(function(index, item) {
					$(this).prop('checked', false);
				});
			}
		});

		$('#sortValue').change(function() {
			$('#searchForm').submit();
		});

		
		$('td').on('click', function(){
			let postNo = $(this).parent().prev().val();
			console.log(postNo);
			location.href = "${ pageContext.servletContext.contextPath }/board/etc_posting_board?postNo=" + postNo;
		});
		
	});
	
</script>
</head>
<body>
	<jsp:include page="header_myPage.jsp" />

	<section style="padding-left: 110px;">
		<div class="container" style="padding-left: 30px;">
			<br>
			<div class="row" style="align-items: center;">
				<div class="col-md-12">
					<h3 align="center">내 게시물</h3>
				</div>
				<div class="col-md-10" style="margin-top: 10px;">
					<div class="row">
						<form id="searchForm" method="get"
							action="${ pageContext.servletContext.contextPath }/member/mypage/myContents">
							<div class="col-md-3">
								<select id="sortValue" name="sortValue" class="postBtn_group"
									style="padding: 2px">
									<option value="">게시물 정렬</option>
									<option value="postDateDESC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "postDateDESC"? "selected": "" }>최신순</option>
									<option value="postDateASC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "postDateASC"? "selected": "" }>오래된순</option>
									<option value="cntLike"
										${ requestScope.pageNumberingAndSearching.sortValue eq "cntLike"? "selected": "" }>추천순</option>
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
						<button type="button" id="deleteBtn" class="postBtn_group">글삭제</button>
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
							<th class="thStyle" width="5%">전체 <input type="checkbox"
								id="allCheck"></th>
							<th class="thStyle" width="5%">글번호</th>
							<th class="thStyle" width="10%">작성일자</th>
							<th class="thStyle" width="50%">제목</th>
							<th class="thStyle" width="10%">게시판</th>
							<th class="thStyle" width="5%">추천수</th>
							<th class="text-end" width="5%"><span>조회수</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="postContents" items="${requestScope.myPostList }">
							<c:set var="boardNo"
								value="${ fn:substring(postContents.boardCode, 0, 1) }" />
							<input type="hidden" value='${ postContents.postNo }'>
							<tr>
								<th><input type="checkbox" class="checkPostNo"
									value="<c:out value = '${ postContents.postNo }'/>"></th>
								<td ><c:out value="${ postContents.postNo }" /></td>
								<td><c:out value="${ postContents.postDate }" /></td>
								<td id="content"><a href="#" style="Color: black"><i
										class="fa fa-check-circle-o green"></i><span class="ms-1"><c:out
												value="${ postContents.postTitle }" /></span></a></td>
								<td id="boardName"><c:choose>
										<c:when test="${ boardNo eq '1'}">이모저모</c:when>
										<c:when test="${ boardNo eq '2'}">꿀Tip</c:when>
										<c:when test="${ boardNo eq '3'}">동네가게</c:when>
									</c:choose></td>
								<td><c:out value="${ postContents.cntLike }" /></td>
								<td class="text-end"><span class="fw-bolder">${ postContents.cntView }</span>
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