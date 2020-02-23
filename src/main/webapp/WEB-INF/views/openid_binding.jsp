<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA Register</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/png" href="images/mobeva-fav.jpg">
<!-- Custom Fonts Css -->
<link rel="stylesheet" href="vendor/custom_fonts/fonts.css">
<!-- Bootstrap Css -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Font Awesome Css -->
<link rel="stylesheet" href="vendor/fontawesome/css/all.min.css">
<!-- Owl Carousel Css -->
<!-- <link rel="stylesheet" href="vendor/owl_carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor/owl_carousel/css/owl.theme.default.css"> -->
<!-- Custom Style Css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<!-- 以下新增 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
}

td, th {
	border: 1px solid #dddddd;
	width: 20%;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
}
</style>
<!-- 以上新增 -->
</head>

<body>

	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->
		<!-- 登入失敗帳密錯誤 -->
		<c:if test="${loginerror==0}">
			<script>
				alert("登入失敗,帳號密碼輸入錯誤")
			</script>
		</c:if>
		<!-- 登入失敗帳號錯誤 -->
		<c:if test="${loginerror==1}">
			<script>
				alert("登入失敗,密碼輸入錯誤")
			</script>
		</c:if>
		<c:if test="${logout==0}">
			<script>
				alert("登出成功")
			</script>
		</c:if>

		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">會員資料</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 綁定會員帳號
						</h5>
					</div>
				</div>
			</div>
		</section>
		<!-- 內文 -->
		<div style="width: 20%; margin: auto;">
			<br> <br> <br> <br>
			<h4 style="text-align: center">綁定會員帳號</h4>
			<form:form method="POST" modelAttribute="openid_binding"
				enctype='multipart/form-data'>
				<table style="margin: auto;">
					<tr>
						<td>帳號:</td>
						<td><form:input type="text" path='u_account'
								placeholder="Account*" required="required" /> <br>
						<span style="color: red">${ErrMsg}</span></td>
					</tr>
					<tr>
						<td>密碼:</td>
						<td><form:input type="password" path='u_password'
								placeholder="Password*" required="required" /></td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td><form:input type="text" path='u_name' required="required" /></td>
					</tr>
					<tr>
						<td>身份證字號:</td>
						<td><form:input type="text" path='u_idcard' placeholder="ID*"
								required="required" /></td>
					</tr>
					<tr>
						<td>信箱:</td>
						<td><form:input type="email" id="email" path='u_email'
								required="required" /></td>
					</tr>
					<tr>
						<td>電話:</td>
						<td><form:input type="text" path='u_mobile'
								required="required" /></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><form:input path='u_address' required="required" /></td>

						<!-- 帶入UserInfoBean內的資料
						避免Hibernate Update時塞NULL給這些欄位 -->
						<form:input type="hidden" path="u_id" />
						<form:input type="hidden" path="u_status" value="2" />
						<form:input type="hidden" path="u_openid" />
						<form:input type="hidden" path="u_createdate" />
					</tr>

					<tr>
						<td>安全問題</td>
							<td>
								<select name="safeQ">
									<option value="1">你養過的第一隻寵物名字</option>
									<option value="2">你最喜歡的一件事</option>
									<option value="3">你最好的朋友叫什麼</option>
								</select>
							</td>
					</tr>
					
					<tr>
						<td>安全問題答案:</td>
						<td><input type="text" name="safeAns" placeholder="Answer*" 
						required="required"></td>
						
						<!-- 帶入UserInfoBean&UserQuiz 內的資料
						避免 Hibernate Update&Insert 時塞 NULL 給這些欄位 -->
						
					</tr>

					<tr>
						<td colspan="2" style="text-align: center"><input
							type="submit"
							class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
							value="綁定" style="padding: 5px 20px; margin-top: 10px;"></td>
					</tr>
				</table>
			</form:form>
			<br> <br> <br> <br>
		</div>
		<!-- Footer Section -->
		<%@ include file="MOBEVAFooter.jsp"%>
	</div>
	<!-- Body Wrapper Ends -->

	<!-- Preloader -->
	<div class="preloader"></div>

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap Js -->
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- Font Awesome Js -->
	<script src="vendor/fontawesome/js/all.min.js"></script>
	<!-- Owl Carousel Js -->
	<!-- <script src="vendor/owl_carousel/js/owl.carousel.min.js"></script> -->
	<!-- Themes's Custom Js -->
	<script src="js/theme.js"></script>


</body>

</html>