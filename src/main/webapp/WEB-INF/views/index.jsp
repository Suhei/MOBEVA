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


<!-- 以上新增 -->
</head>

<body>

	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->
		<%@ include file="MOBEVAHeader.jsp"%>

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
							<img class="img-fluid ms-team-img" src="images/boy1.jpg"
								alt="Team Image"> 
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">黃建豪</p>
						</div>
					</div>
					<div class="col-md-4 mb-4 mb-md-0">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy2.jpg"
								alt="Team Image"> 
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">許竣齊</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy3.png"
								alt="Team Image"> 
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">李鎮宇</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy4.jpg"
								alt="Team Image"> 
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">張仕杰</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ms-team-box text-center rounded position-relative">
							<img class="img-fluid ms-team-img" src="images/boy5.jpg"
								alt="Team Image"> 
							<p
								class="ms-font-21 ms-font-lato font-weight-bold mt-4 mb-0 ms-font-111">唐鵬鈞</p>
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
		<!-- 		<section id="ms-shop-section" class="ms-sec-padding"> -->
		<!-- 			<div class="container"> -->
		<!-- 				<div class="row"> -->
		<!-- 					<div class="col-md-6"> -->
		<!-- 						<h2 class="ms-font-weight-900">購物專區</h2> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-6 float-right"> -->
		<!-- 						<a href="shop.html" -->
		<!-- 							class="ms-primary-btn ms-red-border-btn ms-font-oswald float-left float-md-right mb-4">前往商城</a> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-6 col-lg-3 pb-5 pb-lg-0"> -->
		<!-- 						<div class="ms-shop-box text-center rounded"> -->
		<!-- 							<img class="img-fluid" src="images/Wheel.png" alt="Shop Image"> -->
		<!-- 							<p -->
		<!-- 								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Flat -->
		<!-- 								Tyres</p> -->
		<!-- 							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor -->
		<!-- 								silok consectet</h6> -->
		<!-- 							<h3 class="d-inline ms-font-oswald"> -->
		<!-- 								<del>$150</del> -->
		<!-- 							</h3> -->
		<!-- 							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$120</h3> -->
		<!-- 							<div class="row position-relative"> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a> -->
		<!-- 								</div> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-6 col-lg-3 pb-5 pb-lg-0"> -->
		<!-- 						<div class="ms-shop-box text-center rounded"> -->
		<!-- 							<img class="img-fluid" src="images/Car-oil.png" alt="Shop Image"> -->
		<!-- 							<p -->
		<!-- 								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Car -->
		<!-- 								Oil Filter</p> -->
		<!-- 							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor -->
		<!-- 								silok consectet</h6> -->
		<!-- 							<h3 class="d-inline ms-font-oswald"> -->
		<!-- 								<del>$300</del> -->
		<!-- 							</h3> -->
		<!-- 							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$250</h3> -->
		<!-- 							<div class="row position-relative"> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a> -->
		<!-- 								</div> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-6 col-lg-3 pb-5 pb-md-0"> -->
		<!-- 						<div class="ms-shop-box text-center rounded"> -->
		<!-- 							<img class="img-fluid" src="images/Engine.png" alt="Shop Image"> -->
		<!-- 							<p -->
		<!-- 								class="ms-font-21 ms-font-lato font-weight-bold mb-0 ms-font-111">Fuel -->
		<!-- 								Injection</p> -->
		<!-- 							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor -->
		<!-- 								silok consectet</h6> -->
		<!-- 							<h3 class="d-inline ms-font-oswald"> -->
		<!-- 								<del>$150</del> -->
		<!-- 							</h3> -->
		<!-- 							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$500</h3> -->
		<!-- 							<div class="row position-relative"> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a> -->
		<!-- 								</div> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 					<div class="col-md-6 col-lg-3"> -->
		<!-- 						<div class="ms-shop-box text-center rounded"> -->
		<!-- 							<img class="img-fluid" src="images/Car-part.png" alt="Shop Image"> -->
		<!-- 							<p -->
		<!-- 								class="ms-font-21 ms-font-lato font-weight-bold mb-0 text-dark">Red -->
		<!-- 								Car Bumper</p> -->
		<!-- 							<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor -->
		<!-- 								silok consectet</h6> -->
		<!-- 							<h3 class="d-inline ms-font-oswald"> -->
		<!-- 								<del>$80</del> -->
		<!-- 							</h3> -->
		<!-- 							<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$50</h3> -->
		<!-- 							<div class="row position-relative"> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-add-btn">加到購物車</a> -->
		<!-- 								</div> -->
		<!-- 								<div class="w-50"> -->
		<!-- 									<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a> -->
		<!-- 								</div> -->
		<!-- 							</div> -->
		<!-- 						</div> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</section> -->

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

		<%@ include file="MOBEVAFooter.jsp"%>

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