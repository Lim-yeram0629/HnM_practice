<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="pagingArea" align="center">
		<!-- 맨 앞으로 이동 버튼 -->
	    <button id="startPage"><<</button>
		
		<!-- 이전 페이지 버튼 -->
		<c:if test="${ requestScope.pageNumberingAndSearching.pageNo <= 1 }">
			<button disabled><</button>
		</c:if>
		<c:if test="${ requestScope.pageNumberingAndSearching.pageNo > 1 }">
			<button id="prevPage"><</button>
		</c:if>
		
		<!-- 숫자 버튼 -->
		<c:forEach var="p" begin="${ requestScope.pageNumberingAndSearching.startPage }" end="${ requestScope.pageNumberingAndSearching.endPage }" step="1">
			<c:if test="${ requestScope.pageNumberingAndSearching.pageNo eq p }">
				<button disabled><c:out value="${ p }"/></button>
			</c:if>
			<c:if test="${ requestScope.pageNumberingAndSearching.pageNo ne p }">
				<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
			</c:if>
		</c:forEach>
		
		<!-- 다음 페이지 버튼 -->
		<c:if test="${ requestScope.pageNumberingAndSearching.pageNo >= requestScope.pageNumberingAndSearching.maxPage }">
			<button disabled>></button>
		</c:if>
		<c:if test="${ requestScope.pageNumberingAndSearching.pageNo < requestScope.pageNumberingAndSearching.maxPage }">
			<button id="nextPage">></button>
		</c:if>
		
		<!-- 마지막 페이지로 이동 버튼 -->
		<button id="maxPage">>></button> 
	</div>
	
	<script>
	
		const link = "${ pageContext.servletContext.contextPath }"+"${ requestScope.mappingURL }";
		let searchText = "";
		console.log(link);
		if(${ !empty requestScope.pageNumberingAndSearching.searchCondition? true: false }) {
			searchText += "&searchCondition=${ requestScope.pageNumberingAndSearching.searchCondition }";
		}
		
		if(${ !empty requestScope.pageNumberingAndSearching.searchValue? true: false }) {
			searchText += "&searchValue=${ requestScope.pageNumberingAndSearching.searchValue }";
		}
		
		if(${ !empty requestScope.pageNumberingAndSearching.sortValue? true: false }) {
			searchText += "&sortValue=${ requestScope.pageNumberingAndSearching.sortValue }";
		}
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1" + searchText;
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageNumberingAndSearching.pageNo - 1 }" + searchText;
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageNumberingAndSearching.pageNo + 1 }" + searchText;
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageNumberingAndSearching.maxPage }" + searchText;
			}
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text + searchText;
		}
	</script>
</body>
</html>