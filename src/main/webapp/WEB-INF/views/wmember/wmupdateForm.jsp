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
$(function(){ 
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pwd1").val(); 
		var pwd2=$("#pwd2").val(); 
		if(pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
				} 
			} 
		}); 
	});
function execPostCode() {
	new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>
<style type="text/css">
.container { 
	padding: 3%;
	width: 20%;
}
* {
	font-family: Consolas, sans-serif;
}
</style>
</head>
<body>
<div class="container">
<h2 align="center">회원정보 수정</h2><br>
<form action="wmupdate" method="post" name="frm">
	<input type="hidden" name="id" value="${wmember.id}">
	<input type="hidden" name="birthday" value="${wmember.birthday}">
	<fieldset>
	<div class="form-group">
		<label>아이디</label>
			${wmember.id}
	</div>
	<div class="form-group">
		<label>비밀번호</label>
		<input type="password" class="form-control" name="password" id="pwd1" placeholder="비밀번호" required="required">
		<br>
		<label>비밀번호 확인</label>
		<input type="password" class="form-control" name="passChk" id="pwd2" placeholder="비밀번호 확인" required="required">
	<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
	</div>
	<div class="form-group">
		<label>이름</label>
		<input type="text" class="form-control" name="name" value="${wmember.name}">
	</div>
	<div class="form-group">
		<label>전화번호</label>
		<input type="text" class="form-control" name="tel" value="${wmember.tel}">
	</div>
	<div class="form-group">
		<label>주소</label><br>
			<input style="width: 40%; display: inline;" type="text" class="form-control" name="addr1" 
			value="${wmember.addr1}" placeholder="우편번호">
			<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 검색</button>
		</div>
		<div class="form-group">
			<input style="top: 5px;" type="text" class="form-control" name="addr2" value="${wmember.addr2}"
				placeholder="도로명 주소">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="addr3" value="${wmember.addr3}" placeholder="상세 주소">
		</div>
	<div class="form-group">
		<label>이메일</label>
		<input type="text" class="form-control" name="email" value="${wmember.email}">
	</div>
	<div class="form-group">
		<label>생년월일</label>
		${wmember.birthday}
	</div>
	<div class="form-group" align="center">
			<input type="submit" id="submit" value="수정" class="btn btn-success">
			<a class="btn btn-danger" onclick="location.href='javascript:history.back();'">취소</a>
		</div>
</fieldset>
</form>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>