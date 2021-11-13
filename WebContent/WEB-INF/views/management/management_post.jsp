<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
    crossorigin="anonymous"></script>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
    html,
    body {
      width: 100%;
      height: 100%;
      margin: 0px;
    }

    body {
      display: flex;
      flex-direction: column;
    }

    section {
      flex: 1;
    }

    * {
      font-family: 'Jua';
    }

    .nav {
      background: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 8px;

    }

    .nav-pills {
      background: white;
      display: flex;
      padding: 8px;
    }


    .fixed {
      border: none;
      background: none;
      position: fixed;
      bottom: 50px;
      right: 100px;
    }

    .box {
      width: 70px;
      height: 70px;
      border-radius: 70%;
      overflow: hidden;
    }

    .profile {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .btn_group {
      border: 10px solid rgb(255, 215, 128);
      background-color: rgba(255, 215, 128);
      position: relative;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
      width: 100px;
      height: 38px;
    }

    .btn_group:hover {
      color: white;
      border: 10px solid rgb(74, 200, 105);
      background-color: rgba(74, 200, 105);
    }

    /* 게시판 테스트 */


    /* margin-left:20px; margin-bottom: 50px;  */
  </style>
</head>

<body style="background: #FFEDBD;">
  <header>
    <jsp:include page="/WEB-INF/views/common/mng_centerNav.jsp" />
  </header>
  <section>

    <!-- 게시물 보드 soo -->
    <br>
   
    <div class="container">
      <div class="row" style="display: flex; justify-content: space-between;">
        <div class="col-md-4" align="left"></div>
        <div class="col-md-4"></div>
          &nbsp;
          <c:if test="${ !empty requestScope.boardCode }">
          	<button class="btn_group" onclick="modifyPost();">수 정</button>
          </c:if>
       </div>
    </div>


    <br>
    <div class="container mt-5 px-2"
      style="background-color: white; border-radius: 2rem; min-height: 600px; height:fit-content;">
      <div class="mb-2 d-flex justify-content-between align-items-center;">
      </div>

      <div class="table-responsive2" style="text-align: center;">
        <table class="table table-responsive table-borderless">
          <br>
          <thead>
            <tr class="bg-light">
              <th scope="col" width="10%">제목</th>
              <th scope="col" width="55%"><c:out value="${ requestScope.postContents[0].postTitle }" /></th>
              <th scope="col" width="10%"> </th>
              <th scope="col" width="10%"> </th>
              <th scope="col" class="text-end" width="10%"><span> </span></th>
            </tr>
          </thead>
          <tbody>
            <tr class="bg-light">
              <th scope="col" width="10%">작성자</th>
              <th scope="col" width="55%"><c:out value="${ requestScope.postContents[0].nickName }" /></th>
              <th scope="col" width="10%">ip넣어줘야함</th>
              <th scope="col" width="10%"><c:out value="${ requestScope.postContents[0].postDate }" /></th>
              <th scope="col" class="text-end" width="10%"><span> 조회수  <c:out value="${ requestScope.postContents[0].cntView }" /></span></th>
            </tr>
          </tbody>
          <tbody>
            <tr class="bg-light">
              <th scope="col" width="10%">내용</th>
              <th scope="col" width="55%" colspan="3"><div id="Pcontents"></div><br></th>
              <th scope="col" width="10%"> </th>
              <th scope="col" width="10%"> </th>
              <th scope="col" class="text-end" width="10%"><span> </span></th>
            </tr>
          </tbody>
        </table>
      </div>
      <br><br>
    </div>
    <br>
   <!--이하 댓글입력 및 출력창 -->
   <c:if test="${ requestScope.replyList != null }">
    <div class="container mt-5 px-2"
      style="background-color: white; border-radius: 2rem; min-height: 200px; height:fit-content; display: flex;  flex-direction: column;">
      <div class="mb-2 d-flex justify-content-between align-items-center;"></div>
      <br>
      <div id="comments">
        <div id="comment-head" class="comment-row">
          <span id="comments-count">댓글 </span>
      	</div>
      
      	<br>
      	<div id="replyComment">
      		<div class="table-area">
    			<form id="replySelect" action="${ pageContext.servletContext.contextPath }/board/etc_posting_board"
    				method="get"> 
      				<input type="hidden" name="currentPage" value = 1>
    			</form>
				<table align="left" id="listArea">
					<tr style="display: none;">
						<th width="200px">작성자</th>
						<th width="500px">댓글</th>
						<th width="150px">삭제버튼</th>
					</tr>
					<c:forEach var="reply" items="${ requestScope.replyList }">
						<tr class="replyClass">
							<td style="color : blue;"><c:out value="${ reply.nickName }"/></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${ reply.replyContents }"/></td>
							
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" id = "email" value ="${ reply.email }"><button type="button" name="deleteReply" class="deleteReply" onclick="replyDelete(this)" value="${ reply.replyNo }">삭제</button></td>
						
						</tr>
					</c:forEach>
				</table>
			</div>
      	</div>
      	<div>
			<jsp:include page="../common/replyPaging.jsp" />
      	</div>
   		</div>
    </div>
	</c:if>

  </section>

 	 <!-- Footer -->
   <jsp:include page="../common/footer.jsp" />
  
  <script type="text/javascript">
  
	   function modifyPost() {
		   let postNo = "${ requestScope.postContents[0].postNo }";
		   console.log(postNo);
		   location.href = "${ pageContext.servletContext.contextPath}/management/posting?postNo=" + postNo;
	   }
	   
	   $('#Pcontents').append('${ requestScope.postContents[0].postContents }');
  
  </script>

</body>

</html>