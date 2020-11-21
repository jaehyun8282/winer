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
	function confirmSave(checkbox) {
		var isRemember;
		
		if(checkbox.checked) {
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
		
		if(!isRemember)
			checkbox.checked = false;
		}
	}
	$(window).load(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    var pageUrl = window.location.href;
	    
	    $("input[name='id']").val(userInputId); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>
<style type="text/css">
/* .container { 
	width: 20%;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -150px;
	margin-top: -150px;
} */
.container { 
	padding: 10%;
	width: 40%;
}
 * {
	font-family: Consolas, sans-serif;
} 
</style>
</head>
<body>
<div class="container">
<h2 align="center">로그인</h2>
<form action="login" method="post" name="frm">
	<fieldset>
		<div class="form-group">
			<input type="text" class="form-control" name="id" id="id" placeholder="ID"
				required="required" autofocus="autofocus" maxlength="15">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="password" id="password" placeholder="Password"
				required="required" maxlength="20">
		</div>
			<div class="checkbox">
			<label>
				<input type="checkbox" id="idCheck" onclick="confirmSave(this)">아이디 기억
			</label>
		</div>
			<input type="submit" class="btn btn-success btn-block" value="로그인">
			<a class="btn btn-warning btn-block" href="joinForm">회원가입</a>
	</fieldset>
</form>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>