<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>後台登入MOBEVA</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<body>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<h1>登入畫面</h1>
	<hr>
	<hr>
	<sec:authorize access="authenticated" var="authenticated" />
	<c:choose>
		<c:when test="${authenticated}">
			<div class="element place-right">
				<p class="text-right fg-white">
					Hi,
					<sec:authentication property="name" />
					<a href="<spring:url value="/admin/perform_logout"/>"
						class="button link">Log out</a>
				</p>
			</div>
		</c:when>
		<c:otherwise>
			<a class="element place-right" href="<spring:url value="/login"/>">Log
				in</a>
		</c:otherwise>
	</c:choose>

</body>
</html>