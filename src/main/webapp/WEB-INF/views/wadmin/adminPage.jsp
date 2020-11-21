<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
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
<h1>관리자 페이지</h1><br>
<fieldset>
<a href="memberAdmin" class="btn btn-default btn-block" style="width: 40%;">회원관리</a>
<a href="wproductList" class="btn btn-default btn-block" style="width: 40%;">상품관리</a>
<a href="Gbuy.do" class="btn btn-default btn-block" style="width: 40%;">주문 관리</a>
<a href="GbuyCompList.do" class="btn btn-default btn-block" style="width: 40%;">게시글 관리</a>
<a href="logout" class="btn btn-default btn-block" style="width: 40%;">로그아웃</a>
</fieldset>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>