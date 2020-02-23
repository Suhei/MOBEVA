<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
<link rel="stylesheet"
	href="vendor/owl_carousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="vendor/owl_carousel/css/owl.theme.default.css">
<!-- Custom Style Css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- 以下新增 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
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
	<!-- 以下新增 -->
<!-- 	<div id="dialog" style="background-color: white; padding: 10px;"> -->
<!-- 		<div style="display: inline-block; vertical-align: top; width: 220px;"> -->
<!-- 			<h4>Sign in</h4> -->
<!-- 			<form> -->
<!-- 				<input id="username" type="text" placeholder="Email 會員帳號" -->
<!-- 					name="account"><br> <input id="password" -->
<!-- 					type="password" placeholder="Password 會員密碼" name="password"><br> -->
<!-- 				<a href="#." style="font-size: 13px;"><b>忘記密碼</b></a><br> <input -->
<!-- 					type="submit" -->
<!-- 					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald" -->
<!-- 					value="登入" style="padding: 5px 20px; margin-top: 15px;"> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 		<div -->
<!-- 			style="display: inline-block; border-left: solid 1px #cccccc; margin: 5px; height: 155px;"></div> -->
<!-- 		<div -->
<!-- 			style="display: inline-block; width: 220px; vertical-align: top; margin-left: 20px;"> -->
<!-- 			<form> -->
<!-- 				<h4>Register</h4> -->
<!-- 				<input id="registerusername" type="text" placeholder="Email 會員帳號" -->
<!-- 					name="registeraccount"><br> <input -->
<!-- 					id="registerpassword" type="password" placeholder="Password 會員密碼" -->
<!-- 					name="registerpassword"><br> <input id="checkpassword" -->
<!-- 					type="password" placeholder="Password 再次輸入密碼" name="checkpassword"><br> -->
<!-- 				<input type="submit" -->
<!-- 					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald" -->
<!-- 					value="註冊" style="padding: 5px 20px; margin-top: 10px;"> <input -->
<!-- 					type="reset" -->
<!-- 					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald" -->
<!-- 					value="重填" style="padding: 5px 20px; margin-top: 10px;"> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<!-- 以上新增 -->

	<!-- Body Wrapper -->
	<div class="overflow-hidden">



		<!-- Header Section -->
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
											onclick="javascript:location.href='<spring:url value='/logout'/>'"><img
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
														href="booking">預約方案 </a> <a
														class="dropdown-item ms-font-oswald ms-font-17"
														href="maintain_order">預約查詢</a>
												</div>
											</li>
											
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="profile.html" role="button" aria-haspopup="true"
												aria-expanded="false">會員資料</a></li>
												
												
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="shop" role="button" aria-haspopup="true"
												aria-expanded="false">購物專區</a>
												
												<div class="dropdown-menu">
													<a class="dropdown-item ms-font-oswald ms-font-17"
														href="cart">購物車</a> <a
														class="dropdown-item ms-font-oswald ms-font-17"
														href="order_list">訂單查詢</a>
												</div>
												
												 <!-- <div class="dropdown-menu">
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

		<!-- Slider Section -->
		<section id="ms-slider-section">
			<div class="position-relative">
				<div id="homeslider" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#homeslider" data-slide-to="0" class="active"></li>
						<li data-target="#homeslider" data-slide-to="1"></li>
						<li data-target="#homeslider" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="images/banners/slider-3.jpg"
								class="img-fluid ms-slide-img" alt="Slider Image">
							<div class="carousel-caption">
								<div class="col-md-12 ms-slider-pad">
									<h1 class="ms-font-weight-900 pb-3">優質的車輛保修服務</h1>
									<div class="ms-spacer-60"></div>
									<div class="row">
										<div class="offset-md-1 offset-xl-2 col-md-5 col-xl-4">
											<a href="contact.html"
												class="btn ms-primary-btn ms-font-oswald">聯絡我們</a>
										</div>
										<div class="col-md-5 d-none d-md-block">
											<div class="card mb-3 bg-transparent border-0">
												<div
													class="row no-gutters align-items-center position-relative">
													<div class="col-6 col-md-3">
														<a href="#." data-toggle="modal" data-target="#msvideobox"><img
															src="images/Play-btn.png" class="img-fluid ms-resp-img"
															alt="Play Button Image"></a>
													</div>
													<div class="col-6 col-md-9">
														<h5
															class="ms-font-oswald font-weight-normal text-left ml-2">
															PLAY OUR<br> PROMO VIDEO
														</h5>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img src="images/banners/team-banner.jpg"
								class="img-fluid ms-slide-img" alt="Slider Image">
							<div class="carousel-caption">
								<div class="col-md-12 ms-slider-pad">
									<h1 class="ms-font-weight-900 pb-3">優質的車輛保修服務</h1>
									<div class="ms-spacer-60"></div>
									<div class="row">
										<div class="offset-md-1 offset-xl-2 col-md-5 col-xl-4">
											<a href="contact.html"
												class="btn ms-primary-btn ms-font-oswald">聯絡我們</a>
										</div>
										<div class="col-md-5 d-none d-md-block">
											<div class="card mb-3 bg-transparent border-0">
												<div
													class="row no-gutters align-items-center position-relative">
													<div class="col-6 col-md-3">
														<a href="#." data-toggle="modal" data-target="#msvideobox"><img
															src="images/Play-btn.png" class="img-fluid ms-resp-img"
															alt="Play Button Image"></a>
													</div>
													<div class="col-6 col-md-9">
														<h5
															class="ms-font-oswald font-weight-normal text-left ml-2">
															PLAY OUR<br> PROMO VIDEO
														</h5>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img src="images/banners/faq-banner.jpg"
								class="img-fluid ms-slide-img" alt="Slider Image">
							<div class="carousel-caption">
								<div class="col-md-12 ms-slider-pad">
									<h1 class="ms-font-weight-900 pb-3">優質的車輛保修服務</h1>
									<div class="ms-spacer-60"></div>
									<div class="row">
										<div class="offset-md-1 offset-xl-2 col-md-5 col-xl-4">
											<a href="contact.html"
												class="btn ms-primary-btn ms-font-oswald">聯絡我們</a>
										</div>
										<div class="col-md-5 d-none d-md-block">
											<div class="card mb-3 bg-transparent border-0">
												<div
													class="row no-gutters align-items-center position-relative">
													<div class="col-6 col-md-3">
														<a href="#." data-toggle="modal" data-target="#msvideobox"><img
															src="images/Play-btn.png" class="img-fluid ms-resp-img"
															alt="Play Button Image"></a>
													</div>
													<div class="col-6 col-md-9">
														<h5
															class="ms-font-oswald font-weight-normal text-left ml-2">
															PLAY OUR<br> PROMO VIDEO
														</h5>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Services Section -->
		<section id="ms-service-section">
			<img class="img-fluid position-absolute ms-sidebar-img"
				src="images/Sidebar-Full.jpg" alt="Sidebar Image">
			<div class="container">
				<div class="row">
					<div class="col-md-5 ms-left-image-bg">
						<div class=" text-white">
							<h2 class="ms-font-weight-900">營業時間</h2>
							<h4 class="font-weight-normal pb-4">休息時間: 12:00 - 13:00</h4>
							<ul class="list-group">
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期一</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期二</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期三</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期四</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期五</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期六</span>10.00 - 20.00
									</p>
								</li>
								<li>
									<p class="font-weight-light text-white">
										<span class="d-inline-block">星期日</span>休息日
									</p>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-7">
						<div class="ms-sec-padding">
							<h2 class="ms-font-weight-900">服務項目</h2>
							<br>
							<div class="row">
								<div class="col-6 col-md-6 pr-2 pr-md-3">
									<div
										class="ms-service-box rounded text-center position-relative">
										<img class="img-fluid pb-3 ms-main-img" src="images/24.png"
											alt="Service Image">
										<p class="ms-font-lato font-weight-bold">車輛檢查</p>
										<div class="ms-service-box-hover position-absolute rounded">
											<img class="img-fluid pb-3" src="images/25.png"
												alt="Service Hover Image">
											<p class="ms-font-lato font-weight-bold">VEHICLE INSPECT</p>
										</div>
									</div>
								</div>
								<div class="col-6 col-md-6 pl-2 pl-md-3">
									<div
										class="ms-service-box rounded text-center position-relative">
										<img class="img-fluid pb-3 ms-main-img" src="images/23.png"
											alt="Service Image">
										<p class="ms-font-lato font-weight-bold">預約保養</p>
										<div class="ms-service-box-hover position-absolute rounded">
											<img class="img-fluid pb-3" src="images/26.png"
												alt="Service Hover Image">
											<p class="ms-font-lato font-weight-bold">SHUTTLE SERVICE</p>
										</div>
									</div>
								</div>

								<div class="col-6 col-md-6 pl-2 pl-md-3">
									<div
										class="ms-service-box rounded text-center position-relative mb-0">
										<img class="img-fluid pb-3 ms-main-img" src="images/21.png"
											alt="Service Image">
										<p class="ms-font-lato font-weight-bold">維修</p>
										<div class="ms-service-box-hover position-absolute rounded">
											<img class="img-fluid pb-3" src="images/28.png"
												alt="Service Hover Image">
											<p class="ms-font-lato font-weight-bold">RESTORATION</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Need Help Section -->
		<!-- <section id="ms-help-section" class="ms-sec-padding ms-bg-cream">
            <div class="container">
                <div class="row">
                    <div class="offset-xl-2 offset-0 col-xl-8 col-12 text-center">
                        <h2 class="ms-font-weight-900 mb-5">需要幫助修理您的車輛嗎？我們能幫你</h2>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="ms-help-box ms-ipad-margin p-3 mx-0 mx-xl-2">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">
                                    <img src="images/Quote-Icon.png" class="img-fluid" alt="Play Button Image">
                                </div>
                                <div class="col-9">
                                    <p class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">請求報價</p>
                                    <p class="ms-font-17 mb-0 ms-font-4a4a4a">Dolor sit amet</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="ms-help-box ms-ipad-margin p-3 mx-0 mx-xl-2">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">
                                    <img src="images/Offer-Icon.png" class="img-fluid" alt="Play Button Image">
                                </div>
                                <div class="col-9">
                                    <p class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">提供優惠</p>
                                    <p class="ms-font-17 mb-0 ms-font-4a4a4a">Dolor sit amet</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 position-relative">
                        <div class="ms-help-box p-3 mx-0 mx-xl-2">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">
                                    <img src="images/Call-Icon.png" class="img-fluid" alt="Play Button Image">
                                </div>
                                <div class="col-9">
                                    <p class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">致電查詢</p>
                                    <p class="ms-font-17 mb-0 ms-font-4a4a4a">0800 123 4567</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

		<!-- About Us Section -->
		<section id="ms-about-section" class="ms-sec-padding">
			<div class="container">
				<div class="row text-white">
					<div class="col-md-6 col-lg-7">
						<h2 class="ms-font-weight-900">關於我們</h2>
						<p class="font-weight-light ms-font-e6e6e6 my-4">公司自1972年創業以來，不斷追求創新與突破，
							以代理世界頂級汽車品牌BMW和深耕在地客戶服務領先車壇。</p>
						<p class="font-weight-light ms-font-e6e6e6 mb-4">秉持「先有服務、後有銷售」的經營理念，
							汎德從創業之初一路堅持初衷，從交車整備、作業流程、維修技術、零件庫存到展示中心，
							全面帶入以客戶體驗為中心的革命思維，期許帶給客戶最頂級貼心的禮遇及服務享受。
							在台耕耘四十多年後，汎德公司靠著嚴密完善的全台經銷售後服務網絡，贏得台灣人全面的信賴，
							BMW在台銷售年年高居高級進口車之冠，BMW的尊貴形象更在國人心中根深蒂固。身為BMW總代理，
							汎德公司也和BMW德國原廠同步永續經營的理念，積極於台灣實踐企業社會責任，從教育、環境議題為社會問題尋找長期解決方案。</p>
						<a href="contact.html"
							class="btn ms-primary-btn ms-font-oswald mt-2">聯絡我們</a>
					</div>
					<div class="col-md-6 col-lg-5 mt-5 mt-md-0">
						<div class="row">
							<div class="col-md-6">
								<div class="ms-contact-box rounded ms-bg-red text-center">
									<img src="images/Address_icon.png" alt="Address Icon">
									<p
										class="ms-font-17 ms-font-lato ms-font-weight-900 mt-3 mb-1 text-white">地址</p>
									<h6 class="font-weight-light ms-font-roboto-slab mb-0">台北市大安區復興南路一段390號1F</h6>
								</div>
								<div class="ms-spacer-30"></div>
								<div class="ms-contact-box rounded ms-bg-orange text-center">
									<img src="images/Email_icon.png" alt="Email Icon">
									<p
										class="ms-font-17 ms-font-lato ms-font-weight-900 mt-3 mb-1 text-white">EMAIL</p>
									<a href="mailto:info@car.com">
										<h6 class="font-weight-light ms-font-roboto-slab mb-0">info@car.com</h6>
									</a> <a href="mailto:job@car.com">
										<h6 class="font-weight-light ms-font-roboto-slab mb-0">job@car.com</h6>
									</a>
								</div>
							</div>
							<div class="col-md-6">
								<div
									class="ms-contact-box rounded ms-bg-blue text-center position-relative">
									<img src="images/Phone_icon.png" alt="Phone Icon">
									<p
										class="ms-font-17 ms-font-lato ms-font-weight-900 mt-3 mb-1 text-white">電話</p>
									<a href="">
										<h6 class="font-weight-light ms-font-roboto-slab mb-0">(02)66318168</h6>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Team Section -->
		<section id="ms-team-section" class="ms-sec-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="ms-font-weight-900">專業團隊</h2>
						<br> <br>
					</div>
					<div class="col-md-4 mb-4 mb-md-0">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy1.png"
								alt="Team Image"> <img class="img-fluid position-absolute"
								src="images/Team-icon.png" alt="Team Icon">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">柏憲</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">林北柏憲啦</h6>
							<a href="team.html" class="btn ms-second-btn ms-font-oswald">更多資訊</a>
						</div>
					</div>
					<div class="col-md-4 mb-4 mb-md-0">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy1.png"
								alt="Team Image"> <img class="img-fluid position-absolute"
								src="images/Team-icon.png" alt="Team Icon">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">柏憲</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">上課就是要睡覺!!爽啦!!</h6>
							<a href="team.html" class="btn ms-second-btn ms-font-oswald">更多資訊</a>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy1.png"
								alt="Team Image"> <img class="img-fluid position-absolute"
								src="images/Team-icon.png" alt="Team Icon">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">柏憲</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">打我啊笨蛋~!!</h6>
							<a href="team.html" class="btn ms-second-btn ms-font-oswald">更多資訊</a>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Specialize Section -->
		<section id="ms-special-section" class="ms-sec-padding">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-12 col-lg-3 text-white ms-ipad-margin">
						<h2 class="ms-font-weight-900">專業項目</h2>
						<!-- <p class="font-weight-light ms-font-e6e6e6 my-md-3 my-lg-4">Lorem ipsum dolor sit amet consectutur adipscing elit, sed do eiusmod tempor</p> -->
						<a href="service_1.html"
							class="btn ms-second-btn ms-font-oswald text-white">所有服務</a>
					</div>
					<div class="col-md-12 col-lg-9">
						<div id="specialize" class="owl-carousel">
							<div class="item">
								<a href="service_detail.html"><img src="images/img-1.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">車輛檢查</h5>
									</a>
								</div>
							</div>
							<div class="item">
								<a href="service_detail.html"><img src="images/img-2.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">引擎維修</h5>
									</a>
								</div>
							</div>
							<div class="item">
								<a href="service_detail.html"><img src="images/img-3.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">車輛烤漆</h5>
									</a>
								</div>
							</div>
							<div class="item">
								<a href="service_detail.html"><img src="images/img-1.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">車輛檢查</h5>
									</a>
								</div>
							</div>
							<div class="item">
								<a href="service_detail.html"><img src="images/img-2.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">引擎維修</h5>
									</a>
								</div>
							</div>
							<div class="item">
								<a href="service_detail.html"><img src="images/img-3.png"
									alt="Image" class="img-fluid position-relative"></a>
								<div class="ms-img-content position-absolute">
									<a href="service_detail.html">
										<h5 class="ms-font-weight-900 text-white">車輛烤漆</h5>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Shop Section -->
		<section id="ms-shop-section" class="ms-sec-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 class="ms-font-weight-900">購物專區</h2>
					</div>
					<div class="col-md-6 float-right">
						<a href="shop.html"
							class="ms-primary-btn ms-red-border-btn ms-font-oswald float-left float-md-right mb-4">前往商城</a>
					</div>
					<div class="col-md-6 col-lg-3 pb-5 pb-lg-0">
						<div class="ms-shop-box text-center rounded">
							<img class="img-fluid" src="images/Wheel.png" alt="Shop Image">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Flat
								Tyres</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor
								silok consectet</h6>
							<h3 class="d-inline ms-font-oswald">
								<del>$150</del>
							</h3>
							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$120</h3>
							<div class="row position-relative">
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a>
								</div>
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 pb-5 pb-lg-0">
						<div class="ms-shop-box text-center rounded">
							<img class="img-fluid" src="images/Car-oil.png" alt="Shop Image">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Car
								Oil Filter</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor
								silok consectet</h6>
							<h3 class="d-inline ms-font-oswald">
								<del>$300</del>
							</h3>
							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$250</h3>
							<div class="row position-relative">
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a>
								</div>
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 pb-5 pb-md-0">
						<div class="ms-shop-box text-center rounded">
							<img class="img-fluid" src="images/Engine.png" alt="Shop Image">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Fuel
								Injection</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor
								silok consectet</h6>
							<h3 class="d-inline ms-font-oswald">
								<del>$150</del>
							</h3>
							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$500</h3>
							<div class="row position-relative">
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a>
								</div>
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="ms-shop-box text-center rounded">
							<img class="img-fluid" src="images/Car-part.png" alt="Shop Image">
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mb-0 text-dark">Red
								Car Bumper</p>
							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor
								silok consectet</h6>
							<h3 class="d-inline ms-font-oswald">
								<del>$80</del>
							</h3>
							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$50</h3>
							<div class="row position-relative">
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a>
								</div>
								<div class="w-50">
									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Testimonials Section -->
		<!-- <section id="ms-testimonial-section" class="ms-sec-padding ms-bg-cream ms-testimonial-home position-relative">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2 class="ms-font-weight-900">TESTIMONIALS</h2>
                        <h4 class="ms-font-4a4a4a mb-5">Our customers says we are the best.</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="customers-testimonials" class="owl-carousel">
                            <div class="item">
                                <div class="ms-testimonial-col">
                                    <div class="ms-testimonial-box text-center">
                                        <img src="images/p1.png" class="img-fluid" alt="Client Image">
                                        <div class="ms-spacer-30"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do euismod temper incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation</p>
                                    </div>
                                    <h5 class="font-weight-bold mt-4 mb-1">Hanna Gover</h5>
                                    <h6 class="ms-font-4a4a4a">Texas, US</h6>
                                </div>
                            </div>
                            <div class="item">
                                <div class="ms-testimonial-col">
                                    <div class="ms-testimonial-box text-center">
                                        <img src="images/p2.png" class="img-fluid" alt="Client Image">
                                        <div class="ms-spacer-30"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do euismod temper incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation</p>
                                    </div>
                                    <h5 class="font-weight-bold mt-4 mb-1">John Doe</h5>
                                    <h6 class="ms-font-4a4a4a">Texas, US</h6>
                                </div>
                            </div>
                            <div class="item">
                                <div class="ms-testimonial-col">
                                    <div class="ms-testimonial-box text-center">
                                        <img src="images/p3.png" class="img-fluid" alt="Client Image">
                                        <div class="ms-spacer-30"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do euismod temper incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation</p>
                                    </div>
                                    <h5 class="font-weight-bold mt-4 mb-1">Nick Jonas</h5>
                                    <h6 class="ms-font-4a4a4a">Texas, US</h6>
                                </div>
                            </div>
                            <div class="item">
                                <div class="ms-testimonial-col">
                                    <div class="ms-testimonial-box text-center">
                                        <img src="images/p4.png" class="img-fluid" alt="Client Image">
                                        <div class="ms-spacer-30"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do euismod temper incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation</p>
                                    </div>
                                    <h5 class="font-weight-bold mt-4 mb-1">David Watts</h5>
                                    <h6 class="ms-font-4a4a4a">Texas, US</h6>
                                </div>
                            </div>
                            <div class="item">
                                <div class="ms-testimonial-col">
                                    <div class="ms-testimonial-box text-center">
                                        <img src="images/p5.png" class="img-fluid" alt="Client Image">
                                        <div class="ms-spacer-30"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do euismod temper incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation</p>
                                    </div>
                                    <h5 class="font-weight-bold mt-4 mb-1">Darwin Watts</h5>
                                    <h6 class="ms-font-4a4a4a">Texas, US</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

		<!-- Blog Section -->
		<!-- <section id="ms-blog-section" class="ms-sec-padding">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4 ms-width-24 ms-width-100">
                        <h2 class="ms-font-weight-900 mb-4 text-white">LATEST FROM BLOG POST</h2>
                        <a href="blog_1.html" class="btn ms-second-btn ms-font-oswald text-white mb-4 mb-md-0">FULL BLOG
                            POST</a>
                    </div>
                    <div class="col-md-4 ms-width-38 ms-width-100">
                        <a href="blog_detail.html">
                            <div class="ms-blog-box">
                                <img src="images/blog-img1.png" class="img-fluid rounded" alt="Blog Image">
                                <p class="ms-font-lato ms-font-orange mt-2 mb-1">10-jul-2018</p>
                                <h4 class="text-white">Integer maximus lorem ut elementum sagittis. laorreet dignissm.
                                </h4>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 ms-width-38 ms-width-100">
                        <a href="blog_detail.html">
                            <div class="ms-blog-box">
                                <img src="images/blog-img2.png" class="img-fluid rounded" alt="Blog Image">
                                <p class="ms-font-lato ms-font-orange mt-2 mb-1">10-jul-2018</p>
                                <h4 class="text-white">Integer maximus lorem ut elementum sagittis. laorreet dignissm.
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section> -->

		<!-- Footer Section -->
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

	<!-- Banner Section Video Button Modal Box -->
	<div class="modal fade" id="msvideobox" tabindex="-1" role="dialog"
		aria-labelledby="msvideobox" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content">
				<iframe width="720" height="405"
					src="https://www.youtube.com/embed/9X_uPjJW9mY?controls=0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#dialog").dialog({
				autoOpen : false,
				modal : true,
				width : 515,
				title : "會員登入",
				show : {
					effect : "blind",
					duration : 500
				},
				hide : {
					effect : "explode",
					duration : 500
				},
			});
			$("#opener").on("click", function() {
				$("#dialog").dialog("open");
				// $(document).click(function (e) {
				//     var _con = $('#dialog');  // 設定目標區域
				//     if (!_con.is(e.target) && _con.has(e.target).length === 0) { // Mark 1
				//         //$('#divTop').slideUp('slow');  //滑動消失
				//         console.log("SSSSSSSSSSS");     //淡出消失
				//     }
				// });
			});
		});
	</script>
	<!-- 以上新增 -->
	<!-- Bootstrap Js -->
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- Font Awesome Js -->
	<script src="vendor/fontawesome/js/all.min.js"></script>
	<!-- Owl Carousel Js -->
	<script src="vendor/owl_carousel/js/owl.carousel.min.js"></script>
	<!-- Themes's Custom Js -->
	<script src="js/theme.js"></script>
</body>

</html>