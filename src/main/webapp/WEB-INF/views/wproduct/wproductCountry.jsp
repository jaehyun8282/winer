<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function comma(data_value) {
		return Number(data_value).toLocaleString('en').split(".");
	}
</script>
<style type="text/css">
* {
	font-family: Consolas, sans-serif;
	font-family: 'Noto Sans KR', sans-serif;
}
.container { 
	padding: 2%;
	display: table;
	overflow: hidden;
}
.content{
	 width: 850px;
	 float: left;
	 display: table-cell;
}
.navi {
        width: 150px;
        float : left;
        text-indent: 10px;
        text-align: center;
        font-family: Consolas, sans-serif;
        display: table-cell;
        margin-right: 50px;
}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
}
    li.group {
        margin-bottom: 3px;
}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#620000;
        color : white;
        cursor:pointer;
        font-weight: bold;
}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#f4f4f4;
        cursor:pointer;
}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
}
    ul.sub li:hover {
        background:#F4DEDE;
}
.image {
	position: relative;
}
.image div {
	width : 500px;
	z-index: 2;
	position: absolute;
	top: 49%;
	left: 65%;
	transform : translate(-50%, -50%);
}
h4.title {
	color: #620000;
}
b.font {
	color: #620000;
	font-size: large;
}
.product {
	margin: 40px;
}
.input-group {
	left : 20px;
	width: 300px;
	float: right;
}
</style>
</head>
<body>
<div class="container">
<div class="navi">
  <ul id="navi">
        <li class="group">
            <div class="title">나라별</div>
            <ul class="sub">
                <li><a href="wproductF">프랑스</a></li>
                <li><a href="#">이탈리아</a></li>
                <li><a href="#">칠레</a></li>
                <li><a href="#">아르헨티나</a></li>
                <li><a href="#">미국</a></li>
            </ul>
        </li>
    </ul>
    </div>
    <div class="content">
		<table class="table table-hover">
		<h3><b>나라별</b></h3>
		<div class="image">
		<img src="resources/stop_bg04.jpg">
		<div><h4 class="title"><b>"19세 미만 청소년에게는 주류를 판매하지 않습니다."</b></h4>
		</div>
		</div><br>
		<form action="wproductSearch" role="search" class="form-inline mr-auto">
       	 <div class="input-group">
         	<input type="text" name="search" class="form-control mr-sm-2" aria-label="Search">
                  <span class="input-group-btn">
                  <button type="submit" class="btn btn-outline-success btn-rounded btn-sm my-0 btn-danger" style="margin-bottom: 40px; height: 35px;">Search</button>
                   </span><br>
         </div>
           </form>
			<tr>
		<!-- <form action="wproductSearch" role="search" class="form-inline mr-auto">
			<input type="text" name="search" class="form-control mr-sm-2" aria-label="Search">
			<input type="submit" class="btn btn-outline-success btn-rounded btn-sm my-0 btn-danger" value="Search">
		</form> -->
				<c:forEach var="list" items="${list}">
					<td colspan="1">
						<div class="product">
							<a href="wproductInfo?p_id=${list.p_id}">
							<img class="mouseImg" src="resources/${list.p_image}" width="200" height="200">
							</a>
						</div><br>
						<div class="caption" align="center">
							<p><b>${list.p_name}</b></p>
							<del><fmt:formatNumber value="${list.p_price}" pattern="#,###.###"/> 원</del>
							<b class="font"><fmt:formatNumber value="${(100-list.p_sale)/100*list.p_price}" pattern="#,###.###"/> 원</b>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>