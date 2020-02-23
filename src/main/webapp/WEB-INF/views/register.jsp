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
<title>register</title>
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

.ui-dialog-title {
	font-size: 25px;
}

.ui-dialog-titlebar {
	background-color: #ff8600;
}

.ui-dialog-titlebar-close {
	background-image: url("images/x.png");
}

#dialog a:link {
	color: blue;
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
						<h1 class="text-white ms-font-weight-900">註冊</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 註冊
						</h5>
					</div>
				</div>
			</div>
		</section>
		<!-- 內文 -->
		<div style="width: 20%; margin: auto;">
			<br> <br> <br> <br>
			<h4 style="text-align: center">註冊會員</h4>
			<form:form method="POST" modelAttribute="UserInfoBean"
				enctype='multipart/form-data'>
				<table style="margin: auto;">
					<tr>
						<td>帳號:</td>
						<td><form:input id="acc" path='u_account' />
						<font color="red" size="2"><br>${ErrMsg}</font>
						</td>
					</tr>
					<tr>
						<td>密碼:</td>
						<td><form:input tpye="password" id="pwd" path='u_password'
								type="password" /></td>
					</tr>
					<tr>
						<td>名稱:</td>
						<td><form:input path='u_name' id="name" /></td>
					</tr>
					<tr>
						<td>身份證字號:</td>
						<td><form:input path='u_idcard' id="IDcard" /></td>
					</tr>
					<tr>
						<td>信箱:</td>
						<td><form:input type="email" id="uemail" path='u_email' /></td>
					</tr>
					<tr>
						<td>電話:</td>
						<td><form:input path='u_mobile' id="phone" type="phone" /></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><form:input path='u_address' id="address" /></td>
					</tr>
					<tr>
						<td>安全問題</td>
						<td><select name="safeQ">
								<option value="1">你養過的第一隻寵物名字</option>
								<option value="2">你最喜歡的一件事</option>
								<option value="3">你最好的朋友叫什麼</option>
						</select></td>
					</tr>
					<tr>
						<td>請寫出答案:</td>
						<td><input type="text" name="safeAns" id="safeA"></td>
					</tr>
					<tr>
						<td style="text-align: center"><input
							type="submit"
							class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
							value="註冊" style="padding: 5px 20px; margin-top: 10px;"></td>

						<td><div 
							style="cursor: pointer; margin-left: 20px; background-color: #ABB2B9; border: #ABB2B9; color: #fff;"
							class="btn ms-primary-btn ms-red-border-btn ms-font-oswald" onclick="allinput()">
							一鍵輸入
						</div></td>
					
					</tr>
				</table>
			</form:form>

			<script>
				function allinput() {
					document.getElementById("acc").value = "gn2363481"
					document.getElementById("pwd").value = "gjbp8782ds"
					document.getElementById("name").value = "李鎮宇"
					document.getElementById("IDcard").value = "A123456789"
					document.getElementById("uemail").value = "gn2363481@gmail.com"
					document.getElementById("phone").value = "0988621786"
					document.getElementById("address").value = "台北士林中山北路3段1111號30F"
					document.getElementById("safeA").value = "黑輪"
				}
			</script>
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

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- 以上新增 -->
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