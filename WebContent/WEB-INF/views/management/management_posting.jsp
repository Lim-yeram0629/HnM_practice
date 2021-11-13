<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
 	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="../resources/js/mgsummernote.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/store.css">
</head>
<body>
    <!-- 위쪽 네비 바-->
    <nav>
        <div class="container">
            <div></div>
            <a href="${ pageContext.servletContext.contextPath }/management/management_board" id="main_logo"><h1>Honey-tip n Meeting</h1><h1 style="color: #2A8BF2; padding-top: 4px;">&nbsp;MANAGER</h1></a>
        </div>
    </nav>

    <section style="display: flex; justify-content: space-between;">
        
        <div class="container" style="flex-direction: column; width: 100%; min-height: 800px;">
            <div class="top" align='center'><h1>게시글 작성</h1></div>
            <div class="main_con" style="min-width: 600px;">
                
                <form action="${ pageContext.servletContext.contextPath }/management/posting" method="post" onsubmit="return validate();">
                    <table>
                        <tr>
                            <td style="font-size: 25px;">제목</td>
                            <td colspan="3"><input type="text" name="title" id="modi_title" style="width: 70%; height: 28px;"></td>
                        </tr>
                        <tr>
                            <td><br><br></td>
                        </tr>
                        <tr>
                            <td style="float: left; font-size: 25px;">내용</td>
                            <td colspan="3"><textarea id="summernote" name="editordata"></textarea></td>
                        </tr>
                    </table>
                    <br>
                    <input type="hidden" name="boardCode" value="${ requestScope.boardCode }">
                    <input type="hidden" name="modiType" id="modiType">
                    <div align='right'><button class="btn_base" type="submit">작성 완료</button></div>
                </form>
                <script>
                	function validate() {
                		let title = $('#modi_title').val();
                		let summernote = $('#summernote');
                		let adtype = $('#adType').val();
                		if(${ requestScope.modifyPost != null }) {
                			$('#modiType').val('${ requestScope.modifyPost.postNo }');
                		}
                		if(title == "") {
                			alert('제목을 작성해주십시오.');
                			return false;
                		}
                		
                		if(summernote.summernote('isEmpty')) {
                			alert('내용을 작성해주십시오.');
                			return false;
                		}
                		
                		alert('작성 완료!');
                		return true;
                		
                	}
                	
                	function sendFile(file, editor){
                		let form_data = new FormData();
                		form_data.append('file', file);
                		console.log(file);
                		$.ajax({
                			url : "/1km/store/imageupload",
                			type : "post",
                			data : form_data,
                			contentType : false,
                			enctype: 'multipart/form_data',
                			processData : false,
                			success : function(data){
                				console.log(data);
                				console.log(editor);
                				$(editor).summernote("insertImage",data);
                			}
                		});
                	}
                	
                	if(${ requestScope.modifyPost != null }) {
                		$('#modi_title').val('${ requestScope.modifyPost.postTitle }');
                		$('#summernote').summernote({
                	        minHeight : 400,
                	        width : 900,
                	        lang: "ko-KR",
                	        callbacks: {
                				onImageUpload : function(files){
                					console.log(files);
                					sendFile(files[0],this);
                				}
                			},
                	        toolbar: [
                	            // [groupName, [list of button]]
                	            ['style', ['bold', 'italic', 'underline']],
                	            ['fontsize', ['fontsize']],
                	            ['para', ['ul', 'ol', 'paragraph']],
                	            ['insert', ['picture']]
                	          ],
                	          popover: {
                	            image: [
                	              ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
                	              ['float', ['floatLeft', 'floatRight', 'floatNone']],
                	              ['remove', ['removeMedia']]
                	            ]
                	          }
                	    });
                	}

                	if(${ requestScope.modifyPost != null }) {
                		$('#summernote').summernote('code','${ requestScope.modifyPost.postContents }');
                	}
                </script>
            </div>
        </div>
    </section>

	 <!-- Footer -->
   <jsp:include page="../common/footer.jsp" />
</body>
</html>