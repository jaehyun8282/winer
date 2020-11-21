<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
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
	 	alert("회원 탈퇴되었습니다.");
	 	<% session.invalidate(); %>
	 	location.href="loginForm";
	</script>
</c:if>
<c:if test="${result <= 0}">
	<script type="text/javascript">
	 	alert("정말 탈퇴하실 거예요?");
	 	history.go(-1);
	</script>
</c:if>
</body>
</html>
<%@ include file="../footer.jsp" %>