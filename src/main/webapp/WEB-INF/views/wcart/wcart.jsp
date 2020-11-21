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
	alert("장바구니에 상품을 담았습니다");
	var cf = confirm("장바구니를 확인하시겠습니까?");
	 if (cf == true) {
		 location.href="wcartList?p_id=${wcart.p_id}";
	 } else {
		 history.go(-1);
	 }
</script>
</c:if>
<c:if test="${result <= 0}">
<script type="text/javascript">
	alert("장바구니 담기 실패");
	history.go(-1);
</script>
</c:if>
</body>
</html>