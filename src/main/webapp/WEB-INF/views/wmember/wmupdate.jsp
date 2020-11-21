<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
		location.href="wmemberForm";
	</script>
</c:if>
<c:if test="${result <= 0}">
	<script type="text/javascript">
		alert("다시 확인해주세요!");
		history.go(-1);
	</script>
</c:if>
</body>
</html>