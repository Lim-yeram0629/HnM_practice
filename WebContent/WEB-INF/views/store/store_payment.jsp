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
        <div class="container" style="flex-direction: column; width: 100%; min-height: 800px;">
            <div class="top" align='center'><h1 style="color: #5B5B5B;">결제 정보</h1></div>
            <div class="main_con">
                <c:if test="${ !empty requestScope.ad }">
                	<div class="payment_div"><h1>광고주</h1><h1 class="payment_info" id="ad_master">${ sessionScope.store.storeName }</h1></div>
	                <div class="payment_div"><h1>광고 승인 진행 상황</h1><h1 class="payment_info" id="ad_status">${ requestScope.ad.isAccepted }</h1></div>
	                <div class="payment_div"><h1>결제 진행 상황</h1><h1 class="payment_info" id="payment_status">${ requestScope.ad.isPayed }</h1></div>
	                <div class="payment_div"><h1>입금 기간</h1><h1 class="payment_info" id="pay_date">~ ${ requestScope.ad.payDate }</h1></div>
	                <div class="payment_div"><h1>광고비 입금 계좌</h1><h1 class="payment_info" id="pay_acount">농협 xxx-xxxx-xxxx-xx</h1></div>
	                <div class="payment_div"><h1>가격</h1><h1 class="payment_info" id="ad_cost">
	                	<c:if test="${ requestScope.ad.adType == 'super' }">
	                		100,000 원
	                	</c:if>
	                	<c:if test="${ requestScope.ad.adType == 'common' }">
	                		50,000 원
	                	</c:if>
	                </h1></div>
                </c:if>
                <c:if test="${ empty requestScope.ad }">
                	<h1>광고 신청을 해주십시오!</h1>
                </c:if>
            </div>
        </div>

        <div></div>
    </section>

    <footer>

    </footer>
</body>
</html>