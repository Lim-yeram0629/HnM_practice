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
		
		$('#blackListBtn').click(function(){
			const emailArr = new Array();
			$('.checkPostNo').each(function(index, item) {
				if($(this).prop('checked')){
					emailArr.push($(this).val());
				}
			});
			console.log(emailArr);
			
			if(emailArr.length > 0){
				if(confirm('선택한 회원을 블랙리스트에서 해제합니다. (경고 횟수는 0으로 초기화 됩니다.)')){
					$.ajax({
						url: "${ pageContext.servletContext.contextPath }/management/deleteBlacklist",
						type: "get",
						data: { "emailArr" : emailArr },
						success: function(data, textStatus, xhr){
			    			alert("총 " + data + "명을 블랙리스트에서 해제했습니다.");
			    			location.reload();
			    		},
			    		error: function(xhr, status, error){

			    			alert("블랙리스트 해제에 실패하였습니다.");
			    			console.log(error);
			    		}
					});
				}
			}else{
				alert('블랙리스트에서 해제할 회원을 선택해 주세요.');
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
					<h3 align="center">블랙 리스트 회원 관리</h3>
				</div>
			
				<!-- <div class="col-md-3" style="margin-top: 10px;">
					<button type="button" class="postBtn_group dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						회원 정렬 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">지역 이름순</a></li>
						<li><a href="#">관심사 이름순</a></li>
						<li><a href="#">회원 이름순</a></li>
					</ul>
				</div> -->

				<div class="col-md-12">
					<!-- 검색  -->
					<div class="row">
						<form id="searchForm"
							action="${ pageContext.servletContext.contextPath }/management/blacklist"
							method="get">
							<div class="col-md-3" align="right" style="padding-left:10%;">
								<select id="searchCondition" name="searchCondition"
										class="form-control custom-select bg-white border-left-0 border-md">
										<option value = "">검색</option>
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
									placeholder="🔍검색어를 입력하세요"
									value="<c:out value = "${ requestScope.pageNumberingAndSearching.searchValue }"/>"
									style="background-color: white; width: 30$;">
							</div>
							<div class="col-md-2" align="left">
								<button class="postBtn_group" type="submit" style="float: left">검색</button>
								<button class="postBtn_group" id ="blackListBtn" type="button" style="float: left; margin-left:3%;">블랙리스트 해제</button>
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
							<th class="thStyle" width="6%">선택 <input type="checkbox"
								id="allCheck"></th>
							<th class="thStyle" width="10%">관심지역</th>
							<th class="thStyle" width="10%">관심사</th>
							<th class="thStyle" width="10%">이메일</th>
							<th class="thStyle" width="10%">이름</th>
							<th class="thStyle" width="10%">닉네임</th>
							<th class="thStyle" width="10%">생년월일</th>
							<th class="thStyle" width="10%">성별</th>
							<th class="thStyle" width="10%">경고</th>
							<th class="text-end" width="10%"><span>블랙리스트</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${requestScope.memberList }">
							<tr>
								<td><input type="checkbox" class="checkPostNo"
									value="<c:out value = '${ member.EMAIL }'/>"></td>
								<td><c:out value="${ member.LOCATION_NAME }" /></td>
								<td><c:out value="${ member.LIKES_NAME }" /></td>
								<td><c:out value="${ member.EMAIL }" /></td>
								<td><c:out value="${ member.MEM_NAME }" /></td>
								<td><c:out value="${ member.NICKNAME }" /></td>
								<td><c:out value="${ member.BIRTH_DAY }" /></td>
								<td><c:out value="${ member.GENDER }" /></td>
								<td><c:out value="${ member.CNT_WARNING }" /></td>
								<td class="text-end">
								<span class="fw-bolder"><c:out value="${ member.IS_BLACK }" /></span>
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