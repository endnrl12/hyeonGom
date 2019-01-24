<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 버튼 클릭 이벤트에 넣어준 요청 파라미터를 활용할 수 있다. 
		
		boardCheck.jsp 이후 로직: 사용자에게 비밀번호를 입력받고
		입력받은 비밀번호가 해당 게시글의 비밀번호와 맞는지 확인
	 --%>
	<div>
		<h1>비밀번호 확인</h1>
		<form action="boardCheckPass" method="post">
			<input type="hidden" name="num" value="${param.num}">
			<input type="hidden" name="type" value="${param.type}">
			<table>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass"></td>
				</tr>
			</table>
			<input type="submit" value="확인">	
		</form>
	</div>
</body>
</html>






