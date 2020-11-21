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
	$(function() {
		$('#saleprc').click(function() {
			var price = $('#price').val();
			var sale = 100-$('#sale').val();
			$('#saleprice').val(price*sale/100);
			return false;
		});
	});
</script>
<style type="text/css">
.container { 
	padding: 3%;
	width: 22%;
}
* {
	font-family: Consolas, sans-serif;
}
</style>
</head>
<body>
 <div class="container">
 <h2 align="center">상품 수정</h2>
 <form action="wproductUpdate" method="post" enctype="multipart/form-data">
 <input type="hidden" name="p_id" value="${p_id}">
 		<fieldset>
 			<div class="form-group">
 				<label>카테고리 선택</label>
 					<select name="p_category" class="form-control" required="required">
 						<option value="France" selected="selected">프랑스</option>
 						<option value="Italy">이탈리아</option>
 						<option value="Chile">칠레</option>
 						<option value="Argentina">아르헨티나</option>
 						<option value="USA">미국</option>
 						<option value="ice">아이스와인</option>
 						<option value="sweet">스위트와인</option>
 						<option value="champagne">샴페인</option>
 						<option value="others">양주 및 기타 주류</option>
 					</select>
 			</div>
 			<div class="form-group">
 				<label>상품명</label>
 				<input type="text" name="p_name" class="form-control" required="required" value="${list.p_name}">
 			</div>
 			<div class="form-group">
 				<label>상품부제</label>
 				<input type="text" name="p_sname" class="form-control" required="required" value="${list.p_sname}">
 			</div>
 			<div class="form-group">
 				<label>상품 가격 </label>
 				<input style="width: 95%; display: inline; text-align: right;" 
 				type="number" class="form-control" name="p_price" required="required" id="price" value="${list.p_price}">원
 			</div>
 			<div class="form-group">
 				<label>할인률</label><br>
 				<input style="width: 63%; display: inline; text-align: right;" type="text" class="form-control" name="p_sale" required="required" id="sale" value="${list.p_sale}">(%)
 				<input type="button" id="saleprc" class="btn btn-default" value="적용하기">
 			</div>
 			<div class="form-group">
 				<label>할인가</label><br>
 				<input style="width: 95%; display: inline; text-align: right;" type="text" class="form-control" id="saleprice" readonly="readonly">원
 			</div>
 			<div class="form-group">
 				<label>상품이미지</label>
 				<input type="file" name="file1" required="required">
 			</div>
 			<div class="form-group">
 				<label>상품 상세정보</label>
 				<input type="file" name="file2" required="required">
 			</div>
 			<div class="form-group">
 				<label>상품 수량</label>
 				<input type="text" style="width: 95%; display: inline; text-align: right;" class="form-control" name="p_count" required="required" value="${list.p_count}" >개
 			</div>
 			<br>
 		<div class="form-group" align="center">
 			<input type="reset" value="취소" class="btn btn-danger">
 			<input type="submit" value="수정" class="btn btn-info">
 			<a onclick="history.back()" class="btn btn-warning">뒤로가기</a>
 		</div>
</fieldset>
</form>
 </div>
</body>
</html>
<%@ include file="../footer.jsp" %>