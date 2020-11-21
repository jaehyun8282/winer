<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {

	});
</script>
</head>
<body>
	<div class="container" style = "padding: 50px 1px 50px 1px;">
		<form method="post" name="frm" id="frm" action="${path}/insert" enctype="multipart/form-data">
			<input type="hidden" name="ref" value="${ref}"> <input
				type="hidden" name="re_level" value="${re_level}"> <input
				type="hidden" name="re_step" value="${re_step}"> <input
				type="hidden" name="num" value="${num}"> <input
				type="hidden" name="pageNum" value="${pageNum}"> <input
				type="hidden" id="b_id" name="b_id"
				value="<%=(String) session.getAttribute("id")%>">
			<h2>게시글 입력</h2><br><br>
			<div class="form-group">
				<label for="subject">제목</label> 
				<input type="text" class="form-control" id="subject" name="subject" maxlength="30" required="required" autofocus="autofocus">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" rows="10" name="content" required="required" maxlength="500"></textarea>
			</div>
			<div class="form-group">
				<label>파일첨부</label> <input type="file" name="file1">
			</div>
			<button type="submit" class="btn btn-info">확인</button>
			<a class="btn btn-danger" onclick="location.href='javascript:history.back();'">취소</a>
		</form>
	</div>
</body>
</html>
<%@ include file="../footer.jsp" %>