<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function btnDelete() {
		var retVal = confirm("탈퇴하시겠습니까?");
		if(retVal == true) {
			location.href="wmLeave";
			return true;
		}
	}
</script>
<style type="text/css">
.container { 
	padding: 10%;
	width: 50%;
}
* {
	font-family: Consolas, sans-serif;
}
</style>
</head>
<body>
<div class="container" align="center">
<h2 align="center">회원정보</h2><br>
<table class="table table-bordered">
	<tr><th>아이디</th><td>
		${wm.id }</td></tr>
	<tr><th>이름</th><td>
		${wm.name }</td></tr>
	<tr><th>주소</th><td>
		${wm.addr1 }
		${wm.addr2 }
		${wm.addr3 }
		</td></tr>
	<tr><th>전화번호</th><td>
		${wm.tel }</td></tr>
	<tr><th>이메일</th><td>
		${wm.email }</td></tr>
	<tr><th>생년월일</th><td>
		${wm.birthday }</td></tr>
	<tr><td colspan="2"><div align="center">
	<input type="button" value="수정" onclick="location.href='wmupdateForm?id=${wm.id}'" class="btn btn-sm">
	<%-- <input type="button" value="회원 탈퇴" onclick="location.href='wmLeave?id=${wm.id}'" class="btn btn-sm"> --%>
	<input type="button" value="회원 탈퇴" onclick="btnDelete();" class="btn btn-sm">
	<input type="button" value="마이페이지" onclick="location.href='wmMypage'" class="btn btn-sm">
	</div></td></tr>
</table>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>