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
	<div class="container" align="center" style = "padding: 50px 1px 50px 1px;">
	<img src="resources/review.png" width=260><br><br>
		<c:set var="num" value="${no }"></c:set>
		<table class="table table-striped">
			<tr>
			 	<th>번호</th>
			 	<th>제목</th>
			 	<th>작성자</th>
			 	<th>조회수</th>
			 	<th>작성일</th>
			 </tr>	
			 
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">데이터가 없습니다 </th>
			</tr>
		</c:if>
	
		<c:if test="${not empty list}">
		<c:forEach var="wboard" items="${list }">
			<tr>
				<td><%-- ${wboard.num} --%>${num}
				<c:set var="num" value="${num - 1}"></c:set></td>
				<c:if test="${wboard.del == 'y' }">
					<td colspan="4">삭제된 글입니다</td>
				</c:if>			
					<c:if test="${wboard.del != 'y' }">
					<td title="${wboard.content}">
					<!-- 답변글이면 -->
					<c:if test="${wboard.re_level > 0}">
						<img src="${path}/resources/level.gif" height="5" width="${wboard.re_level * 10}"> <!-- 들여쓰기 -->
						<img src="${path}/resources/re.gif">					
					</c:if>
					<c:if test="${wboard.readcount >= 100 }">
						<img alt="" src="${path}/resources/hot.gif">
					</c:if>
						<a href="${path}/view?num=${wboard.num}&pageNum=${pb.currentPage}">${wboard.subject}</a></td>
					<td>${wboard.b_id }</td>
					<td>${wboard.readcount }</td>
					<td>${wboard.re_date }</td>
				</c:if></tr>
		</c:forEach>
		</c:if>
		</table>
		
		<!-- 페이징 -->
		<div align="center">
			<ul class="pagination">
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li><a href="${path}/list?pageNum=1&search=${wboard.search}&keyword=${wboard.keyword}">
							<span class="glyphicon glyphicon-backward"></span>
						</a></li>
					<li><a href="${path}/list?pageNum=${pb.startPage - 1}&search=${wboard.search}&keyword=${wboard.keyword}">
							<span class="glyphicon glyphicon-triangle-left"></span>
						</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage }">
					<c:if test="${i==pb.currentPage}">
						<li class="active"><a href="${path}/list?pageNum=${i}&search=${wboard.search}&keyword=${wboard.keyword}">${i}</a></li>
					</c:if>
					<c:if test="${i!=pb.currentPage}">
						<li><a href="${path}/list?pageNum=${i}&search=${wboard.search}&keyword=${wboard.keyword}">${i}</a></li>
					</c:if>		
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="${path}/list?pageNum=${pb.endPage + 1}&search=${wboard.search}&keyword=${wboard.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
						</a></li>
					<li><a href="${path}/list?pageNum=${pb.totalPage}&search=${wboard.search}&keyword=${wboard.keyword}">
							<span class="glyphicon glyphicon-forward"></span>
						</a></li>
				</c:if>
			</ul>
		</div>
		<!-- //페이징 -->
		
		
		<!-- 검색 -->
		<form action="${path}/list">
			<select name="search">
				<c:forTokens var="sh" items="b_id,subject,content,subcon" 
					delims="," varStatus="i">
					<c:if test="${sh==wboard.search}">
						<option value="${sh}" selected="selected">${tit[i.index] }</option>
					</c:if>
					<c:if test="${sh!=wboard.search}">
						<option value="${sh}">${tit[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${wboard.keyword}">
			<input type="submit" value="확인">
		</form>
		<!-- //검색 -->
			<br />
			<c:if test="${sessionScope.id != null }">
			<a href="${path}/insertForm?nm=null&pageNum=1" class="btn btn-info">게시글 입력</a>
			</c:if>
		</div>
	</body>
</html>
<%@ include file="../footer.jsp" %>