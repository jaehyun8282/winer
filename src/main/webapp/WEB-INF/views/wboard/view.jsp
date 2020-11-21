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
	$(function() {
		$('#rbdListDisp').load('${path}/replyList?bno=${wboard.num}');

		$('#rInsert').click(function() {
			/* var sendData = 'bno='+frm.bno.value+'&replyer='+frm.replyer.value+'&replytext='+frm.replytext.value; */
			var sendData = $('#frm').serialize();
			$.post('${path}/rInsert', sendData, function(data) {
				alert('댓글이 작성되었습니다');
				$('#rbdListDisp').load('${path}/replyList?bno=${wboard.num}');
				/* alert(data);
				$('#rbdlistDisp').load(data); */
				frm.replytext.value = "";
			});
		});
	});
	
</script>
</head>
<body>
	<div class="container" align="center">
	<img src="resources/review.png" width=260>
	<br><br>
		<table class="table table-hover">
			<caption class="text-primary">게시글</caption>
			<tr>
				<td>제목</td>
				<td>${wboard.subject }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${wboard.b_id }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${wboard.content }</td>
			</tr>
			<c:if test="${wboard.b_image != 'nothing.jpg' }">
			<tr>
				<td>이미지</td>
				<td><img src="${path }/image/${wboard.b_image }"></td>
			</tr>
			</c:if>
			<tr>
				<td>조회수</td>
				<td>${wboard.readcount }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${wboard.re_date }</td>
			</tr>
			<tr>
				<td colspan="2"><a
					href="${path }/list?num=${wboard.num}&pageNum=${pageNum}"
					class="btn btn-info">게시글 목록</a> 
					<c:if test="${id == wboard.b_id}">
						<a href="${path }/updateForm?num=${wboard.num}&pageNum=${pageNum}"
							class="btn btn-warning">수정</a>
						<a href="${path }/deleteForm?num=${wboard.num}&pageNum=${pageNum}"
							class="btn btn-danger">삭제</a>
					</c:if>
					<c:if test="${sessionScope.id != null }">
						<a href="${path }/insertForm?nm=${wboard.num}&pageNum=${pageNum}"
							class="btn btn-success">답글</a>
					</c:if>
				</td>
			</tr>

		</table>
		<form name="frm" id="frm" action="${path }/replyList">
			<input type="hidden" name="bno" value="${wboard.num }">
			<input type="hidden" name="replyer" value="${sessionScope.id }">	
				<h2 align="left">댓글</h2>
				<div id="rbdListDisp"></div>
					<!-- 회원 게시글인 경우 작성자는 로그인한 사람의 이름 또는 id -->
			<table class="table table-hover">
					<c:if test="${sessionScope.id !=null }">
						<tr>
							<td>작성자</td>
							<td>${sessionScope.id}</td>
							<td width="500">
							<div>
							<textarea name="replytext" rows="5" cols="90" maxlength="150"></textarea>
							</div>
							</td>
							<td width="100">
							<input type="button" value="확인" id="rInsert" class="btn btn-info">
							</td>
						</tr>
					</c:if>
			</table>
		</form>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>