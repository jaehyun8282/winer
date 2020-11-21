<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if (id == null || id.equals("")) {	
	response.sendRedirect(path+"/index.jsp");
%>
	alert("로그인이 필요한 서비스입니다.");
<%
	return;
	}
%>
</body>
</html>