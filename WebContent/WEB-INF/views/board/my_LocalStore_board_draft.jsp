<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>


    /* 게시판  */
    td, th {
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
   .postBtn_group {
            border: 5px solid rgb(255, 215, 128);
            background-color: rgba(255, 215, 128);
            border-radius: 0.5rem;
        }

    /* margin-left:20px; margin-bottom: 50px;  */
  </style>
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body style="background: #FFEDBD;">
   <jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
  <section>


    <!-- 게시판 구성부 -->
    <br>
    <!--글정렬 드롭 박스  http://bootstrapk.com/components/#btn-groups -->
    <div class="col-md-3" style="margin-top: 10px;">
						
					</div>
    <div class="boardtitle2">
      <h3>우리동네 가게</h3>
    </div>
   <%--  onclick="location.href = '${ pageContext.servletContext.contextPath }'/board/insertandupdate" --%>
    <div class="boardtitle3"><button type="button" class="postBtn_group" id="writingPost" >
        글작성
      </button></div>

    <br><br><br>

    <div class="container mt-5 px-2" style="background-color: white; border-radius: 2rem;">
      <div class="mb-2 d-flex justify-content-between align-items-center">


      </div>
			<div class="table-responsive" style="text-align: center;">
				<table class="table table-responsive table-borderless">
					<thead>
						<tr class="bg-light">
							<th scope="col" width="5%" style="text-align: center;">글번호</th>
							<th scope="col" width="10%" style="text-align: center;">작성일자</th>
							<th scope="col" width="55%" style="text-align: center;">제목</th>
							<th scope="col" width="10%" style="text-align: center;">작성자</th>
							<th scope="col" width="10%" style="text-align: center;">추천수</th>
							<th scope="col" class="text-end" width="10%"
								style="text-align: center;"><span>조회수</span></th>
						</tr>
					</thead>
					<tbody>
						<!--  광고 게시물 -->
						<c:forEach var="ad" items="${requestScope.adList }">
							<tr>
								<td><c:out value="${ ad.POST_NO }" /></td>
								<td><c:out value="${ ad.POST_DATE }" /></td>							
								<td style="color:#ff6868"><i class="fa fa-check-circle-o green"></i><span class="ms-1">
									AD ) <b><c:out value="${ ad.POST_TITLE }"/></b></span></td>
								<td><c:out value="${ ad.CO_NAME}" /></td>
								<td><c:out value="${ ad.CNT_LIKE }" /></td>
								<td class="text-end"><span class="fw-bolder">${ ad.CNT_VIEW }</span>
									<i class="fa fa-ellipsis-h ms-2"></i></td>
							</tr>
						</c:forEach>
						
						<c:forEach var="postContents" items="${requestScope.postList }">
							<tr>
								
								<td><c:out value="${ postContents.postNo }" /></td>
								<td><c:out value="${ postContents.postDate }" /></td>								
								<td><i class="fa fa-check-circle-o green"></i><span class="ms-1"><c:out
												value="${ postContents.postTitle }" /></span></td>
												
								<td><c:out value="${ postContents.email }" /></td>
								<td><c:out value="${ postContents.cntLike }" /></td>
								<td class="text-end"><span class="fw-bolder">${ postContents.cntView }</span>
									<i class="fa fa-ellipsis-h ms-2"></i></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<jsp:include page="../common/paging.jsp" />
			</div>
			<br>
			<!-- 검색  -->
			<div class="position-relative">
				<span class="position-absolute search"><i
					class="fa fa-search"></i></span>
				<form id="searchForm"
					action="${ pageContext.servletContext.contextPath }/board/localstorepage"
					method="get">
					<div class="col-fd-3" style="margin-top: 10px; position: absolute; top: 200px;" >
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

  <footer class="footer text-center text-white" style="background-color: #FFEDBD;">
    <!-- Grid container -->
    <div class="container p-4 pb-0" style="display: flex; justify-content: space-between;">
      <span>
        <h3>H n M</h3>
      </span>
      <span>E-mail : dsdsdsdsdsd</span>
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      © 2021 Copyright:
      <a class="text-white" href="#">1 키로</a>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->

	<script>
	
	$('#writingPost').click(function () {
		
		location.href = "${ pageContext.servletContext.contextPath }/board/insertandupdate?boardCode=3_"+ "${sessionScope.member.locationCode }";
		
	});
		
		if(document.getElementsByTagName("td")) {
			
			const $tds =$('td');
			for(let i = 0; i < $tds.length; i++) {
				
			
				  $tds[i].onclick = function() {
					let postNo = this.parentNode.children[0].innerText;
					let cntView = 1;
					console.log(postNo);
					location.href = "${ pageContext.servletContext.contextPath }/board/etc_posting_board?postNo=" + postNo;
				} 
			}
		}
		
				
		$('#sortValue').change(function(){
			$('#searchForm').submit();
		});
	</script>

</body>
</html>