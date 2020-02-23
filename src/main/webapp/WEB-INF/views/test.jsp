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
	<c:forEach var="car" items="${Cars}">
		<h1>${car.uc_id}</h1>
		<p>${car.userInfoBean.u_id}</p>
		<p>${car.uc_number}</p>
		<p>${car.uc_brand}</p>
		<p>${car.uc_model}</p>
		<hr>
	</c:forEach>
	</div>
</body>
</html>
