<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
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
	display: contents;
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


		<!-- 게시판  -->
		<br>
		
		<div class="boardtitle2">
			<h3>신고게시물</h3>
		</div>
		<div class="boardtitle3">
			<button type="button" class="btn btn-default">글삭제</button>
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
							<th scope="col" width="15%">작성자</th>
							<th scope="col" width="15%">신고자</th>
							<th scope="col" class="text-end" width="15%"><span>처리여부</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="postContents" items="${ requestScope.postList }">
							<tr>
								<td scope="row"><input class="form-check-input"
								type="checkbox"></td>
								<td data-toggle="modal" data-target="#registerModal"><c:out value="${ postContents.POST_NO }" /></td>
								<td data-toggle="modal" data-target="#registerModal"><c:out value="${ postContents.POST_DATE }" /></td>
								<td data-toggle="modal" data-target="#registerModal"><c:out value="${ postContents.POST_TITLE }" /></td>
								<td data-toggle="modal" data-target="#registerModal"><c:out value="${ postContents.EMAIL }" /></td>
								<td data-toggle="modal" data-target="#registerModal"><c:out value="${ postContents.reportEmail }" /></td>
								<td class="text-end" data-toggle="modal" data-target="#registerModal"><span class="fw-bolder">N</span> <i
								class="fa fa-ellipsis-h ms-2"></i></td>
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
					action="${ pageContext.servletContext.contextPath }/management/custReport"
					method="get">
					<div class="col-fd-3" style="margin-top: 10px; position: absolute; top: 200px;" >
						<select id="sortValue" name="sortValue" class="postBtn_group"
							style="padding: 2px">
							<option value="">게시물 정렬</option>
							<option value="postDateDESC"
								${ requestScope.pageNumberingAndSearching.sortValue eq "postDateDESC"? "selected": "" }>최신순</option>
							<option value="postDateASC"
								${ requestScope.pageNumberingAndSearching.sortValue eq "postDateASC"? "selected": "" }>오래된순</option>
						</select>
					</div>
					
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
		
	    <!-- 모달창 -->
	    <div class="modal-dialog modal-dialog-scrollable">
	       <div class="modal" tabindex="-1" id="registerModal">
	          <div class="modal-dialog">
	             <div class="modal-content">
	                <div class="modal-header">
	                   <h5 class="modal-title">신고 게시물</h5>
	                   <button type="button" class="close" data-dismiss="modal"
	                      aria-label="Close">
	                      <span aria-hidden="true">&times;</span>
	                   </button>
	                </div>
	                <h4>&nbsp;게시물 내용</h4>
	                <div class="modal-body">
		                  <pre id="reportCon"></pre>
	                </div>
                    <h4>&nbsp;신고 사유</h4>
	                <div class="modal-body">
	                		<pre id="reportRes"></pre>
	                </div>
	                <div class="modal-footer">
	                   <button type="button" class="btn btn-secondary"
	                      data-dismiss="modal" onclick="modiaccept('N')">반려</button>
	                   <button type="button" class="btn btn-primary"
	                      data-dismiss="modal" id="agreeBtn" onclick="modiaccept('Y')">처리</button>
	                </div>
	             </div>
	          </div>
	       </div>
	    </div>
		<input type="hidden" id="storage">
		<input type="hidden" id="cautionEmail"/>
		<c:set var="reportc" value="${ requestScope.reportList }"/>
		<script>
			function modiaccept(msg) {
				let postNo = $('#storage').val();
				let cautionEmail = $('#cautionEmail').val();
				$.ajax({
					url: '/1km/management/custReport',
					data: { 
						msg : msg,
						postNo : postNo,
						cautionEmail : cautionEmail
					},
					type: 'post',
					success: function(data) {
						alert(data);
						window.location.reload();
					}
				});
			}
			
			if(document.getElementsByTagName("td")) {
				
				const $tds = $('td');
				for(let i = 0; i < $tds.length; i++) {
					
					
					$tds[i].onclick = function() {
						let postNo = this.parentNode.children[1].innerText;
						let p = $('#reportCon');
						let p2 = $('#reportRes');
						p2.text('');
						<c:forEach items="${ requestScope.postList }" var="postc" varStatus="status">
							if(postNo == ${ postc.POST_NO }) {
								p.text('${ postc.POST_CONTENTS }');
							}
						</c:forEach>
						<c:forEach items="${ reportc }" var="re">
							if(this.parentNode.children[5].innerText == '${ re.email }' && postNo == ${ re.postNo }) {
								p2.append('${ re.report }' + '\n');
								$('#cautionEmail').val(this.parentNode.children[5].innerText);
							}
						</c:forEach>
						
						$('#storage').val(postNo);
						
					} 
				}
			}
			
			$('#sortValue').change(function(){
				$('#searchForm').submit();
			});
		</script>
	</section>

	<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />



</body>
</html>