<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: #620000;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.navbar * {
	color: white;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
</style>
</head>
<script>

	window.onload = function() { //실행될 코드
		if (location.pathname.indexOf('introduce') != -1) {
		//  $('#li_2').addClass('active');
		}
	
	
	}
	
	function goPage(url , e){
	//	$( e ).parent().addClass( 'active' ) ;
		window.location.href=url; 
	}
	
</script>
<body>
<% 
	String id = (String)session.getAttribute("id");
	String password = (String)session.getAttribute("password");

%>
	<br><br>
	<p style="text-align: center;">
		<a href="home"><img src="resources/ds.jpg" width=500></a>
	</p><br><br>
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">WINER</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav nav-pills">
					<li id="li_1"class=" ${pageName eq 'home' ? 'active' : ''}"><a data-toggle="tab" onClick="goPage('${path}/home', $(this));">홈</a></li>
					<li id="li_2" class=" ${pageName eq 'introduce' ? 'active' : ''}"><a data-toggle="tab" onClick="goPage('${path}/introduce', $(this));">소개</a></li>
					<li id="li_3"  class=" ${pageName eq 'wproductMain' ? 'active' : ''}"><a data-toggle="tab" onClick="goPage('wproductMain', $(this));">쇼핑하기</a></li>
					<!-- <li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="wproductMain">와인 종류 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">국가별</a></li>
							<li><a href="#">타입별</a></li>
							<li><a href="#">안주별</a></li>
						</ul></li> -->
					<li id="li_4" class=" ${pageName eq 'list' ? 'active' : ''}" ><a data-toggle="tab" onClick="goPage('list', $(this));" >리뷰 게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<!--  -->
				<% if(id != null){
				
				%>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					<li><a href="wcartList"><span
							class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
					<li><a href="wmMypage"><span
							class="glyphicon glyphicon-home"></span> 마이 페이지</a></li>
				<%	
					}else{
				%>		
						<li><a href="loginForm"><span
								class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						<li><a href="joinForm"><span
								class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				<%		
					}
				%>
				</ul>
			</div>
		</div>
	</nav>
