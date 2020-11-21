<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delchk() {
		var cf = confirm("상품을 삭제하시겠습니까?");
		if (cf == true) {
			return true;
		} else {
			return false;
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
	<div class="container">
		<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>종류</td>
			<td>이름</td>
			<td>가격</td>
			<td>할인률</td>
			<td>판매가격</td>
			<td>이미지</td>
			<td>등록날짜</td>
			<td>수량</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="wproduct" items="${list}">
		<c:set value="${no}" var="no"></c:set>
			<tr>
				<td>${no}</td>
				<td>
				<c:if test="${wproduct.p_category == 'France'}">프랑스</c:if>
				<c:if test="${wproduct.p_category == 'Italy'}">이탈리아</c:if>
				<c:if test="${wproduct.p_category == 'Chile'}">칠레</c:if>
				<c:if test="${wproduct.p_category == 'Argentina'}">아르헨티나</c:if>
				<c:if test="${wproduct.p_category == 'USA'}">미국</c:if>
				<c:if test="${wproduct.p_category == 'ice'}">아이스와인</c:if>
				<c:if test="${wproduct.p_category == 'sweet'}">스위트와인</c:if>
				<c:if test="${wproduct.p_category == 'champagne'}">샴페인</c:if>
				<c:if test="${wproduct.p_category == 'others'}">양주 및 기타 주류</c:if>
				<td><a href="wproductInfo?p_id=${wproduct.p_id}">${wproduct.p_name}</a></td>
				<td><fmt:formatNumber value="${wproduct.p_price}"
				pattern="#,###.###"/></td>
				<td>${wproduct.p_sale}%</td>
				<td><fmt:formatNumber
					value="${(100-wproduct.p_sale)/100*wproduct.p_price}"
					pattern="#,###.###"/></td>
				<td><img src="resources/${wproduct.p_image}" width="30" height="30"></td>
				<td>${wproduct.p_date}</td>
				<td>${wproduct.p_count}</td>
		<c:if test="${not empty id}">
			<c:if test="${id == 'master'}">
				<td><a href="wproductUpdateForm?p_id=${wproduct.p_id}"><button
				type="button" class="btn btn-default">수정</button></a></td>
				<td><a href="wproductDelete?p_id=${wproduct.p_id}"><button
				type="button" class="btn btn-default" onclick="return delchk()">삭제</button></a></td>
			</c:if>
		</c:if>
	</tr>
	<c:set value="${no -1}" var="no"></c:set>
		</c:forEach>
	</table>
	<!-- 페이징~ -->
	<div align="center">
	<ul class="pagination">
		<c:if test="${pp.startPage > pp.pagePerBlock}">
			<li><a href="${path}/wproductList?pageNum=${pp.startPage -1 }">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<li> <c:if test="${pp.currentPage==i}"><li class="active"></c:if>
			<a href="${path}/wproductList?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
			<li><a href="${path}/wproductList?pageNum=${pp.endPage +1}">다음</a></li>
		</c:if>
	</ul>
	</div>
	<!-- ~페이징 -->
		<div align="right">
			<c:if test="${not empty id}">
				<c:if test="${id == 'master'}">
					<a href="wproductForm">
					<button type="button" class="btn btn-default">상품등록</button>
					</a>
				</c:if>
			</c:if>
		</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>