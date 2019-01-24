<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setAttribute("contextPath", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>비밀번호를 입력하세요</title>
<link href="${contextPath }/css/min.css" rel="stylesheet">
<link href="${contextPath }/css/signin.css" rel="stylesheet">
<script src="${contextPath }/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<div class="container">

      <form class="form-signin" action="checkPass" method="post">
        <h2 class="form-signin-heading" align="center">비밀번호 확인</h2>
        <label for="inputEmail" class="sr-only">Password</label>
        <input type="password" id="inputEmail" class="form-control" placeholder="Pssword를 입력하세요" required autofocus name="pw">
       
        <button class="btn btn-lg btn-primary btn-block" type="submit">확인</button>
      </form>
		
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${contextPath }/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>