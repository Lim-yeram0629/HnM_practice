<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$(function(){
		$('#deActivateBtn').click(function(){
			console.log('확인');
			$('#deActicateModal').modal('toggle');
		});
	});
	
	function deleteAccount(){
		
		$.ajax({
			url : "${ pageContext.servletContext.contextPath }/member/deactivate",
			type : "get",
			success : function(data,textStatus, xhr) {
				alert(data);
				location.href="${ pageContext.servletContext.contextPath }/member/logout"
			},
			error : function(xhr, status, error) {
				alert(data);
				console.log(error);
			}
		});

	}
	
</script>
</head>
<body>
	<!-- 탈퇴 모달창 -->
  <div class="modal-dialog modal-dialog-scrollable">
	<div class="modal" tabindex="-1" id="deActicateModal">
		<div class="modal-dialog" >
		  <div class="modal-content" > 
			<div class="modal-header">
			  <h5 class="modal-title" ><b>경고!</b></h5>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<div class="modal-body" >
				<h4>계정을 탈퇴할 경우,<br>
					같은 이메일을 사용할 수 없으며 계정의 데이터를 전부 잃게 됩니다.<br>
					그래도 탈퇴하시겠습니까?
				</h4>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소 하기</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteAccount();">탈퇴 하기</button>
			  </div>
		  </div>
		</div>
	  </div>
	</div>
	  
	<!-- footer -->
  <footer class="footer text-center" style="background-color: #FFEDBD;">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      <div style="color: white;">
        H n M &nbsp; &nbsp; <button style="color: rgb(83, 83, 83); border:none; background:none;" id="deActivateBtn">탈퇴하기</button>
      </div>
      © 2021 Copyright: <a href="../board/customercenter_1km_introduce_draft.html" style="color: rgb(83, 83, 83);">1
        키로</a> (e-mail : 1kmTeam@email.com)
    </div>
  </footer>
</body>
</html>