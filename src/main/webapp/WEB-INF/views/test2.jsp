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
		<c:forEach var="odetail" items="${odetails}">
			<h1>${odetail.mb_id}</h1>
			<p>${odetail.userInfoBean.u_id}</p>
			<p>${odetail.userInfoBean.u_name}</p>
			<p>${odetail.maintainInfoBean.mi_name}</p>
			<p>${odetail.maintainStationBean.ms_name}</p>
			<p>${odetail.userCarBean.uc_number}</p>
			<p>${odetail.mb_date}</p>
			<p>${odetail.mb_createdate}</p>
			<p>${odetail.mb_modifieddate}</p>
			<hr>
		</c:forEach>
	</div>
</body>
</html>
