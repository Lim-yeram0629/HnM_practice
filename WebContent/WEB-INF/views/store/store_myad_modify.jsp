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
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="../resources/js/store.js"></script>
    <link rel="stylesheet" href="../resources/css/store.css">
</head>
<body>
    <!-- 위쪽 네비 바-->
    <nav>
        <div class="container">
            <div></div>
            <a href="${ pageContext.servletContext.contextPath }/store/mainpage" id="main_logo"><h1>Honey-tip n Meeting - </h1><h1 style="color: #2A8BF2; padding-top: 4px;">&nbsp;광고</h1></a>
            <div style="margin-right: 10px;"><span id="ad_name"><c:out value='${ store.storeName }'/></span>&nbsp;님</div>
        </div>
    </nav>

    <section style="display: flex; justify-content: space-between;">
        <!-- 왼쪽 네비 바 -->
        <div class="nav_bar">
            <div class="nav_upside">
                <h3>Honey-tip n Meeting</h3>
                <h3>광고 업체 전용 페이지</h3>
            </div>
            <div class="nav_downside">
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/mainpage">가게 정보</a></div>
                <div></div>
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/payment">결제 정보</a></div>
                <div></div>
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/myad">내 광고</a></div>
            </div>
        </div>
        <div class="container" style="flex-direction: column; width: 100%; min-height: 800px;">
            <div class="top" align='center'><h1>게시글 작성</h1></div>
            <div class="main_con" style="min-width: 600px;">
                
                <form action="${ pageContext.servletContext.contextPath }/store/modify" method="post" onsubmit="return validate();">
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
                        <tr>
                            <td style="font-size: 23px;">요금제&nbsp;&nbsp;</td>
                            <td>
                                <select id="adType" name="adType" style="height: 30px;">
                                    <option value="0">요금제 선택</option>
                                    <option value="super">슈퍼(광고 상단에 고정)</option>
                                    <option value="common">일반(광고 고정x)</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div align='right'><button class="btn_base" type="submit">작성 완료</button></div>
                </form>
                <script>
                	function validate() {
                		let title = $('#modi_title').val();
                		let summernote = $('#summernote');
                		let adtype = $('#adType').val();
                		
                		if(title == "") {
                			alert('제목을 작성해주십시오.');
                			return false;
                		}
                		
                		if(summernote.summernote('isEmpty')) {
                			alert('내용을 작성해주십시오.');
                			return false;
                		}
                		
                		if(adtype == '0') {
                			alert('요금제를 선택해주십시오.');
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
                	
                </script>
            </div>
        </div>
    </section>

    <footer>

    </footer>
</body>
</html>