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
<title>회원정보 수정 페이지</title>
<link href="${contextPath }/css/min.css" rel="stylesheet">
<link href="${contextPath }/css/signin.css" rel="stylesheet">
<script src="${contextPath }/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<!-- 	<form action="modify" method="post">
	<label>비밀번호 : <input type="password" name="pw"> </label>
	<label>이름 : <input type="text" name="name"> </label>
	<label>이메일 : <input type="text" name="email"> </label>
	<input type="submit" value="수정">
	</form> -->
	
	<div class="container">

      <form class="form-signin" action="modify" method="post">
        <h2 class="form-signin-heading" align="center">회원정보 수정</h2>
        <label for="inputEmail" class="sr-only">이름</label>
        <input type="text" id="inputEmail" class="form-control" value="${member.M_NAME }" required autofocus name="m_name">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" value="" required name="m_pw">
        <label for="inputPassword" class="sr-only">Email</label>
        <input type="email" id="inputPassword" class="form-control" value="${member.M_EMAIL }" required name="m_email">
        <input type="hidden" value="${member.M_NUM }" name="m_num">
        <button class="btn btn-lg btn-primary btn-block" type="submit">회원정보 수정</button>
      </form>
		
    </div> <!-- /container -->
    <script src="${contextPath }/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>