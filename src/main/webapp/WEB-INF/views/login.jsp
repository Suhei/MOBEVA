<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-client_id"
	content="962906715437-c9ouhgk61ae9n3r1ivh546igfdmkc6sq.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>MOBEVA Login</title>
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

<!-- 以上新增 -->
</head>

<body>

	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->
		<!-- 登入失敗帳密錯誤 -->
		<c:if test="${loginerror==0}">
			<script>
				alert("登入失敗,帳號密碼輸入錯誤");
			</script>
		</c:if>
		<!-- 登入失敗帳號錯誤 -->
		<c:if test="${loginerror==1}">
			<script>
				alert("登入失敗,密碼輸入錯誤");
			</script>
		</c:if>
		<!-- 登入失敗帳號已註銷 -->
		<c:if test="${loginerror==2}">
			<script>
				alert("登入失敗,帳號已註銷");
			</script>
		</c:if>
		<!-- 		登入黑名單 -->
		<c:if test="${block==1}">
			<script>
				alert("登入失敗,帳號已被鎖定到${blocktime}");
			</script>
		</c:if>
		<!-- 		重設密碼成功 -->
		<c:if test="${notsame==2}">
			<script>
				alert("重設密碼成功");
			</script>
		</c:if>


		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">登入</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="/MOBEVA/">首頁</a> / 登入
						</h5>
					</div>
				</div>
			</div>
		</section>
		<!-- 內文 -->
		<section id="ms-abt-section" class="ms-sec-padding">
			<div>
				<div class="ms-spacer-30"></div>
				<div align="center">
					<form method="POST" action="logindo">
						<table style="margin: auto; border: 1px;">
							<tr>
								<td>登入帳號:</td>
								<td><input type="text" name="account" maxlength="20" required>&nbsp;<small><Font
										color='red' size="-3"> </Font></small></td>
							</tr>
							<tr>
								<td>登入密碼:</td>
								<td><input type="password" name="password" maxlength="20" required>&nbsp;<small><Font
										color='red' size="-3"> </Font></small></td>
							</tr>
							<tr>
								<td><h4>
										<a href="forgetPassword">忘記密碼</a>
									</h4></td>
							</tr>
							<tr>
								<td style="text-align: center"><input type="submit"
									class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
									value="登入" style="padding: 5px 20px; margin-top: 10px;"></td>
								<td style="text-align: center"><input type="button"
									onclick="javascript:location.href='/MOBEVA/register'"
									class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
									value="註冊" style="padding: 5px 20px; margin-top: 10px;" /></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="ms-spacer-30"></div>
				<div align="center" class="g-signin2" onclick="ClickLogin()"
					data-onsuccess="onSignIn" data-theme="Light"></div>
				<div class="ms-spacer-30"></div>
			</div>
		</section>
		<!-- Footer Section 底-->

		<%@ include file="MOBEVAFooter.jsp"%>

	</div>
	<!-- Body Wrapper Ends -->

	<!-- Preloader -->
	<div class="preloader"></div>

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script>
		
		function getRootPath() {
			let githubURL = new URL(window.document.location.href);
			var curPageUrl = githubURL.toString();
			var rootPath = curPageUrl.substring(0,curPageUrl.lastIndexOf("/"));
			return rootPath;
		}

		var clicked = false;//Global Variable
		function ClickLogin() {
			clicked = true;
		}

		function onSignIn(googleUser) {
			// 傳回後臺驗證，並獲取userid
			if (clicked) {
				let Mpath = getRootPath();
				var ajaxpath = Mpath + "/google/oauth2callback";
				var id_token = googleUser.getAuthResponse().id_token;
				console.log("ID Token: " + id_token);
				var xhr = new XMLHttpRequest();
				xhr	.open('POST',ajaxpath);
				xhr.setRequestHeader('Content-Type',
						'application/x-www-form-urlencoded');
				xhr.onload = function() {
					if (xhr.responseText == "success") {
						alert("登入成功");
						signOut();
						//console.log('Signed in as: ' + xhr.responseText);
						location.href = Mpath;
					}
					if (xhr.responseText == "del") {
						alert("帳號已被註銷，請洽管理員 \n eeit11034@gmail.com");
						signOut();
					}
					if (xhr.responseText == "block") {
						alert("帳號已被鎖定，請洽管理員 \n eeit11034@gmail.com");
						signOut();
					}

				};
				xhr.send('idtokenstr=' + id_token);
			}
		};

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				// 				console.log('User signed out.');
			});
		}
	</script>
	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		
	</script>
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
