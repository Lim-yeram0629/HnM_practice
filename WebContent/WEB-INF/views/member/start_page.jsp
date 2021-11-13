<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>

  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

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
      width: 98%;
    }

    .btn {
      width: 170px;
      height: 60px;
      font-size: 20px;
      background: white;
      border: 1px solid black;
    }

    #buttons {
      float: right;
      position: relative;
    }

    #partner {
      font-size: 20px;
      text-decoration-line: underline;
      position: relative;
    }
  </style>

</head>
<body>
  <img src="./resources/images/start.png" id="bg">
  <section style="display: flex; flex-direction: column; justify-content: space-between; padding: 7%;">
    <div style="width: 100%; height: 100%;">
      <div id="buttons" style="display: flex; justify-content: space-between;">
        <button type="button" class="btn btn-outline-dark" id="login">Login</button>&nbsp;&nbsp;&nbsp;
        <button type="button" class="btn btn-outline-dark" id="signin">Signin</button>
      </div>
      <a href="#" id="partner">광고신청 페이지</a>
    </div>
  </section>
  
</body>
</html>
