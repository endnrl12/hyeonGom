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
</head>
<body>
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
					<%-- <td>${board.RNUM }</td> --%>
					<td>${board.NUM }</td>
					<td><a href="view?num=${board.NUM}">${board.TITLE }

				<c:forEach items="${replyCount }" var="reply">
					<%-- ${(board.NUM eq reply.BNUM) && (reply.COUNT ne 0)} --%>
					<c:if test="${(board.NUM eq reply.BNUM) && (reply.COUNT ne 0) }">
						 [${reply.COUNT }]
					</c:if>
				</c:forEach>
					</a></td>
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
							<c:when test="${pageNum == param.page }">
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


