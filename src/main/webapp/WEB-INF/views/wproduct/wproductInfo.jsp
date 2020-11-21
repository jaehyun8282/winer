<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-family: Consolas, sans-serif;
}
.container { 
	padding: 2%;
	margin-right: 450px;
	}
tr.font1 {
	font-size: x-large;
	font-weight: bold;
}
#p_image {
	border: 1px solid gray;
}
</style>
<script type="text/javascript">
	function cart() {
		var id= '${id}';
		if(id === ''){
			alert('로그인 후 장바구니에 담아주십시오');
		}else{
			frm.submit();
		}
	}
	function comma(data_value) {
		return Number(data_value).toLocaleString('en').split(".");
	}
	$(function() {
		$('#plus').click(function() {
			var c = $('#ct_count').val(); //구매 수량s
			var cnt= parseInt($('#p_cnt').text()); //상품 남은 갯수
			if(c < cnt){
				var count = c++ + 1;
				$('#ct_count').val(count);
				var price = $('#price').val();
				$('#hap').empty().append(comma(price * count) + "원");
			}else{
				alert("구매 가능 수량을 초과하였습니다");
			}
		});
		$('#min').click(function() {
			var c = $('#ct_count').val();
			if (c != 0) {
				var count = c-- - 1;
				$('#ct_count').val(count);
				var price = $('#price').val();
				$('#hap').empty().append(comma(price * count) + "원");
			}
		});
		$('#BuyNow').click(function() {
			var sendData = 'buy_count=' + $('#ct_count').val() + '&&' + 'p_id=' + $('#p_id').val();
			location.href="wbuyNowForm?"+sendData;
		});
		
	});
</script>
</head>
<body>
<form action="wcart"  method="post" name="frm">
	<input type="hidden" id="p_id" name="p_id" value="${wproduct.p_id}">
	<div class="container" align="center">
 		<input type="hidden" id="price" name="price"
			value="${(100-wproduct.p_sale)/100*wproduct.p_price}">	
		<table>
			<tr align="center">
				<td rowspan="10">
				<img src="resources/${wproduct.p_image}"
					id="p_image" width="430" height="430" border="1" hspace="50"></td>
			</tr>
			<tr class="font1">
				<td class="line" colspan="2">${wproduct.p_name}</td>
			</tr>
			<tr class="font2">
				<td class="line" colspan="2">${wproduct.p_sname}</td>
			</tr>
			<tr>
				<th width="150">소비자 가격</th>
				<td style="text-decoration: line-through;"><fmt:formatNumber value="${wproduct.p_price }"
						pattern="#,###.###" /> 원</td>
			</tr>
			<tr>
				<th>판매  가격</th>
				<td><fmt:formatNumber
						value="${(100-wproduct.p_sale)/100*wproduct.p_price}"
						pattern="#,###.###" /> 원</td>			
			</tr>
			<tr>
				<th>수량</th>
				<td id="p_cnt">${wproduct.p_count}</td>
			</tr>
			<tr>
				<th>배송정보</th>
				<td>택배배송 평균 / 2일 이내 배송 (토,일,공휴일 제외)</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td>무료</td>
			</tr>
			<tr>
				<th>주문 수량</th>
				<td><a class="btn btn-default btn-sm" id="min">-</a> <input
					type="number" name="ct_count" id="ct_count" value="1" style="width: 50px;">개 <a
					class="btn btn-default btn-sm" id="plus">+</a></td>
			</tr>
			<tr>
				<th>총 구매가격</th>
				<td><span class="number err" id="hap"><fmt:formatNumber
							value="${(100-wproduct.p_sale)/100*wproduct.p_price }"
							pattern="#,###.###" />원 </span></td>
			</tr>
			<tr>
				<td colspan="3" align="right" style="padding-right: 100px;">
				<c:if test="${wproduct.p_count > 0}">
						<div class="btn-toolbar">
							<a href="#" class="btn btn-outline-success btn-rounded  btn-lg btn-danger" onclick="return cart()">장바구니</a>
							<a href="#" class="btn btn-outline-success btn-rounded  btn-lg btn-danger" id="BuyNow" >바로구매</a>
						</div>
					</c:if> <c:if test="${wproduct.p_count<=0 }">
						<div>
							<button type="button" class="btn btn-default">품절이라 상품구매가 불가능합니다</button>
						</div>
					</c:if></td>
					</tr>
			<tr>
				<td colspan="3" style="padding-left: 100px;">
					<div id="detail">
					<br><br><a href="#" class="btn btn-outline-success btn-lg btn-danger" style="width: 600px;">상품상세정보</a>
					</div>
					<div align="center">
						<img src="resources/${wproduct.p_info}" width="1200">
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>
	<div id="review"></div>
</body>
</html>
<%@ include file="../footer.jsp" %>