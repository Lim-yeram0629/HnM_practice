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

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
   $(function(){
      
      $('#deleteBtn').click(function(){
         const postNoArr = new Array();
         $('.checkPostNo').each(function(index, item) {
            if($(this).prop('checked')){
               postNoArr.push($(this).val());
            }
         });
         console.log(postNoArr);
         
         if(postNoArr.length > 0){
            if(confirm('선택한 게시물을 정말로 삭제하시겠습니까?')){
               $.ajax({
                  url: "${ pageContext.servletContext.contextPath }/member/mypage/deleteContents",
                  type: "get",
                  data: { "postNoArr" : postNoArr },
                  success: function(data, textStatus, xhr){
                      alert("총 " + data + "개의 게시물을 삭제했습니다.");
                      location.reload();
                   },
                   error: function(xhr, status, error){
                      alert("게시물 삭제에 실패하였습니다.");
                      console.log(error);
                   }
               });
            }
         }else{
            alert('삭제할 게시물을 선택해 주세요.');
         }
      });
      
      $('#allCheck').click(function(){
         if($('#allCheck').prop('checked')){
            $('.checkPostNo').each(function(index, item) { $(this).prop('checked', true); });
         }else{
            $('.checkPostNo').each(function(index, item) { $(this).prop('checked', false); });
         }
      });
         
   });
</script>

</head>
<body style="background: #FFEDBD;">
	
	<jsp:include page="/WEB-INF/views/management/header_management.jsp" />
	
	<section style="padding-left: 110px;">
		<div class="container" style="padding-left: 30px;">
			<br>
			<div class="row" style="align-items: center;">
				
				<div class="col-md-12">
					<h3 align="center">전체 회원 관리</h3>
				</div>
			
				<div class="col-md-12">
					<!-- 검색  -->
					<div class="row">
						<form id="searchForm"
							action="${ pageContext.servletContext.contextPath }/management/memberAll"
							method="get">
							<div class="col-md-3" align="right" style="padding-left:10%;">
								<select id="searchCondition" name="searchCondition"
										class="form-control custom-select bg-white border-left-0 border-md">
										<option value = "">검색 조건 선택</option>
										<option value = "location" ${ requestScope.pageNumberingAndSearching.searchCondition eq "location"? "selected": "" }>관심지역</option>
										<option value = "likes"  ${ requestScope.pageNumberingAndSearching.searchCondition eq "likes"? "selected": "" }>관심사</option>
										<option value = "email" ${ requestScope.pageNumberingAndSearching.searchCondition eq "email"? "selected": "" }>이메일</option>
										<option value = "name" ${ requestScope.pageNumberingAndSearching.searchCondition eq "name"? "selected": "" }>이름</option>
										<option value = "nickName" ${ requestScope.pageNumberingAndSearching.searchCondition eq "nickName"? "selected": "" }>닉네임</option>
								</select>
							</div>
							<input type="hidden" name="currentPage" value="1"> 
							<!-- <input type="hidden" name="searchCondition" value="title"> -->
							<div class="col-md-7" align="right">
								<input type="search" name="searchValue" class="form-control"
									placeholder="🔍 검색어를 입력하세요"
									value="<c:out value = "${ requestScope.pageNumberingAndSearching.searchValue }"/>"
									style="background-color: white; width: 30$;">
							</div>
							<div class="col-md-2" align="left">
								<button class="postBtn_group" type="submit" style="float: left">검색</button>
							</div>
						</form>
					</div>
					<br>
				</div>
			</div>
			<!-- 게시판 -->
			<div class="table-responsive"
				style="min-height: 600px; padding: 10px; border-radius: 1rem; text-align: center; background-color: white;">
				<table class="table table-responsive table-borderless">
					<thead>
						<tr class="bg-light">
							<th class="thStyle" width="10%">관심지역</th>
							<th class="thStyle" width="7%">관심사</th>
							<th class="thStyle" width="15%">이메일</th>
							<th class="thStyle" width="10%">이름</th>
							<th class="thStyle" width="10%">닉네임</th>
							<th class="thStyle" width="10%">생년월일</th>
							<th class="thStyle" width="5%">성별</th>
							<th class="thStyle" width="5%">경고</th>
							<th class="thStyle" width="7%">블랙리스트</th>
							<th class="thStyle" width="7%"><span>탈퇴여부</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${requestScope.memberList }">
							<tr>
								<td><c:out value="${ member.LOCATION_NAME }" /></td>
								<td><c:out value="${ member.LIKES_NAME }" /></td>
								<td><c:out value="${ member.EMAIL }" /></td>
								<td><c:out value="${ member.MEM_NAME }" /></td>
								<td><c:out value="${ member.NICKNAME }" /></td>
								<td><c:out value="${ member.BIRTH_DAY }" /></td>
								<td><c:out value="${ member.GENDER }" /></td>
								<td><c:out value="${ member.CNT_WARNING }" /></td>
								<td><c:out value="${ member.IS_BLACK }" /></td>
								<td class="text-end">
								<span class="fw-bolder"><c:out value="${ member.IS_DEACTIVATE }" /></span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<jsp:include page="../common/paging.jsp" />
				<br>
			</div>
		</div>
		
	</section>

    <!-- Footer -->
   <jsp:include page="../common/footer.jsp" />
   
</body>

</html>