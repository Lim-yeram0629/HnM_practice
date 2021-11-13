<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="../resources/js/redirect.js"></script>
  <!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

  <style>
    * {
      font-family: 'Jua';
    }

    body {
      background: #FFEDBD;
    }

    #bg {
      position: absolute;
      width: 1600px;
    }

    #home {
      font-size: 20px;
      position: absolute;
      top: 700px;
      left: 200px;
    }

    #form {
      position: absolute;
      display: flex;
      flex-direction: column;
      top: 350px;  
      left: 220px;
    }

    #email {
        width: 500px;
        height: 40px;
        border: 0px;
        border-bottom: 1px solid lightgray;
    }

    #password {
        width: 500px;
        height: 40px;
        border: 0px;
        border-bottom: 1px solid lightgray;
    }

    .btn {
      background: #007bff;
      color: white;
      width: 100px;
      height: 40px;
    }

    a {
      color: #007bff;
    }
  </style>

</head>
<body>
  <section style="position: relative;">
    <img src="../resources/images/login.png" id="bg">
    <div style="position: absolute; display: flex; justify-content: space-between; width: 300px; height: 40px; left: 1150px; top: 80px;">
        <a href="#">이메일 찾기</a>
        <a href="#">비밀번호 찾기</a>
    </div> 
    <form method="post" id="form" >
        <h3>E-mail</h3>
        <input type="text" name="email" id="email" placeholder="email을 입력해주세요.">
        <h3>비밀번호</h3>
        <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
        <div style="display: flex; margin-top: 15px; margin-left: 300px;">
          <button type="button" class="btn" style="color: #007bff; background: white;">회원가입</button>
          <input type="submit" class="btn" value="확인">
        </div>
    </form>

    <a href="#" id="home">홈페이지로 돌아가기</a>
  </section>
  
</body>
</html>