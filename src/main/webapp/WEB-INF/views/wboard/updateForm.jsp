<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style = "padding: 50px 1px 50px 1px;">
		<form action="${path}/update" name="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${wboard.num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<h2>게시글 수정</h2><br><br>
			<div class="form-group">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" name="subject" value="${wboard.subject }">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" rows="10" name="content">${wboard.content }</textarea>
			</div>
			<div class="form-group">
				<label>이미지</label>
				${wboard.b_image }
			</div>
			<div class="form-group">
				<label>파일첨부</label> <input type="file" name="file1">
			</div>
			<input type="submit" class="btn btn-info" value="확인">
			<a class="btn btn-danger"
				onclick="location.href='javascript:history.back();'">취소</a>
		</form>
	</div>
</body>
</html>
<%@ include file="../footer.jsp" %>