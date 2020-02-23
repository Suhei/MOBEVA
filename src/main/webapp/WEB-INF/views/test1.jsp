<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
	<div style="text-align: center" class="jumbotron">
	<c:forEach var="member" items="${Members}">
		<h1>${member.u_id}</h1>
		<p>${member.u_account}</p>
		<p>${member.u_name}</p>
		<p>${member.u_idcard}</p>
		<p>${member.u_email}</p>
		<p>${member.u_openid}</p>
		<p>${member.u_block}</p>
		<p>${member.u_createdate}</p>
		<hr>
	</c:forEach>
	</div>
</body>
</html>
