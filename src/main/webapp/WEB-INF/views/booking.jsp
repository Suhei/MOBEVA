<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA booking</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- bootstrap begin -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<!-- bootstrap end   -->

<!-- Favicon -->
<link rel="shortcut icon" type="image/png" href="images/mobeva-fav.jpg">
<!-- Custom Fonts Css -->
<link rel="stylesheet" href="vendor/custom_fonts/fonts.css">
<!-- Bootstrap Css -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Font Awesome Css -->
<link rel="stylesheet" href="vendor/fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<style>
.btn-form {
	background: #ea4335;
	border: 2px solid #ea4335;
	font-size: 20px;
	color: #fff;
	transition: all 0.3s linear;
	-webkit-transition: all 0.3s linear;
	-o-transition: all 0.3s linear;
	padding: 12px 40px;
	border-radius: 40px;
	text-align: center;
}

.set-tab {
	font-size: 1.5rem;
}

.col {
	padding-left: 20px;
}

#tab-div {
	height: 100px;
}

.Depot-div {
	margin-left: auto;
	margin-top: 2rem;
}

.title-div {
	border-bottom-style: solid;
	border-color: #000094;
	border-block-end-width: 2px;
	width: 700px;
	margin-left: -20px;
	margin-top: 1.5rem;
}

.btn-div {
	margin-top: 2rem;
}

#img-btn1 {
	width: 180px;
	height: 180px;
	background-image: url("images/service-1.jpg");
	background-size: 100%;
	font-size: 1.5rem;
}

#img-btn2 {
	width: 180px;
	height: 180px;
	background-image: url("images/service-5.jpg");
	background-size: 100%;
	margin-left: 1rem;
	font-size: 1.5rem;
}

.img-btn:hover {
	color: red;
	text-decoration: none;
}

.modal-dialog {
	max-width: 900px;
}
</style>

<script>
	function mySet(index) {
		$("#choice-set").val(index);
	}

	$(function() {
		$("#datepicker").datepicker({
			minDate : "+1D",
			maxDate : "+1M +15D"
		});
	})
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>
	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->
		
		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-service-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">預約方案</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 預約方案
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Service Page Tab Section -->
		<section id="ms-service-tab-section" class="ms-sec-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="ms-font-weight-900">服務項目</h2>
						<h4 class="ms-font-4a4a4a mb-4 mb-md-5">選擇並預約</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link active" id="v-pills-one-tab"
								data-toggle="pill" href="#v-pills-one" role="tab"
								aria-controls="v-pills-one" aria-selected="true">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/23.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約保養-方案A</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約保養-方案A</p>
									</div>
								</div>
							</a> <a class="nav-link" id="v-pills-two-tab" data-toggle="pill"
								href="#v-pills-two" role="tab" aria-controls="v-pills-two"
								aria-selected="false">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/24.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約保養-方案B</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約保養-方案B</p>
									</div>
								</div>
							</a> <a class="nav-link" id="v-pills-three-tab" data-toggle="pill"
								href="#v-pills-three" role="tab" aria-controls="v-pills-three"
								aria-selected="false">
								<div
									class="ms-service-box rounded text-center position-relative mb-0">
									<img class="img-fluid pb-3 ms-main-img" src="images/21.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約維修</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約維修</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-9">
						<div class="tab-content" id="v-pills-tabContent">
							<div class="tab-pane fade show active" id="v-pills-one"
								role="tabpanel" aria-labelledby="v-pills-one-tab">
								<div class="title-div">
									<h3>方案A-Cares涼夏健檢：</h3>
								</div>
								<div class="modal-body">
									<div>
										<p>歡迎您來廠參加涼夏健檢，為夏日做好準備。我們的維修專家將徹底檢查您愛車的空調系統是否正常運作。之後將以專業方式對冷卻系統進行檢測與更換建議，以確保車內空氣清新健康。本廠涼夏健檢可在炎炎夏日確保車內溫度涼爽，提供更輕鬆宜人的駕乘環境。
										</p>
										<br> <br>
										<p>
											<b>車輛檢查內容：</b> <br> • 空調系統功能檢查（燈號、風量、冷度） <br> •
											冷卻系統（目視檢查，外觀有無洩漏）<br> • 冷卻風扇功能（作動、異音）<br> •
											冷卻風扇功能（作動、異音）<br> • 雨刷功能（作動、清洗位置、雨刷片狀況、水位等）<br> •
											輪胎胎面、胎壓（含備胎）及胎紋深度檢測<br> • 電瓶及發電機效能（充電電壓）<br>
									</div>
									<div class="modal-footer">
										<a class="nav-link" id="maintain-tab"
											href="<c:url value='/bookingForm/1'/>">
											<button type="button" class="btn btn-primary btn-form"
												data-dismiss="modal">預約</button>
										</a>
									</div>
								</div>
							</div>
							<div class="tab-pane fade form-div" id="v-pills-two"
								role="tabpanel" aria-labelledby="v-pills-two-tab">
								<div class="title-div">
									<h3>方案B-Cares歲末健檢：</h3>
								</div>
								<div class="modal-body">
									<div>
										<p>透過本廠專業的維修技術人員進行車輛健檢，您的冬季旅程將更加安全舒適。歡迎來廠參加歲末健檢，為季節轉換做最好、最佳的行車準備。
										</p>
										<br> <br>
										<p>
											<b>車輛檢查內容：</b><br> • 底盤系統<br> • 煞車系統<br> •
											電瓶效能<br> • 燈光系統<br> • 輪胎胎面及胎壓<br>
										</p>
									</div>
									<div class="modal-footer">
										<a class="nav-link" id="maintain-tab"
											href="<c:url value='/bookingForm/2'/>">
											<button type="button" class="btn btn-primary btn-form"
												data-dismiss="modal">預約</button>
										</a>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="v-pills-three" role="tabpanel"
								aria-labelledby="v-pills-three-tab">
								<div class="title-div">
									<h3>我們能為您提供的項目:</h3>
								</div>
								<div class="modal-body">
									<div>
										<p>
											<b>車身與漆面：</b><br>
											•檢查引擎蓋、葉子板、車門、後視鏡、行李廂蓋、車頂、前後保險桿及側裙等部位的漆面與鈑金狀況。<br>
											•檢查前後擋風玻璃及其他車窗玻璃是否有損傷。
										</p>
										<br>
										<p>
											<b>引擎室：</b><br> •檢查機油、變速箱油、液壓油、煞車油、冷卻水、前擋及大燈清洗劑等液面高度。<br>
											•檢查V型皮帶磨耗情況以及各線路及接頭的狀況。<br> •檢查引擎蓋鎖及安全扣鉤。<br>
											•測試引擎運轉狀況並檢測異音，目視檢查是否有漏油。
										</p>
										<br>
										<p>
											<b>車輪：</b><br> •檢查各輪煞車圓盤及煞車來令片磨耗狀況。<br>
											•檢查各個輪胎的胎壓、胎面磨損狀況及是否有損傷。<br> •檢查避震器功能。
										</p>
										<br>
										<p>
											<b>底盤：</b><br> •目視檢查引擎、變速箱、方向機、差速器、懸吊及液壓系統、燃料油管等有無漏油。<br>
											•檢查轉向拉桿、控制臂及各處球接頭和防塵套有無損壞。<br> •檢查引擎腳、傳動軸及接合盤。<br>
											•檢查煞車管路、排氣管及其固定件的狀況。<br> •檢查底盤鈑金與防銹塗層是否有損傷。
										</p>
										<br>

									</div>
									<div class="modal-footer">
										<a class="nav-link" id="maintain-tab"
											href="<c:url value='/bookingForm/4'/>">
											<button type="button" class="btn btn-primary btn-form"
												data-dismiss="modal">預約</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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