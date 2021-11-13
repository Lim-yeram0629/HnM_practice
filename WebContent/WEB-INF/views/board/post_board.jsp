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
	.deleteReply{
		border-radius: 2em;
	    border: none;
	    width: 50px;
	}
	
	#cntLikeBtn {
		background-color: rgba(255, 215, 128);
		border-radius: 2em;
	    border: none;
	    width: 70px;
	}
	  

  </style>
</head>

<body style="background: #FFEDBD;">
  <header>
    <jsp:include page="/WEB-INF/views/common/mem_centerNav.jsp"></jsp:include>
  </header>
  <section>

    <!-- 게시물 보드 soo -->
    <br>
   
    <div class="container">
      <div class="row" style="display: flex; justify-content: space-between;">
        <div class="col-md-4" align="left"><button class="btn_group" id="scrap">스크랩</button><button class="btn_group" id="report"
            style="margin-left: 30px;" data-toggle="modal" data-target="#registerModal">신 고</button>
          &nbsp;</div>
        <div class="col-md-4"></div>
        <c:if test="${ requestScope.postContents[0].boardCode != '4_L0' && requestScope.postContents[0].boardCode != '5_L0' }">
        	<div class="col-md-4" align="right"><button class="btn_group" style="margin-right: 30px;" onclick="deletePost();" >삭 제</button>
          	&nbsp;<button class="btn_group" id="amendmentPost">수 정</button></div>
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
              <th scope="col" width="10%"><button type="button" id="cntLikeBtn">추천하기</button> </th>
              <th scope="col" width="10%"> </th>
              <th scope="col" class="text-end" width="10%"><span> </span></th>
            </tr>
          </thead>
          <tbody>
            <tr class="bg-light">
              <th scope="col" width="10%">작성자</th>
              <th scope="col" width="55%"><c:out value="${ requestScope.postContents[0].nickName }" /></th>
              <th scope="col" width="10%">추천수<c:out value="${ requestScope.postContents[0].cntLike }" /></th>
              <th scope="col" width="10%"><c:out value="${ requestScope.postContents[0].postDate }" /></th>
              <th scope="col" class="text-end" width="10%"><span> 조회수  <c:out value="${ requestScope.postContents[0].cntView }" /></span></th>
            </tr>
              <tr class="bg-light">
              <td scope="col" width="10%">내용</th>
              <td scope="col" width="55%" style = "text-align: justify" colspan = 4><div id="Pcontents"></div><br></th>
              
            </tr>
          </tbody>
        </table>
      </div>
      <br><br>
    </div>
    <br>
    <!--이하 댓글입력 및 출력창 -->
    <div class="container mt-5 px-2"
      style="background-color: white; border-radius: 2rem; min-height: 200px; height:fit-content; display: flex;
    flex-direction: column;">
      <div class="mb-2 d-flex justify-content-between align-items-center;">
      </div>
      <br>
      <div id="comments">
        <div="comment-head" class="comment-row">
          <span id="comments-count">댓글 </span>
      </div>
      
      <div class="comment-row" style="display: flex;">
        <input class="form-control w-100" placeholder="댓글을 작성해주세요" id="writingReply" name="writingrRply" style="background-color: white; width: 300px;">
        <button class="btn_group" type="submit" onclick="submitComment()" style="margin-left: 20px;" id ="replySubmitAndRefresh">확인</button>
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
		 <jsp:include page="../common/replyPaging.jsp" />
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

  <footer class="footer text-center text-white" style="background-color: white;">
  <jsp:include page="../common/footer.jsp" />
  </footer>
  <!-- Footer -->
		<!-- 모달창 -->
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal" tabindex="-1" id="registerModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">신고사유</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="textarea" id = "reasonOfReport" name="boardReportContents" style="width: 100%; height: 100%;">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary"
								data-dismiss="modal" id="agreeBtn">보내기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
  
  
  <script type="text/javascript">
  
   function deletePost() {
	
	   if('${ sessionScope.member.email}' == '${ requestScope.postContents[0].email }') {
		   
	   let postNo = "${ requestScope.postContents[0].postNo }";
	   console.log(postNo);
	   location.href = "${ pageContext.servletContext.contextPath}/board/postdelete?postNo=" + postNo;
	   let message = "삭제요청이 처리되었습니다.";
	   alert(message);
	   } else {
		   let message = "당신 글이 아니잖소??";
		   alert(message)
	   }
   }
   
   
   $('#scrap').click(function(){
			const postNo = '${ requestScope.postContents[0].postNo}';
			const email = '${ sessionScope.member.email}';
			console.log(email);
		$.ajax({
			
			url: "/1km/board/scrap",
			type: "post",
			data: { postNo : postNo 
				   , email : email },
			success: function(data, textStatus, xhr) {
				alert(data);
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		});
	});
   
   $('#agreeBtn').click(function(){
		const postNo = '${ requestScope.postContents[0].postNo}';
		const email = '${ sessionScope.member.email}';
		const report = $('#reasonOfReport').val();
	$.ajax({
		
		url: "/1km/board/report",
		type: "post",
		data: { postNo : postNo 
			   , email : email 
			   , report : report },
		success: function(data, textStatus, xhr) {
			alert(data);
		},
		error: function(xhr, status, error) {
			console.log(error);
		}
	});
});
   
   $('#replySubmitAndRefresh').click(function(){
		const postNo = '${ requestScope.postContents[0].postNo}';
		const email = '${ sessionScope.member.email}';
		const writingReply = $('#writingReply').val();
	$.ajax({
		
		url: "/1km/board/replyinsert",
		type: "post",
		data: { postNo : postNo 
			   , email : email 
			   , writingReply : writingReply },
		success: function(data, textStatus, xhr) {
			alert(data);
			location.reload();
			
		},
		error: function(xhr, status, error) {
			console.log(error);
		}
	});
   });
	
   function replyDelete(value1) {
	   
	
	let email = $(value1).siblings()[0].value;
	console.log(email);
	let replyNo = $(value1)[0].value;
	console.log(replyNo);
	
	
	$.ajax({
		url: '/1km/board/replydelete',
		data : { email: email
			   , replyNo: replyNo },
		type : 'post',
		success: function(data, textStatus, xhr) {
			alert(data);
			location.reload();
			
		},
		error: function(xhr, status, error) {
			console.log(error);
		}
	
	});
	
   }
   
   $( "#cntLikeBtn" ).one( "click", function( event ){ 
	   
	   const postNo = '${ requestScope.postContents[0].postNo}';
	   const email = '${ requestScope.postContents[0].email }';
	  
	   $.ajax({
			url: '/1km/board/cntlikeup',
			data : { postNo: postNo
				   , email: email },
			type : 'post',
			success: function(data, textStatus, xhr) {
				alert(data);
			   $( this ).off( event );
				
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		
		});
	   
   });
   
   $('#amendmentPost').click(function(){
		const postNo = '${ requestScope.postContents[0].postNo}';
		const email = '${ sessionScope.member.email}';
		const postEmail = '${ requestScope.postContents[0].email}';
		console.log("확인용");
		console.log(postNo);
		console.log(email);
		console.log(postEmail);
	
		if(postEmail === email){
					
			location.href = "${ pageContext.servletContext.contextPath }/board/insertandupdate?postNo=" + postNo;
		} else {
			alert("접근 권한이 없습니다.");
		}
  });

	
	   $('#Pcontents').append('${ requestScope.postContents[0].postContents }');

  </script>

</body>

</html>