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
<title>MOBEVA</title>
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
				alert("失敗多次,帳號已被鎖定到${blocktime}");
			</script>
		</c:if>
		<!-- safeerror=0代表答案錯誤	  -->
		<c:if test="${safeerror==0}">
			<script>
				alert("回答錯誤,請重新回答");
			</script>
		</c:if>

		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">驗證安全問題</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="/MOBEVA/">首頁</a> 驗證安全問題
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
					<form method="POST" action="modifiedpassword">
						<table style="margin: auto; border: 1px;">
							<tr>
								<td><h3>安全問題:</h3></td>
								<c:if test="${forgetuserData.uq_question == 1}">
									<td><h3>你養過的第一隻寵物名字</h3></td>
								</c:if>
								<c:if test="${forgetuserData.uq_question == 2}">
									<td>你最喜歡的一件事</td>
								</c:if>
								<c:if test="${forgetuserData.uq_question == 3}">
									<td>你最好的朋友叫什麼"</td>
								</c:if>
							</tr>
							<tr>
								<td><h3>請輸入答案:</h3></td>
								<td><h3>
										<input type="text" name="safeA" required>
									</h3></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center"><input
									type="submit"
									class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
									value="下一步" style="padding: 5px 20px; margin-top: 10px;"></td>
							</tr>
						</table>
					</form>
				</div>
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
		var clicked = false;//Global Variable
		function ClickLogin() {
			clicked = true;
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
