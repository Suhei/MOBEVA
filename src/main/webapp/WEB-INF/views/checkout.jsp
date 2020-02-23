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
<title>EEIT110 Teams 4</title>
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
												href='${pageContext.request.contextPath}/'>首頁</a></li>
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
		<section id="ms-banner-section" class="ms-shop-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">結帳</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 結帳
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!--從這開始打-->
		<!--結帳金額-->
		<div
			style="width: 1500px; height: 50px; padding: 10px; margin: auto; margin-top: 10px;">
			<h2 style="text-align: center" class="ms-font-weight-900">
				本次消費金額金額總共:<span style="color: red">${checkout}</span>
			</h2>
		</div>
		<h1 style="text-align: center">
			<button class="btn ms-primary-btn ms-font-oswald" onclick="allkey()">一鍵輸入</button>
		</h1>

		<!--付款資訊-->
		<form method="POST"
			action="${pageContext.request.contextPath}/checkoutfinshed">
			<div
				style="height: 270px; width: 1500px; padding: 10px; margin: auto; margin-top: 10px;">
				<table style="margin: auto; border: 1px solid #ebebeb">
					<tr style="border: 1px solid #ebebeb">
						<td style="height: 150px; border: 1px solid #ebebeb;"><span
							class="ms-font-weight-900">付<br> 款<br> 資<br>
								訊
						</span></td>
						<td style="width: 1000px; border: 1px solid #ebebeb">
							<p>
								<span class="ms-font-weight-900">姓名:</span><input size="12"
									id="name1" style="border: 1px solid #ebebeb"><span
									style="color: #DDDDDD" class="ms-font-weight-900">(中文全名)
								</span> <span class="ms-font-weight-900">手機:</span><input size="15"
									id="cellphone1" style="border: 1px solid #ebebeb"> <span
									class="ms-font-weight-900">市話:</span> <input size="15"
									id="homephone1" style="border: 1px solid #ebebeb"><span
									style="color: #DDDDDD" class="ms-font-weight-900">(可略) </span>
							</p> <span class="ms-font-weight-900">發票地址</span><select
							name="YourLocation" id="YourLocation1"
							style="border: 1px solid #ebebeb">
								<option value="基隆市">基隆市</option>
								<option value="台北市">台北市</option>
								<option value="台北縣">台北縣</option>
								<option value="桃園縣">桃園縣</option>
								<option value="新竹市">新竹市</option>
								<option value="新竹縣">新竹縣</option>
								<option value="苗栗縣">苗栗縣</option>
								<option value="台中市">台中市</option>
								<option value="台中縣">台中縣</option>
								<option value="彰化縣">彰化縣</option>
								<option value="南投縣">南投縣</option>
								<option value="雲林縣">雲林縣</option>
								<option value="嘉義市">嘉義市</option>
								<option value="嘉義縣">嘉義縣</option>
								<option value="台南市">台南市</option>
								<option value="台南縣">台南縣</option>
								<option value="高雄市">高雄市</option>
								<option value="高雄縣">高雄縣</option>
								<option value="屏東縣">屏東縣</option>
								<option value="台東縣">台東縣</option>
								<option value="花蓮縣">花蓮縣</option>
								<option value="宜蘭縣">宜蘭縣</option>
								<option value="澎湖縣">澎湖縣</option>
								<option value="金門縣">金門縣</option>
								<option value="連江縣">連江縣</option>
						</select> <input size="7" id="region1" style="border: 1px solid #ebebeb"><span
							class="ms-font-weight-900">區</span> <input size="50"
							id="address1" style="border: 1px solid #ebebeb">
						</td style="border: 1px solid #ebebeb">
					</tr>
					<tr style="height: 100px; border: 1px solid #ebebeb">
						<td style="height: 100px; border: 1px solid #ebebeb"><span
							class="ms-font-weight-900">發<br> 票
						</span></td>
						<td style="width: 1000px"><span class="ms-font-weight-900">統一編號</span><input
							size="15" style="border: 1px solid #ebebeb"><span
							style="color: #DDDDDD">(個人戶可略) </span><br> <span
							style="color: #DDDDDD">依統一發票使用辦法規定：發票一經開立不得任意更改或改開發票 </span></td>
					</tr>
				</table>
			</div>
			<!--收貨人-->
			<div
				style="height: 300px; width: 1500px; padding; padding: 10px; margin: auto; margin-top: 10px; margin-bottom: 10px;">
				<table style="margin: auto; border: 1px solid #ebebeb">
					<tr style="border: 1px solid #ebebeb">
						<td style="height: 200px; border: 1px solid #ebebeb"><span
							class="ms-font-weight-900">收<br> 貨<br> 人
						</span></td>
						<td style="width: 1000px; border: 1px solid #ebebeb"><u><span
								onmousedown="thesame()" onMouseUp="changetext()"
								style="color: red" class="menu ms-font-weight-900">同付款資訊</span></u>
							&emsp; &emsp; <u><span onmousedown="clearp()"
								style="color: red" class="menu ms-font-weight-900" id="clearpay">清除資料</span></u><br>
							<br>
							<p>
								<span class="ms-font-weight-900">姓名:</span><input size="12"
									id="name2" style="border: 1px solid #ebebeb"><span
									style="color: #DDDDDD" class="ms-font-weight-900">(中文全名)
								</span> <span class="ms-font-weight-900">手機:</span><input size="15"
									id="cellphone2" style="border: 1px solid #ebebeb"> <span
									class="ms-font-weight-900">市話:</span> <input size="15"
									id="homephone2" style="border: 1px solid #ebebeb"><span
									style="color: #DDDDDD" class="ms-font-weight-900">(可略) </span>
							</p> <span class="ms-font-weight-900">收件地址</span><select
							name="YourLocation" id="YourLocation2"
							style="border: 1px solid #ebebeb">
								<option value="基隆市">基隆市</option>
								<option value="台北市">台北市</option>
								<option value="台北縣">台北縣</option>
								<option value="桃園縣">桃園縣</option>
								<option value="新竹市">新竹市</option>
								<option value="新竹縣">新竹縣</option>
								<option value="苗栗縣">苗栗縣</option>
								<option value="台中市">台中市</option>
								<option value="台中縣">台中縣</option>
								<option value="彰化縣">彰化縣</option>
								<option value="南投縣">南投縣</option>
								<option value="雲林縣">雲林縣</option>
								<option value="嘉義市">嘉義市</option>
								<option value="嘉義縣">嘉義縣</option>
								<option value="台南市">台南市</option>
								<option value="台南縣">台南縣</option>
								<option value="高雄市">高雄市</option>
								<option value="高雄縣">高雄縣</option>
								<option value="屏東縣">屏東縣</option>
								<option value="台東縣">台東縣</option>
								<option value="花蓮縣">花蓮縣</option>
								<option value="宜蘭縣">宜蘭縣</option>
								<option value="澎湖縣">澎湖縣</option>
								<option value="金門縣">金門縣</option>
								<option value="連江縣">連江縣</option>
						</select> <input size="7" id="region2" style="border: 1px solid #ebebeb"><span
							class="ms-font-weight-900">區</span> <input size="50"
							id="address2" style="border: 1px solid #ebebeb"> <span
							style="color: #DDDDDD" class="ms-font-weight-900">離島地區需收取$100運費</span>
						</td>
					</tr>
				</table>
			</div>
			<div
				style="height: 200px; width: 1500px; padding; padding: 10px; margin: auto; margin-top: 10px; margin-bottom: 10px;">
				<h1 style="text-align: center">
					<button class="btn ms-primary-btn ms-font-oswald" type="submit">確認送出</button>
				</h1>
			</div>
		</form>



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

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
	function allkey(){
		document.getElementById("name1").value="李鎮宇"
		document.getElementById("cellphone1").value="0988621786"
		document.getElementById("homephone1").value="0228116616"
		document.getElementById("YourLocation1").value="台北市"
		document.getElementById("address1").value="環河北路三段"
		document.getElementById("region1").value="士林區"
	}
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

	<script>
		function thesame() {
			$("#name2").val($("#name1").val());
			// document.getElementById("name2").value = document.getElementById("name1").value;
			document.getElementById("cellphone2").value = document
					.getElementById("cellphone1").value;
			document.getElementById("homephone2").value = document
					.getElementById("homephone1").value;
			document.getElementById("YourLocation2").value = document
					.getElementById("YourLocation1").value;
			document.getElementById("region2").value = document
					.getElementById("region1").value;
			document.getElementById("address2").value = document
					.getElementById("address1").value;
		}
		function clearp() {
			document.getElementById("name2").value = null;
			document.getElementById("cellphone2").value = null;
			document.getElementById("homephone2").value = null;
			document.getElementById("YourLocation2").value = null;
			document.getElementById("region2").value = null;
			document.getElementById("address2").value = null;
		}
	</script>

</body>

</html>