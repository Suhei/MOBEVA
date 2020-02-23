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
<title>login</title>
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
		<header id="ms-header" class="position-relative">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-lg-3">
						<a class="navbar-brand ms-logo-pad" href="index.html"><img
							src="images/Logo.png" class="img-fluid" alt="Logo"></a>
					</div>
					<div class="col-md-8 col-lg-9">
						<div class="ms-skew-bg position-absolute ms-w-100">
							<div class="ms-header-top">
								<div class="d-inline float-right">
									<!-- 								判斷是否登入顯示名字 -->
									<c:if test="${loginsuccess==1}">
										<span style="color: white;">&nbsp;&nbsp;&nbsp;Hello!!
											${loginuser.u_name}</span>
									</c:if>
								</div>
								<div class="d-inline float-right">
									<!-- <button id="opener" class="img-fluid mx-1 mx-md-2" alt="User Icon"><img
                                               src="images/User_icon.png"></button> -->
									<!-- <a href="#."><img src="images/User_icon.png" class="img-fluid mx-1 mx-md-2"
                                               alt="User Icon"></a> -->
									<a href="login"><img src="images/user01.png"
										class="img-fluid mx-1 mx-md-2" id="opener" alt="User Icon"></a>
									<a href="cart"><img src="images/shopping-cart01.png"
										class="img-fluid mx-1 mx-md-2" alt="Shop Icon"></a>
									<!-- 										判斷是否登入顯示登出按鍵 -->
									<c:if test="${loginsuccess==1}">
										<a
											onclick="javascript:location.href='<spring:url value='/logout' />'"><img
											src="images/logout.png" class="img-fluid mx-1 mx-md-2"
											alt="logout Icon"></a>
									</c:if>
								</div>
								<div class="text-white d-inline">
									<p class="d-inline-block mb-auto ms-font-oswald text-white">
									</p>
								</div>
							</div>
							<div class="ms-header-main ms-bg-orange px-1 px-lg-4">
								<nav class="navbar navbar-expand-lg ms-header-area">
									<button class="navbar-toggler collapsed" type="button"
										data-toggle="collapse" data-target="#hamburgernavmenucontent"
										aria-controls="hamburgernavmenucontent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="menu_toggle"> <span class="hamburger">
												<span></span> <span></span> <span></span>
										</span> <span class="hamburger-cross"> <span></span> <span></span>
										</span>
										</span>
									</button>
									<div class="collapse navbar-collapse ms-header-content"
										id="hamburgernavmenucontent">
										<ul class="navbar-nav">
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href='/MOBEVA/'>首頁</a></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="about_us">關於我們</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												data-toggle="dropdown" href="#." role="button"
												aria-haspopup="true" aria-expanded="false">服務項目</a>
												<div class="dropdown-menu">
													<a class="dropdown-item ms-font-oswald ms-font-17"
														href="service_1">服務項目 </a> <a
														class="dropdown-item ms-font-oswald ms-font-17"
														href="service_detail">服務內容</a>
												</div></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="profile.html" role="button" aria-haspopup="true"
												aria-expanded="false">會員資料</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="shop" role="button" aria-haspopup="true"
												aria-expanded="false">購物專區</a> <!-- <div class="dropdown-menu">
                                                      <a class="dropdown-item ms-font-oswald ms-font-17"
                                                          href="shop.html">購物專區</a>
                                                      <a class="dropdown-item ms-font-oswald ms-font-17"
                                                          href="shop_detail.html">商品內容</a>
                                                  </div> --></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="contact">聯絡我們</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

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
								<td><input type="text" name="account">&nbsp;<small><Font
										color='red' size="-3"> </Font></small></td>
							</tr>
							<tr>
								<td>登入密碼:</td>
								<td><input type="password" name="password">&nbsp;<small><Font
										color='red' size="-3"> </Font></small></td>
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
		<footer id="ms-footer">
			<div class="ms-footer-top">
				<div class="container">
					<div class="ms-spacer-100"></div>
					<div class="row">
						<div class="col-md-3 pb-4 pb-md-0">
							<h5 class="text-white ms-font-21 font-weight-bold mb-4">我們的服務</h5>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">發動機維修</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">動力轉向</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">更換耗材</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">排氣檢查</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">輪胎檢查</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">車隊服務</a>
							</h6>
						</div>
						<div class="col-md-3 pb-4 pb-md-0">
							<h5 class="text-white ms-font-21 font-weight-bold mb-4">營業時間</h5>
							<h6 class="ms-font-roboto-slab font-weight-light mb-4">
								週一到週六:<br> 早上10點 至 晚上8點
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								休假日:<br> 每週日<br> 跟法定假日
							</h6>
						</div>
						<div class="offset-md-1 col-md-5 pb-4 pb-md-0">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d462796.7951473594!2d121.09310010666256!3d25.01370566573385!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH562W5pyDIOaVuOS9jeaVmeiCsueglOeptuaJgCDmlbjkvY3kurrmiY3ln7nogrLkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1576209690095!5m2!1szh-TW!2stw"
								width="600" height="450" frameborder="0" style="border: 0;"
								allowfullscreen=""></iframe>
							<!-- <iframe src="http://www.google.cn/maps/embed?pb=!1m18!1m12!1m3!1d1034.2232296465927!2d73.9016019674311!3d29.320520669878277!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391672454430d0e3%3A0xef7051330f4071f0!2sDaat%20Creations!5e0!3m2!1sen!2sin!4v1569865460455!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen=""></iframe> -->
						</div>
					</div>
				</div>
			</div>
			<div class="ms-footer-bottom">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-md-4">
							<a href="index.html"><img src="images/Logo.png" alt="Logo"></a>
							<h6
								class="ms-font-roboto-slab font-weight-light position-relative">&copy;
								Copyright 2019. Mobeva automobiles limited</h6>
						</div>
						<div class="col-md-2 text-md-center my-4 my-md-0">
							<a class="mr-2 mr-lg-3" href="" target="_blank"><i
								class="fab fa-facebook-f fa-2x"></i></a> <a class="mr-2 mr-lg-3"
								href="" target="_blank"><i class="fab fa-twitter fa-2x"></i></a>
							<a href="" target="_blank"><i
								class="fab fa-linkedin-in fa-2x"></i></a>
						</div>
						<div class="offset-md-1 col-md-5">
							<div class="ms-bg-orange text-white">
								<h5 class="ms-font-weight-900">聯絡方式</h5>
								<h5 class="ms-font-roboto-slab font-weight-light mb-0">
									電話: <span><a href="" class="text-white">(02)66318168</a></span>
								</h5>
								<h5 class="ms-font-roboto-slab font-weight-light mb-1">
									Email: <span><a href="mailto:info@website.com"
										class="text-white">info@website.com</a></span>
								</h5>
								<h5 class="ms-font-roboto-slab font-weight-light">地址:台北市大安區復興南路一段390號1F</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>

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

	function onSignIn(googleUser) {
		// 傳回後臺驗證，並獲取userid
		if (clicked) {
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);
			var xhr = new XMLHttpRequest();
			xhr.open('POST',
					'http://localhost:8080/MOBEVA/google/oauth2callback');
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.onload = function() {
				alert("登入成功");
				console.log('Signed in as: ' + xhr.responseText);
				location.href = 'http://localhost:8080/MOBEVA/';
			};
			xhr.send('idtokenstr=' + id_token);
		}
	};

	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
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
