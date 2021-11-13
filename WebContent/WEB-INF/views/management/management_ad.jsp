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

.postBtn_group {
	border: 5px solid rgb(255, 215, 128);
	background-color: rgba(255, 215, 128);
	border-radius: 0.5rem;
}

.thStyle {
	text-align: center;
}

/* margin-left:20px; margin-bottom: 50px;  */
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
		function openAdModal(item){
			let adNegative = item.previousElementSibling.previousElementSibling.previousElementSibling.value;
			let postContents = item.previousElementSibling.previousElementSibling.value;
			let postNo = item.previousElementSibling.value;
			let adNo = item.children[0].innerText;
			let postDate = item.children[1].innerText;
			let writer = item.children[2].innerText;
			let postTitle = item.children[3].innerText;
			let accepted = item.children[6].innerText;
			
			console.log(postNo + ", " + postContents);
			console.log(postDate + ", " + writer + ", " + postTitle);
			
			$('#title').html(postTitle);
			$('#writer').html(writer);
			$('#date').html(postDate);
			$('#contents').html(postContents);
			$('#adNo').val(adNo);
			$('#postNo').val(postNo);
			
			if(accepted == 'Y'){
				$('#addBtn').prop('disabled', true);
			}
			
			if(accepted == 'N'){
				$('#reason').val(adNegative);
				$('#rejectBtn').prop('disabled', true);
				$('#reason').prop('readonly', true);
			}
			
			$('#adModal').modal('toggle');
		}
		
		function updateAccepted(item){
			let adNo = $('#adNo').val();
			let reason = $('#reason').val();
			console.log(postNo + ", " + reason);
			
			$.ajax({
				url : "${ pageContext.servletContext.contextPath }/managemet/adProcess",
				type : "post",
				data : {
					adNo : adNo,
					reason : reason
				},
				success : function(data,textStatus, xhr) {
					alert(data);
					location.reload();
				},
				error : function(xhr, status, error) {
					alert(data);
					console.log(error);
				}
			});
		}
		
		function updateAdPost(item){
			let adNo = $('#adNo').val();
			let postNo = $('#postNo').val();
			console.log(postNo);
			
			$.ajax({
				url : "${ pageContext.servletContext.contextPath }/managemet/adProcess",
				type : "get",
				data : {
					adNo : adNo,
					postNo : postNo
				},
				success : function(data,textStatus, xhr) {
					alert(data);
					location.reload();
				},
				error : function(xhr, status, error) {
					alert(data);
					console.log(error);
				}
			});
		}
		
		$(function(){
			$('#sortValue').change(function() {
				$('#searchForm').submit();
			});
		});
		
</script>
</head>
<body style="background: #FFEDBD;">
		<jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
	<section>
				<div class="container" style="padding-left: 30px;">
			<br>
			<div class="row" style="align-items: center;">
				<div class="col-md-12">
					<h3 align="center">광고 관리</h3>
				</div>
				<div class="col-md-10" style="margin-top: 10px;">
					<div class="row">
						<form id="searchForm" method="get"
							action="${ pageContext.servletContext.contextPath }/management/ad">
							<div class="col-md-3">
								<select id="sortValue" name="sortValue" class="postBtn_group"
									style="padding: 2px">
									<option value="">광고 정렬</option>
									<option value="postDateDESC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "postDateDESC"? "selected": "" }>최신순</option>
									<option value="acceptedASC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "acceptedASC"? "selected": "" }>미등록 광고순</option>
									<option value="acceptedDESC"
										${ requestScope.pageNumberingAndSearching.sortValue eq "acceptedDESC"? "selected": "" }>등록된 광고순</option>
								</select>
							</div>
							<div class="position-relative">
								<span class="position-absolute search"><i
									class="fa fa-search"></i></span> <input type="hidden"
									name="currentPage" value="1"> <input type="hidden"
									name="searchCondition" value="storeName">
								<div class="col-md-8" align="right">
									<input type="search" name="searchValue" class="form-control"
										placeholder="🔍 상호명을 입력하세요"
										value="<c:out value = '${ requestScope.pageNumberingAndSearching.searchValue }'/>"
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
						<!-- <button type="button" id="deleteBtn" class="postBtn_group">광고 내리기</button> -->
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
							<th class="thStyle" width="5%">광고번호</th>
							<th class="thStyle" width="10%">신청일자</th>
							<th class="thStyle" width="10%">상호명</th>
							<th class="thStyle" width="40%">제목</th>
							<th class="thStyle" width="10%">광고지역</th>
							<th class="thStyle" width="10%">등급</th>
							<th class="text-end" width="10%"><span>광고 등록 여부</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tempAd" items="${requestScope.tempPostList }">
							<input type="hidden" value="${ tempAd.AD_NEGATIVE }">
							<input type="hidden" value='${ tempAd.POST_CONTENTS }'>
							<input type="hidden" value="${ tempAd.POST_NO }">
							<tr onclick= "openAdModal(this)">
								<td><c:out value = '${ tempAd.AD_NO }'/></td>
								<td><c:out value = '${ tempAd.POST_DATE }'/></td>
								<td><c:out value="${ tempAd.CO_NAME }" /></td>
								<td><c:out value="${ tempAd.POST_TITLE }" /></td>
								<td><c:out value="${ tempAd.LOCATION_NAME }" /></td>
								<td><c:out value="${ tempAd.AD_TYPE }" /></td>
								<td class="text-end"><c:out value="${ tempAd.IS_ACCEPTED }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 검색  -->
				<jsp:include page="../common/paging.jsp" />
				<br> <br> <br>
			</div>
		</div>
		<!--광고 모달창 -->
			<div class="modal-dialog modal-dialog-scrollable" style="width: 1000px;"  >
				<div class="modal" tabindex="-1" id="adModal"style="width: 1000px;" >
					<div class="modal-dialog" style="width: 1000px;">
					  <div class="modal-content" style="width: 1000px;"> 
						<div class="modal-header" style="width: 1000px;">
						  <h5 class="modal-title" ><b>광고 내용</b></h5>
						  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						  </button>
						</div>
						<div class="modal-body" style="width: 1000px;">
							<table class="table table-responsive table-borderless">
					          <thead>
					            <tr class="bg-light">
					              <th>제목 </th>
					              <td id = "title" colspan = 4></td>
					            </tr>
					          </thead>
					          <tbody>
					            <tr class="bg-light">
					              <th>작성자 </th>
					              <td id = "writer"></td>
					              <th>작성일 </th>
					              <td id = "date"></td>
					            </tr>
					              <tr class="bg-light">
						              <th width="100%">내용</th>
						              <td id = "contents" colspan = 4>
					              </td>
					            </tr>
					          </tbody>
					        </table>
						  </div>
						  <div class="modal-footer">
						  	<h5>반려 처리시 사유를 입력하세요.</h5><input type ="text" id="reason" style="width:500px"><br><br>
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="rejectBtn" onclick="updateAccepted()" >반려하기</button>
						  	<input type="hidden" id="postNo"><input type="hidden" id="adNo">
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="addBtn" onclick="updateAdPost()">광고 올리기</button>
						  </div>
					  </div>
					</div>
				  </div>
			</div>
</section>
	<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />
	

</body>

</html>

