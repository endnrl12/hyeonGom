<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/board.css">
	
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
</head>
<body>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    ${userid}
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${contextPath }/member/checkPass">회원정보 수정</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="${contextPath }/member/logout">로그아웃</a></li>
  </ul>
</div>
	<%-- type : ${param.type }<br>
	keyword : ${param.keyword } --%>
	<%-- 게시글 목록 출력 , list받아와서 반복문으로 출력--%>

	<div class="wrap">
		<table>
			<tr>
				<td colspan="5"><a href="write">게시글 등록</a></td>
			</tr>
			<tr>
				<!-- <th>RNUM</th> -->
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.NUM }</td>
					<td><a href="view?num=${board.NUM}">${board.TITLE }
					<c:if test="${board.RCOUNT != 0 }">
						[${board.RCOUNT }]
					</c:if>
					</a>
				<%-- 	${board.FILENAME } --%>
					<c:if test="${board.FILENAME != null }">
						<img alt="첨부파일" src="${contextPath}/img/icon.jpg" width="30" height="30" align="middle">
					</c:if>
					</td>
					
					<td>${board.NAME }</td>
					<td>${board.WRITE_DATE }</td>
					<td>${board.READ_COUNT }</td>
				</tr>
			</c:forEach>
			<%-- 여기에 페이징 처리 부분 작성 --%>
			<tr>
			
				<td colspan="5" align="center">
					<c:if test="${startPage != 1 }">
						<a href="boardList?page=1&type=${param.type}&keyword=${param.keyword}">[처음]</a>
						<a href="boardList?page=${startPage-1 }&type=${param.type}&keyword=${param.keyword}">[이전]</a>
					</c:if> 
					<c:forEach var="pageNum" begin="${startPage }"
						end="${endPage < totalPage? endPage : totalPage }">
						<c:choose>
							<c:when test="${pageNum == page }">
								<b>[${pageNum }]</b>
							</c:when>
							<c:otherwise>
								<a href="boardList?page=${pageNum }&type=${param.type}&keyword=${param.keyword}">[${pageNum }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${totalPage > endPage }">
						<a href="boardList?page=${endPage+1 }&type=${param.type}&keyword=${param.keyword}">[다음]</a>
						<a href="boardList?page=${totalPage }&type=${param.type}&keyword=${param.keyword}">[마지막]</a>
					</c:if>
				</td>
			</tr>
			<tr><%--검색기능 --%>
				<%--검색어를 포함한 게시글 목록을 가져오면 됨 --%>
				<td colspan="5" align="center">
					<form action="boardList">
						<select name="type">
							<option value="1">제목</option>
							<option value="2">작성자</option>
							<option value="3">제목+작성자</option>
							<option value="4">내용</option>
						</select>
						<input type="text" name="keyword" placeholder="검색어를 입력하세요">
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
		<p></p>

	</div>
</body>
</html>


