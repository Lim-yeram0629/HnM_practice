<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/store.css">
    

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/store.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/store/store_header.jsp"/>

    <section style="display: flex; justify-content: space-between;">
        <!-- 왼쪽 네비 바 -->
        <div class="nav_bar">
            <div class="nav_upside">
                <h3>Honey-tip n Meeting</h3>
                <h3>광고 업체 전용 페이지</h3>
            </div>
            <div class="nav_downside">
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/mainpage">가게 정보</a></div>
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/payment">결제 정보</a></div>
                <div><div class="nav_menu"></div><a href="${ pageContext.servletContext.contextPath }/store/myad">내 광고</a></div>
            </div>
        </div>

        <!-- 내 가게 정보 및 수정 컨테이너 -->
        <div class="container" style="flex-direction: column; width: 100%; min-height: 800px;">
            <form action="" style="width: 90%; height: 80%;">
	            <div class="top"> <button type="submit" id="modify">정보 수정</button></div>
	            <div class="main_con">
	                <div id="title"><h1 id="store_name">${ sessionScope.store.storeName }</h1><br><br></div>
	                <div id="middle_con">
	                    <div class="box">
	                        <label>이메일</label>
	                        <h4 id="e_mail">${ sessionScope.store.user.email }</h4>
	                    </div>
	                    <div class="box">
	                        <label>대표자 이름</label>
	                        <h4 id="nick">${ sessionScope.store.user.name }</h4>
	                        <label>가게 전화번호</label>
	                        <h4 id="store_phone">${ sessionScope.store.storeTel }</h4>
	                        <label>휴대폰 번호</label><br>
	                        <input type="text" id="phone">
	                        <script>
	                        	$('#phone').val('0' + ${ sessionScope.store.user.phone }).css('font-size','13pt');
	                        	
	                        	$(function() {
	                        		<c:forEach items= "${ locationList }" var="locationList">
		            					$('#location').append('<option value = ' + '<c:out value = "${ locationList.LOCATION_CODE }"/>' + '>'
		            								 + '<c:out value = "${ locationList.LOCATION_NAME }" /></option>');
	            					</c:forEach>
	            					
	                        		$('#location').val('${ sessionScope.store.locationCode }').prop("selected",true);
	                        	});
	                        	
	                        	$('#modify').on('click',function() {
	                        		let phone = $('#phone').val();
	                        		let location = $('#location').val();
	                        		
	                        		$.ajax({
	                        			url: '/1km/store/mainpage',
	                        			type: 'post',
	                        			data: {
	                        				phone : phone,
	                        				location : location
	                        			},
	                        			success: function(data) {
	                        				alert(data);
	                        				location.reload();
	                        			}
	                        		});
	                        	});
	                        </script>
	                    </div>
	                    <div class="box">
	                        <label>사업자 등록번호</label>
	                        <h4 id="stroe_no">${ sessionScope.store.storeNo }</h4>
	                        <label>주소</label>
	                        <h4 id="address">${ sessionScope.store.address }</h4>
	                    </div>
	                </div>
	                <div id="bottom_con">
	                    <div class="box">
	                        <label>광고 지역</label><br>
	                        <select id="location" name="location">
	                        </select><br>
	                    </div>
	                    <div></div>
	                </div>
	            </div>
            </form>
        </div>
        <div></div>
    </section>

    <footer>

    </footer>
</body>
</html>