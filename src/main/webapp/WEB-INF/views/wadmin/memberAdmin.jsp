<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<%@include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function btnDelete() {
		var retVal = confirm("강제 탈퇴하시겠습니까?");
		if(retVal == true) {
			location.href="wmDelete";
			return true;
		}
	}
</script>
<style type="text/css">
.container { 
	padding: 10%;
	width: 70%;
}
* {
	font-family: Consolas, sans-serif;
}
</style>
</head>
<body>
<div class="container" align="center">
<h2 align="center">회원 목록</h2><br>
<table class="table table-bordered">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>회원 삭제</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="wmList" items="${list}">
		<tr>
			<td><a href="wmemberForm?id=${wmList.id}">${wmList.id}</a></td>
			<td>${wmList.name}</td>
			<td>${wmList.tel}</td>
			<td>${wmList.addr1}
				${wmList.addr2}
				${wmList.addr3}
			</td>
			<td><a href="wmDelete?id=${wmList.id}" onclick="btnDelete();">삭제</a></td>
			<td>${wmList.reg_date}</td>
		<tr>
	</c:forEach>
</table>
<div align="center">
<ul class="pagination">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="memberAdmin.do?pageNum=${pb.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
			<li><c:if test="${pb.currentPage==i}"><li class="active"></c:if>
				<a href="memberAdmin.do?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage}">
			<li><a href="memberAdmin.do?pageNum=${pb.endPage + 1}">다음</a></li>
		</c:if>		
</ul>
</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>