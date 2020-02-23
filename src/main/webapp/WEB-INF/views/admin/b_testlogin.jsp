<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>login</title>
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

	<div class="grid">
	<div class="row">
			<div class="span1"></div>
			<div class="span5">
				<c:if test="{not empty error}">
					 <div class="balloon bottom">
                        <div class="padding20">
                            ${error}
                        </div>
                    </div>
				</c:if>
				<c:if test="{not empty msg}">
					 <div class="balloon bottom">
                        <div class="padding20">
                            ${msg}
                        </div>
                    </div>
				</c:if>
				<c:url value="/login" var="loginUrl"/>
				<form action="<c:url value='/' />admin/b_testloginProcess" method="POST">
					<label for="username">Username</label>
					<div class="input-control text">
						<input type="text" value="" placeholder="input username" 
						id="username" name="username"/>
						<button class="btn-clear"></button>
					</div> 
					<label for="password">Password</label>
					<div class="input-control password">
						<input type="password" value="" placeholder="input password"
						id="password" name="password"/>
						<button class="btn-reveal"></button>
					</div>
					<input type="submit" value="Submit"/>
					<input type="hidden" name="${_csrf.parameterName}"
		             value="${_csrf.token}" />
				</form>
			</div>
		</div>
</div>
</body>
</html>