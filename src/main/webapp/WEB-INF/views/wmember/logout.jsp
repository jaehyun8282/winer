<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.href="home";
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>