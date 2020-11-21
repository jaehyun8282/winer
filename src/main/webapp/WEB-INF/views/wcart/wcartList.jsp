<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container { 
	padding: 2%;
	width: 70%;
}
* {
	font-family: Consolas, sans-serif;
	font-family: 'Noto Sans KR', sans-serif;
}
table.td {
	width: 300px;
}
</style>
<script type="text/javascript">
	$(function() {
		var chkbox = document.getElementsByName('chkbox');
		var price;
		var fullPrice=0;
		$.each(chkbox,function(index) {	
			$(this).click(function() {	
				if($(this).prop('checked')) {
					price = $(this).parent().siblings('#totprice').text();
					price = parseInt(price);
					fullPrice = fullPrice + price;
					$('#totbuy').empty().append(fullPrice);
				} else {
					price = $(this).parent().siblings('#totprice').text();
					price = parseInt(price);
					fullPrice = fullPrice - price;
					$('#totbuy').empty().append(fullPrice);
				}
			});
		});
		$('#chkboxAll').click(function() {
			var chkbox = document.getElementsByName('chkbox');
			var rowCnt = chkbox.length - 1;
			if($(this).prop("checked")) {﻿
				for(var i=0; i<=rowCnt; i++) {
					if(chkbox[i].type == "checkbox") {
						chkbox[i].checked = true; 
					}	               
				}      
			} else {
				for(var i=0; i<=rowCnt; i++) {
					if(chkbox[i].type == "checkbox") {
						chkbox[i].checked = false; 
					}
				}
			}
		});
		
		var min = document.getElementsByName('min');		
		$.each(min,function(index) {
			$(this).click(function() {
				var c = $(this).next('#ct_count').val();
				var count = c-- -1;
				if(count>=0) {
					$(this).next('#ct_count').val(count);
					price = $(this).parent().prev().text();
					$(this).parent().next().empty().append(count*price);											
					if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
						price = $(this).parent().prev('#price').text();
						price = parseInt(price);
						fullPrice = fullPrice - price;
						$('#totbuy').empty().append(fullPrice);
					}
				} else {
					alert("수량을 -로 할수 없습니다");
				}
			});
		});
		var pls = document.getElementsByName('pls');
		$.each(pls,function(index) {			
			$(this).click(function() {
				var c = $(this).siblings('#ct_count').val(); // c는 구매수량
				var cnt = parseInt($(this).siblings('#pro_count').val()); //cnt는재고량 */
 				if(c<cnt) {
					var count = c++ +1;
					$(this).siblings('#ct_count').val(count);
					price = $(this).parent().prev().text();
					$(this).parent().next().empty().append(count*price);
					if($(this).parent().siblings('#chk').children('#chkbox').prop('checked')) {
						price = $(this).parent().prev('#price').text();
						price = parseInt(price);
						fullPrice = fullPrice + price;
						$('#totbuy').empty().append(fullPrice);
					}
				} else {
					alert("구매 가능 수량을 초과하였습니다");
				}
			});
		});		
	});	
	function delchk() {
		var userid = "";
		var chkbox = document.getElementsByName("chkbox");
		var indexid = false;
		for(i=0; i<chkbox.length; i++) {
			if(chkbox[i].checked) {
				if(indexid) {
					userid = userid + '-';
				}
				userid = userid + chkbox[i].value;
				indexid = true;
			}
		}
		if(!indexid) {
			alert("삭제할 상품을 체크해 주세요");
			return;
		}
		var cf = confirm("삭제 하시겠습니까?");
		if(cf) {
			$('#userid').val(userid);			
			$('#name').submit();
		} 
	}
	function buy() {
		var userid = "";
		var chkbox = document.getElementsByName("chkbox");
 		var cnt = "";
		var ct_count = document.getElementsByName("ct_count");
		var indexid = false;
		for(i=0; i<chkbox.length; i++) {
			if(chkbox[i].checked) {
				if(indexid) {
					userid = userid + '-';
					cnt = cnt + '-';
				}
				userid = userid + chkbox[i].value;
				cnt = cnt + ct_count[i].value;
				indexid = true;
			}
		}
		if(!indexid) {
			alert("결제할 상품을 체크해 주세요");
			return;
		}
		var cf = confirm("상품을 주문하시겠습니까?");
		if(cf) {			
			$('#frm #userid').val(userid);
			$('#frm #cnt').val(cnt);
			/* alert(userid);
			alert(cnt);
			alert($('#frm #userid').val());
			alert($('#frm #cnt').val()); */
			var totprice = $('#totbuy').text();
			$('#tot').val(totprice);
			$('#frm').submit();			
		} 
	}
</script>
</head>
<div class="container">
<h1>Cart</h1>
<form action="wcartDelete" id="name" method="post">
	<input type="hidden" id="userid" name="userid">
</form>
<form action="wbuyForm" method="post" id="frm">
	<input type="hidden" id="userid" name="userid">
	<input type="hidden" id="cnt" name="cnt">
	<input type="hidden" name="tot" id="tot">
	<table class="table table-hover">
		<tr align="center">	
			<td><input type="checkbox" id="chkboxAll"></td>
			<td colspan="2">상품</td>
			<td>판매가</td>
			<td>수량</td>
			<td id="123">총 가격</td>
		</tr>
		<c:forEach var="cart" items="${wcart }">
			<c:if test="${cart.ct_del.equals('n') }">
				<tr align="center">				
					<td id="chk">
						<c:if test="${cart.p_count==0 }">
							<input type="checkbox" name="chkbox" id="chkbox" value="${cart.ct_id }">
						</c:if>
						<c:if test="${cart.p_count!=0 }">
							<input type="checkbox" name="chkbox" id="chkbox" value="${cart.ct_id }">
						</c:if>
					</td>				
					<td style="padding: 20px;"><img src="resources/${cart.p_image}" height="100" width="100"></td>
					<td style="padding: 50px;"><a href="wproductInfo?p_d=${cart.p_id}">${cart.p_name}</a></td>			
					<td id="price" name="price" style="padding: 50px;">
						<fmt:formatNumber value="${(100-cart.p_sale)/100*cart.p_price}" pattern="#,###.###"/> 원
					</td>
					<td style="padding: 50px; width: 200px;">
						<c:if test="${cart.p_count==0 }">
							임시 품절된 상품입니다
							<input type="hidden" name="ct_count" id="ct_count" value="null">
						</c:if>
						<c:if test="${cart.p_count!=0 }">
							<a class="btn btn-default btn-sm" id="minus" name="min">-</a>
							<input type="number" name="ct_count" id="ct_count" value="${cart.ct_count}" style="width: 35%; text-align: right;">
							<input type="hidden" name="p_count" id="p_count" value="${cart.p_count }">
							<a class="btn btn-default btn-sm" id="plus" name="pls">+</a>
						</c:if>
					</td>
					<td id="totprice" style="padding: 50px;">				
						<b><fmt:formatNumber value="${(100-cart.p_sale)/100*cart.p_price*cart.ct_count}" pattern="#,###.###"/> 원
					</b></td>
				</tr>
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="5"><b>결제 예정 금액</b></td>
			<td colspan="1" id="totbuy" align="right"></td>
		</tr>
		<tr>
			<td colspan="6" align="right">
				<button type="button" class="btn btn-default" onclick="delchk()">삭제</button>
				<button type="button" class="btn btn-default" onclick="return buy()">주문 결제</button>				
			</td>
		</tr>
	</table>
</form>
</div>
<body>
</body>
</html>
<%@ include file="../footer.jsp" %>