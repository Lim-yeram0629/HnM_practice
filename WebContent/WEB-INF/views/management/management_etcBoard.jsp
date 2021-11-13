<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body style="background: #FFEDBD;">
   <header>
      <jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
   </header>
   <section>


		<!-- 게시판 구성부 -->
		<br>
		<!--글정렬 드롭 박스  http://bootstrapk.com/components/#btn-groups -->
		<div class="col-md-3" style="margin-top: 10px;" align="right">
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
		<div class="boardtitle2 col-md-6">
			<h3>우리동네 이모저모</h3>
		</div>
		<div class="boardtitle3">
		</div>


      <br> <br> <br>

      <div class="container mt-5 px-2"
         style="background-color: white; border-radius: 2rem;">
         <div class="mb-2 d-flex justify-content-between align-items-center">

			</div>
			<div class="table-responsive" style="text-align: center;">
				<table class="table table-responsive table-borderless"
					style="text-align-last: center;">
					<thead>
						<tr class="bg-light">
							<th scope="col" width="5%">글번호</th>
							<th scope="col" width="10%">작성일자</th>
							<th scope="col" width="55%">제목</th>
							<th scope="col" width="10%">작성자</th>
							<th scope="col" width="10%">추천수</th>
							<th scope="col" class="text-end" width="10%"><span>조회수</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="postContents" items="${requestScope.postList }">
							<tr>
								<td><c:out value="${ postContents.postNo }" /></td>
								<td><c:out value="${ postContents.postDate }" /></td>
								<td><a href="#" style="Color: black"><i
										class="fa fa-check-circle-o green"></i><span class="ms-1"><c:out
												value="${ postContents.postTitle }" /></span></a></td>
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
					let postNo = this.parentNode.children[0].innerText;
					console.log(postNo);
					location.href = "${ pageContext.servletContext.contextPath }/management/post?postNo=" + postNo;
				} 
			}
		}
		
		$('#sortValue').change(function(){
			$('#searchForm').submit();
		});
	</script>


   <!-- Footer -->
   <jsp:include page="../common/footer.jsp" />


</body>

</html>