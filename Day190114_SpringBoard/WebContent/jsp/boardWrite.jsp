<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setAttribute("contextPath", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script> -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${contextPath }/css/board.css">
<script type="text/javascript" src="${contextPath }/js/board.js"></script> --%>

<link href="${contextPath }/css/min.css" rel="stylesheet">
<link href="${contextPath }/css/signin.css" rel="stylesheet">
<script src="${contextPath }/js/ie-emulation-modes-warning.js"></script>

<script type="text/javascript">
	//form 요소 선택해서 submit 이벤트가 발생하면
	//유효성검사 하기 :boardCheck()
	$(function(){		
		$("#writeForm").on("submit",function(){
			
			if(!boardCheck("writeForm")){
				return false;
			}
		});
		$('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    	});	
		$('#summernote').summernote();
		});

</script>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<div class= "container">
		<h1>게시글 등록</h1>
		<form action="write" id = "writeForm" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="${name}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass">*필수(게시글 수정,삭제 시 필요합니다.)</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email">*필수</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="summernote" rows="15" cols="70" name = "content"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="file"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
			<input type="reset" value ="다시작성">
			<input type="button" value= "목록" onclick="location.href='boardList'">
		</form>
	</div>
	
	
	
	
	
<%-- 	<div class="container">
      <form class="form-signin" action="write" method="post">
        <h2 class="form-signin-heading" align="center">게시글 등록</h2>
        <label for="inputEmail" class="sr-only">이름</label>
        <input type="text" id="inputEmail" class="form-control" value="${name}" required readonly="readonly" name="name">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" value="" required name="m_pw">
        <label for="inputPassword" class="sr-only">Email</label>
        <input type="email" id="inputPassword" class="form-control" value="${member.M_EMAIL }" required name="m_email" width="100">
        <textarea id="summernote" rows="15" cols="70" name = "content"></textarea>
        <button class="btn btn-lg btn-primary btn-block" type="submit">회원정보 수정</button>
      </form>
      </div> --%>
      
</body>
</html>





