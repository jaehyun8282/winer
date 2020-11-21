<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	padding: 10%;
}

* {
	font-family: Consolas, sans-serif;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h1>${sessionScope.id}님의페이지</h1>
		<br> <a href="wmemberForm" class="btn btn-default btn-block"
			style="width: 40%;">회원정보</a> <a href="GboardxMyList.do"
			class="btn btn-default btn-block" style="width: 40%;">나의 문의내역</a> <a
			href="Gbuy.do" class="btn btn-default btn-block" style="width: 40%;">주문/배송목록</a>
			<a href="logout" class="btn btn-default btn-block" style="width: 40%;">로그아웃</a>
	</div>
</body>
</html>
<%@ include file="../footer.jsp" %>