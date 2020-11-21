<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}
</style>
</head>
<body>
<br><br>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="resources/e1.jpg" style="width: 1050px;">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="resources/e2.jpg" style="width: 1050px;">
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<img src="resources/e3.jpg" style="width: 1050px;">
				<div class="carousel-caption">
				</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container text-center">
		<h3>이 달의 인기상품</h3>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<a href="${path}/wproductInfo?p_id=25">
					<img src="images/p1.jpg" class="img-responsive" style="width: 100%" alt="Image">
					<p>칠레 와인 - 리제르바 세트</p>
				</a>
			</div>
			<div class="col-sm-4">
				<a href="${path}/wproductInfo?p_id=24">
					<img src="images/p2.jpg" class="img-responsive" style="width: 100%" alt="Image">
					<p>내츄럴 와인-오가닉 와인 세트</p>
				</a>
			</div>
			<div class="col-sm-4">
				<div class="well">
					<p>9월 초특가 행사 진행중</p>
					<p>최대 60% 할인</p>
				</div>
				<div class="well">
					<p>신제품 입고</p>
					<p>행사 진행중</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>