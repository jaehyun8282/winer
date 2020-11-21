<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
	<h3>암호를 입력하세요</h3>
		<form action="${path }/delete" name="frm" onsubmit="return chk()">
			<input type="hidden" name="num" value="${wboard.num }"> <input
				type="hidden" name="password2" value="${wmember.password }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<div class="form-control">
			<label>암호</label> 
				<input type="password" name="password" required="required" autofocus="autofocus">
			</div>
			<br><br><button type="submit" class="btn btn-info">확인</button>
		</form>
	</div>
</body>
</html>