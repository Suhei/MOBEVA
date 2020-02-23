<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js">
	
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA About_us</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
<link rel="stylesheet" href="vendor/owl_carousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="vendor/owl_carousel/css/owl.theme.default.css">
<!-- Custom Style Css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<!-- 以下新增 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>

<body>

	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->
		
		<%@ include file="MOBEVAHeader.jsp"%>

		 <!-- Banner Section -->
        <section id="ms-banner-section" class="ms-abt-bnr">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-white ms-font-weight-900">關於我們</h1>
                        <div class="ms-seperator my-4"></div>
                        <h5 class="pt-1 font-weight-normal text-white"><a class="text-white" href="index.html">首頁</a>
                            / 關於我們</h5>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Content Section -->
        <section id="ms-abt-section" class="ms-sec-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 ms-pad-right">
                        <h2 class="ms-font-weight-900 mb-4">我們的團隊</h2>
                        <p class="mb-4">只有真正來自賓士原廠的服務與零件，才能夠確保您的賓士愛車長期擁有超卓的性能、非凡的風範，以及最尖端的領先科技。在您駕馭賓士愛車的每一天，都享有我們對您最堅定的承諾，為您提供世界頂級的服務、零件與配件。

                            我們以賓士為榮，我們的產品品質享有卓越的名聲；這是因為我們重視每一個細節。每一輛出廠的轎車、每一個裝配的零件，都嚴格要求達到最高的標準。
                            
                            駕車上路，當然需要做好定期的保養維護，不論是保養或是修理，賓士原廠授權服務廠都是您最佳的選擇。</p>
                        <a href="contact.html"
                            class="btn ms-primary-btn ms-primary-btn-two ms-font-oswald mt-2  mt-md-4 mb-5 mb-md-0">聯絡我們</a>
                    </div>
                    <div class="col-md-5">
                        <img src="images/who-we-are.jpg" class="img-fluid" alt="About Image">
                    </div>
                </div>
                <div class="ms-spacer-100"></div>
                <div class="row flex-row-reverse">
                    <div class="col-md-7 ms-pad-left">
                        <h2 class="ms-font-weight-900 mb-4">優質首選</h2>
                        <p class="mb-4">每一位賓士原廠技師不但都要經過嚴格的認證，還要持續地接受專業的在職訓練，以確保他們都能熟練地操作最精密的檢查儀器、工具和設備，為您的賓士愛車提供最佳的維修服務。</p>
                        <p class="mb-5">針對不同的車款、不同的維修項目，賓士原廠均備有專用的維修設備，以提供您最完善的維修服務。而且每一項設備都必須依照原廠規範正確地使用，才能確保賓士汽車的絕佳性能。任意使用不合原廠規格的設備來維修您的賓士汽車，都有可能造成意料不到損傷，讓原本單純的小問題，演變成不可收拾的嚴重後果。</p>
                        <div class="row mb-4 mb-md-0">
                            <div class="col-md-6">
                                <p class="mb-3 ms-font-111"><i
                                        class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>最新設備</b>
                                </p>
                                <p class="mb-3 ms-font-111"><i
                                        class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>經驗豐富的團隊</b></p>
                            </div>
                            <div class="col-md-6">
                                <p class="mb-3 ms-font-111"><i
                                        class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>專業技術</b></p>
                                <p class="mb-3 ms-font-111"><i
                                        class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>豐富支援</b></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <img src="images/why-choose-us.jpg" class="img-fluid" alt="About Image">
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
                        <a href="service_1.html" class="btn ms-second-btn ms-font-oswald text-white">所有服務</a>
                    </div>
                    <div class="col-md-12 col-lg-9">
                        <div id="specialize" class="owl-carousel">
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-1.png" alt="Image"
                                        class="img-fluid position-relative"></a>
                                <div class="ms-img-content position-absolute">
                                    <a href="service_detail.html">
                                        <h5 class="ms-font-weight-900 text-white">車輛檢查</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-2.png" alt="Image"
                                        class="img-fluid position-relative"></a>
                                <div class="ms-img-content position-absolute">
                                    <a href="service_detail.html">
                                        <h5 class="ms-font-weight-900 text-white">引擎維修</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-3.png" alt="Image"
                                        class="img-fluid position-relative"></a>
                                <div class="ms-img-content position-absolute">
                                    <a href="service_detail.html">
                                        <h5 class="ms-font-weight-900 text-white">車輛烤漆</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-1.png" alt="Image"
                                        class="img-fluid position-relative"></a>
                                <div class="ms-img-content position-absolute">
                                    <a href="service_detail.html">
                                        <h5 class="ms-font-weight-900 text-white">車輛檢查</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-2.png" alt="Image"
                                        class="img-fluid position-relative"></a>
                                <div class="ms-img-content position-absolute">
                                    <a href="service_detail.html">
                                        <h5 class="ms-font-weight-900 text-white">引擎維修</h5>
                                    </a>
                                </div>
                            </div>
                            <div class="item">
                                <a href="service_detail.html"><img src="images/img-3.png" alt="Image"
                                        class="img-fluid position-relative"></a>
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
	<script src="vendor/owl_carousel/js/owl.carousel.min.js"></script>
	<!-- Themes's Custom Js -->
	<script src="js/theme.js"></script>


</body>
</html>
