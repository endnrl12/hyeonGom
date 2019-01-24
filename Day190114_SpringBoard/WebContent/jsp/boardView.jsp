<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setAttribute("contextPath", request.getContextPath()); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script type="text/javascript" src="${contextPath }/js/board.js"></script>
  <link rel="stylesheet" type="text/css" href="${contextPath }/css/board.css">
<script type="text/javascript">
	$(function(){
		var fileName = getOriginFilename('${board.FILENAME}');
		/* var fileCheck = fileCheck(fileName); */
		$("#fileLink").text(fileName);
		$("#replyForm").on("submit",function(){
			var d = $(this).serialize();
			$.ajax({
				url : "${contextPath}/replies",
				data : d,
				type :"post",
				dataType : "json",
				success : function(data){
					if(data){
						createReplyList(); //댓글쓰기 완료 후 댓글 불러오기 
					}
				}
			});
			return false;
		});
		createReplyList(); //문서가 로딩되고 나서 댓글 불러오기
		$("#btnClose").on("click",function(){
			$("#modal-modify").hide("slow");
		});
		$("#btnModify").on("click",function(){
			//수정요청 , 각내용 + 글번호  + 비밀번호 
			var replyId = $("#modify-id").val();
			var d = $("#modal-form").serialize();
			$.ajax({
				url:"${contextPath}/replies/"+replyId,
				data:d,
				type:"post",
				dataType:"json",
				success : function(data){
					if(data){
						alert("수정되었습니다.");
						$("#modal-modify").hide("slow");
						createReplyList();
					}else{
						alert("수정실패");
					}
					
				}
			});
			return false;
		});
		$("#btnDelete").on("click",function(){
			//삭제요청 , 댓글번호 + 비밀번호
			var pass = $("#modify-pass").val();
			var id =  $("#modify-id").val();
			$.ajax({
				url:"${contextPath}/replies/delete",
				data: {"id":id, "pass":pass},
				type:"post",
				dataType:"json",
				success : function(data){
					if(data){
						alert("삭제되었습니다.");
						$("#modal-modify").hide("slow");
						createReplyList();
					}else{
						alert("삭제실패");
					}
				}
			});
			return false;
		});
	});
	
	function createReplyList(){
		//게시글 번호를 이용해서 게시글에 달린 댓글 조회하고
		//댓글이 있으면 해당 댓글을 화면에 출력하기 
		var replyTable = $("#replies");
		$("#replies tr:gt(0)").remove();
		$.ajax({
			url: "${contextPath}/replies/all/${board.NUM}",
			type:"get",
			dataType : "json",
			success : function(data){
				
				for(var i in data){
					var tr = $("<tr>");
					var btn = $("<button>수정</button>");
					$("<td>").text(data[i].NAME).appendTo(tr);
					$("<td>").text(data[i].CONTENT).appendTo(tr);
					$("<td>").append(btn).appendTo(tr);
					tr.appendTo(replyTable);
					(function(m){
						btn.on("click",function(){
							//모달창 띄우기
							//현재 데이터 정보를 포함해서 화면을 보이기
							$("#modify-id").val(data[m].ID);
							$("#modify-name").val(data[m].NAME);
							$("#modify-content").val(data[m].CONTENT);
							$("#modal-modify").show("slow");
						});						
					})(i);
				}
			}
		});
	}
</script> 
</head>
<body>
	<%--boardView.jsp --%>
	<div class="wrap">
		<h1>게시글 상세보기</h1>
		<table>
			<tr>
				<th>작성자</th>
				<td>${board.NAME }</td>
				<th>이메일</th>
				<td>${board.EMAIL }</td>
				<%-- <td>${board.NUM }</td> --%>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.WRITE_DATE}</td>
				<th>조회수</th>
				<td>${board.READ_COUNT }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
				${board.TITLE }

				</td>
				
			</tr>
				
			<tr>
				<th>내용</th>
				<td colspan="3">${board.CONTENT }
				<c:if test="${board.FILENAME !=null }">				
				<img width="400" height="300" src="${contextPath }/image?fileName=${board.FILENAME }">
				</c:if>
				</td>
				
			</tr>
			<tr>
				<th>첨부파일 </th>
				<td colspan="3">
					<%-- <c:choose>
						<c:when test="${ != null }"> --%>
							<a href="${contextPath }/board/download?num=${board.NUM}" id="fileLink"></a>
						<%-- </c:when>
						<c:otherwise>
							첨부된 파일이 없습니다.
						</c:otherwise>
					</c:choose> --%>
					
				</td>
			</tr>
		</table>
		<%-- 수정/삭제 로직: 비밀번호 입력해서 맞으면 수정/삭제하기 
		1. 버튼누르면 비밀번호 입력화면 요청 , board_check_pass_form
		2. 비밀번호 확인할 때 어떤 글을 수정/삭제 할건지 알아야 하기 때문에 글 번호(board.num)도 같이 전달
		3. 삭제/수정 을 알아야 하기 때문에 type(update/delete) 같이 전달 
		--%>
		<button onclick="location.href='boardCheckPassForm?num=${board.NUM}&type=update'">수정</button>
		<button onclick="location.href='boardCheckPassForm?num=${board.NUM}&type=delete'">삭제</button>
		<button onclick="location.href='boardList'">목록</button>
		<button onclick="location.href='write'">새글쓰기</button>
	</div>
	<div class="wrap">
	댓글 
	<form name = "replyForm" id = "replyForm">
		<!-- <input type="hidden" name="command" value="reply_write"> -->
		<input type="hidden" name="boardNum" value="${board.NUM}">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name = "name" id = "name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td> <textarea rows="3" cols="30" name="content"></textarea></td>
			</tr>
			
		</table>
		<input type="submit" value = "등록">
	</form>	
	<hr>
		<table id = "replies" border="1">
			<tr>
				<th>이름</th>
				<th>내용</th>
				<th>삭제</th>
			</tr>
		</table>
	</div>
	<div id = "modal-modify">
		<form id = "modal-form">
			<input type="hidden" name="id" id="modify-id" value="${reply.ID }">
			<input type="hidden" name="boardNum" value="${board.NUM}">
			<table class="modal-table">
				<tr>
					<th>이름</th>
					<td><input type="text" name = "name" id = "modify-name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" id = "modify-pass"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td> <textarea rows="3" cols="30" name="content" id ="modify-content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id ="btnModify" value="수정"/>
						<input type="button" id ="btnDelete" value="삭제"/>
						<input type="button" id ="btnClose" value="닫기"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%-- ${replyCount }
	<c:forEach items="${replyCount }" var="reply">
		${reply.COUNT(R={CONTENT) }
	</c:forEach> --%>
</body>
</html>




