<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setAttribute("contextPath", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});

$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>



<link rel="stylesheet" type="text/css" href="${contextPath }/css/board.css">
</head>
<body>
	<div class= "wrap">
		<h1>게시글 수정</h1>
		<form action="modify" id = "writeForm" method="post">
			
			<input type="hidden" name= "num" value="${board.NUM }">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="${board.NAME }" readonly="readonly" name="name">*필수</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass">*필수(게시글 수정,삭제 시 필요합니다.)</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="${board.EMAIL }" name="email">*필수</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" value= "${board.TITLE }" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<!-- <textarea rows="15" cols="70" name="content"> -->
						<textarea name="content" id="summernote">
							${board.CONTENT }
						</textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="수정">
			<input type="reset" value ="다시작성">
			<input type="button" value= "목록" onclick="location.href='boardList'">
		</form>
	</div>
</body>
</html>





