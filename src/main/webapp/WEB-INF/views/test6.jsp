<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form:form modelAttribute="UsersInfo">
	<fieldset>
		姓名：<form:input type="text" path="u_name"/> <br>
		信箱：<form:input type="email" path="u_email"/><br>
		電話：<form:input type="tel" path="u_mobile"/><br>
		地址：<form:textarea path="u_address" rows="3"/><br>
		<input type="submit" value="修改" /><br>
	</fieldset>
	</form:form>
</body>
</html>
