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
		<h1>第一次SESSION透過@SessionAttributes</h1>
		<c:forEach var="shopCartSession" items="${shopCartSession}">
			<p>數量：${shopCartSession.sc_pcs}</p>
			<p>商品主鍵：${shopCartSession.shopProductsBean.sp_id}</p>
		</c:forEach>
		<hr>
	</div>

	<div style="text-align: center" class="jumbotron">
		<h1>第一次SESSION@透過Session</h1>
		<c:forEach var="SessionshopCartSession" items="${SessionshopCartSession}">
			<p>數量：${SessionshopCartSession.sc_pcs}</p>
			<p>商品主鍵：${SessionshopCartSession.shopProductsBean.sp_id}</p>
		</c:forEach>
		<hr>
	</div>
</body>
</html>
