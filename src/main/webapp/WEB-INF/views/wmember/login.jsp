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
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("환영합니다 ${id}님");
		location.href="home";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("아이디/패스워드가 틀렸습니다");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result < 0}">
	<script type="text/javascript">
		alert("아이디/패스워드 정보가 없습니다");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
<%@ include file="../footer.jsp" %>