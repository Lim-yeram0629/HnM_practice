<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /* 게시판 테스트 */
    th {
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

    /* margin-left:20px; margin-bottom: 50px;  */
  </style>
</head>

<body style="background: #FFEDBD;">
  <jsp:include page="../common/mem_centerNav.jsp" />
    
  <section>


    <!-- 게시판  -->
    <br>
    <!--글정렬 드롭 박스  http://bootstrapk.com/components/#btn-groups -->
    <div class="btn-group" style="float: left; width: 30%; padding-left: 6%;">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        글정렬 <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#">정확성순</a></li>
        <li><a href="#">최신순</a></li>
        <li><a href="#">오래된순</a></li>
        <!-- <li class="divider"></li>
          <li><a href="#">Separated link</a></li> -->
      </ul>
    </div>
    <div class="boardtitle2">
      <h3>꿀TIP</h3>
    </div>
    <div class="boardtitle3"><button type="button" class="btn btn-default">
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
              <th scope="col" class="text-end" width="10%" style="text-align: center;"><span>조회수</span></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>2021-10-12</td>
              <td><a href="#" style="Color : black"><i class="fa fa-check-circle-o green"></i><span
                    class="ms-1">맛집추천바랍니다.</span></a></td>
              <td>1키로</td>
              <td>10</td>
              <td class="text-end"><span class="fw-bolder">1</span> <i class="fa fa-ellipsis-h ms-2"></i></td>
            </tr>

          </tbody>
        </table>
        <!--페이지 네이션 http://bootstrapk.com/components/#%ED%81%AC%EA%B8%B0-%EC%A1%B0%EC%A0%88 -->
        <ul class="pagination pagination-sm">
          <li><a href="#">1</a></li>
        </ul>
      </div>
      <div class="position-relative" style="position: absolute; left: 35%;"> <span class="position-absolute search"><i
            class="fa fa-search"></i></span>
        <form>
          <input class="form-control w-100" placeholder="🔍검색어를 입력하세요" style="background-color: white; width: 300px;">
        </form>
      </div>

      <br><br>
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

  <!-- Footer -->
	<jsp:include page="../common/footer.jsp" />


</body>

</html>