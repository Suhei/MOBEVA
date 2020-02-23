<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

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
	<div id="dialog" style="background-color: white; padding: 10px;">
		<div style="display: inline-block; vertical-align: top; width: 220px;">
			<h4>Sign in</h4>
			<form>
				<input id="username" type="text" placeholder="Email 會員帳號"
					name="account"><br> <input id="password"
					type="password" placeholder="Password 會員密碼" name="password"><br>
				<a href="#." style="font-size: 13px;"><b>忘記密碼</b></a><br> <input
					type="submit"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="登入" style="padding: 5px 20px; margin-top: 15px;">
			</form>
		</div>
		<div
			style="display: inline-block; border-left: solid 1px #cccccc; margin: 5px; height: 155px;"></div>
		<div
			style="display: inline-block; width: 220px; vertical-align: top; margin-left: 20px;">
			<form>
				<h4>Register</h4>
				<input id="registerusername" type="text" placeholder="Email 會員帳號"
					name="registeraccount"><br> <input
					id="registerpassword" type="password" placeholder="Password 會員密碼"
					name="registerpassword"><br> <input id="checkpassword"
					type="password" placeholder="Password 再次輸入密碼" name="checkpassword"><br>
				<input type="submit"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="註冊" style="padding: 5px 20px; margin-top: 10px;"> <input
					type="reset"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="重填" style="padding: 5px 20px; margin-top: 10px;">
			</form>
		</div>
	</div>
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
									<!-- <button id="opener" class="img-fluid mx-1 mx-md-2" alt="User Icon"><img
                                          src="images/User_icon.png"></button> -->
									<!-- <a href="#."><img src="images/User_icon.png" class="img-fluid mx-1 mx-md-2"
                                          alt="User Icon"></a> -->
									<img src="images/user01.png" class="img-fluid mx-1 mx-md-2"
										id="opener" alt="User Icon" style="cursor: pointer;"> <a
										href="${ctx}/cart"><img src="images/shopping-cart01.png"
										class="img-fluid mx-1 mx-md-2" alt="Shop Icon"></a>
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
												href="index.html">首頁</a></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="about_us.html">關於我們</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												data-toggle="dropdown" href="#." role="button"
												aria-haspopup="true" aria-expanded="false">服務項目</a>
												<div class="dropdown-menu">
													<a class="dropdown-item ms-font-oswald ms-font-17"
														href="service_1.html">服務項目</a> <a
														class="dropdown-item ms-font-oswald ms-font-17"
														href="service_detail.html">服務內容</a>
												</div></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="profile.html" role="button" aria-haspopup="true"
												aria-expanded="false">會員資料</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="shop.html" role="button" aria-haspopup="true"
												aria-expanded="false">購物專區</a> <!-- <div class="dropdown-menu">
                                                <a class="dropdown-item ms-font-oswald ms-font-17"
                                                    href="shop.html">購物專區</a>
                                                <a class="dropdown-item ms-font-oswald ms-font-17"
                                                    href="shop_detail.html">商品內容</a>
                                            </div> --></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="contact.html">聯絡我們</a></li>
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
						<h1 class="text-white ms-font-weight-900">商場</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 商場
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Shop Content Section -->
		<section id="ms-shop-section"
			class="ms-sec-padding ms-special-footer-pad">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-9">
						<div class="row">
							<!-- 							<div class="col-md-4 pb-5"> -->
							<!-- 								<div class="ms-shop-box text-center rounded"> -->
							<!-- 									<img class="img-fluid" src="images/Wheel.png" alt="Shop Image"> -->
							<!-- 									<p -->
							<!-- 										class="ms-font-21 ms-font-lato font-weight-bold mb-0 text-dark">輪胎</p> -->
							<!-- 									<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4"></h6> -->
							<!-- 									<h3 class="d-inline ms-font-oswald"> -->
							<!-- 										<del>$150</del> -->
							<!-- 									</h3> -->
							<!-- 									<h3 class="d-inline ms-font-oswald ms-font-red ml-1">$120</h3> -->
							<!-- 									<div class="row position-relative"> -->
							<!-- 										<div class="w-50"> -->
							<!-- 											<a href="shop_detail.html" -->
							<!-- 												class="btn ms-font-oswald d-block ms-add-btn">商品內容</a> -->
							<!-- 										</div> -->
							<!-- 										<div class="w-50"> -->
							<!-- 											<a href="cart.html" -->
							<!-- 												class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<c:forEach var="product" items="${shopproducts}" varStatus="vs">
								<div class="col-md-4 pb-5">
									<div class="ms-shop-box text-center rounded">
										<img class="img-fluid"
											src="images/Shopproducts/${product.sp_img1}" alt="Shop Image">
										<p
											class="ms-font-21 ms-font-lato font-weight-bold mb-0 text-dark">${product.sp_name}</p>
										<h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4"></h6>
										<h3 class="d-inline ms-font-oswald">$${product.sp_price}
										</h3>
										<div class="row position-relative">
											<div class="w-50">
												<a href="${ctx}/shopdetail/${product.sp_id}"
													class="btn ms-font-oswald d-block ms-add-btn">商品內容</a>
											</div>
											<div class="w-50">
												<a class="btn ms-font-oswald d-block ms-buy-btn" onClick="addShopCart(${product.sp_id},1)">加入購物車</a>
<!-- 												<button  -->
<!-- 													class="btn ms-font-oswald d-block ms-buy-btn">加入購物車</button> -->
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="col-md-12 mt-4">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center mb-md-5 mb-lg-0">
										<c:if test="${pageNo != 1}">
											<li class="page-item"><a class="page-link"
												href="<c:url value='shopsearch?searchstr=${searchstr}&pageNo=${pageNo-1}' />"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach begin="1" end="${totalPages}" varStatus="vs">
											<c:choose>
												<c:when test="${pageNo == vs.count}">
													<li class="page-item"><a class="page-link active"
														href="<c:url value='shopsearch?searchstr=${searchstr}&pageNo=${vs.count}' />">${vs.count}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="<c:url value='shopsearch?searchstr=${searchstr}&pageNo=${vs.count}' />">${vs.count}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageNo != totalPages}">
											<li class="page-item"><a class="page-link"
												href="<c:url value='shopsearch?searchstr=${searchstr}&pageNo=${pageNo+1}' />"
												aria-label="Next"><i class="fas fa-chevron-right"></i> </a></li>
										</c:if>
									</ul>
								</nav>
							</div>

							<!-- 							<div class="col-md-12 mt-4"> -->
							<!-- 								<nav aria-label="Page navigation example"> -->
							<!-- 									<ul class="pagination justify-content-center mb-md-5 mb-lg-0"> -->
							<!-- 										<li class="page-item"> -->
							<!--                                             <a class="page-link" href="#" aria-label="Previous"> -->
							<!--                                                 <span aria-hidden="true">&laquo;</span> -->
							<!--                                             </a> -->
							<!--                                         </li> -->
							<!-- 										<li class="page-item"><a class="page-link active" -->
							<!-- 											href="#.">1</a></li> -->
							<%-- 										<li class="page-item"><a class="page-link" href="<c:url value='shop?pageNo=2' />">2</a></li> --%>
							<%-- 										<li class="page-item"><a class="page-link" href="#.">${totalPages}</a></li> --%>
							<!-- 										<li class="page-item"><a class="page-link" href="#." -->
							<!-- 											aria-label="Next"> <i class="fas fa-chevron-right"></i> -->
							<!-- 										</a></li> -->

							<!-- 									</ul> -->
							<!-- 								</nav> -->
							<!-- 							</div> -->


						</div>
					</div>
					<div class="col-md-12 col-lg-3 mt-4 mt-lg-0">
						<div id="ms-main-sidebar">
							<form method="POST" action="${ctx}/shopsearch">
								<input class="form-control" type="search" placeholder="搜尋"
									aria-label="Search" name="searchstr">
								<button class="btn btn-outline-success ms-search-btn"
									type="submit">
									<i class="fas fa-search"></i>
								</button>
							</form>
							<div class="ms-spacer-40"></div>
							<h4 class="mb-4">類別</h4>
							<div class="ms-category-sec">
								<a href="${ctx}/shop/1"><p id="cate1">
										配件 <i class="fas fa-chevron-circle-right float-right mt-1"></i>
									</p></a> <a href="${ctx}/shop/2"><p id="cate2">
										精品 <i class="fas fa-chevron-circle-right float-right mt-1"></i>
									</p></a> <a href="${ctx}/shop/3"><p id="cate3">
										改裝品 <i class="fas fa-chevron-circle-right float-right mt-1"></i>
									</p></a>
							</div>
							<div class="ms-spacer-40"></div>
							<h4 class="mb-4">暢銷品</h4>
							<div class="ms-top-seller-sec">

								<c:forEach var="repd" items="${recommendproducts}"
									varStatus="vs">
									<div class="row">
										<div class="col-5 col-md-3 col-lg-5">
											<a href="${ctx}/shopdetail/${repd.sp_id}"><img
												src="images/Shopproducts/${repd.sp_img1}" class="img-fluid"
												alt="Product Image"></a>
										</div>
										<div class="col-7 col-md-9 col-lg-7 pl-2">
											<p
												class="ms-font-lato font-weight-bold mt-1 mt-lg-0 mb-0 ms-font-111">
												<a href="${ctx}/shopdetail/${repd.sp_id}">${repd.sp_name}</a>
											</p>
											<h6 class="ms-font-lato">$${repd.sp_price}</h6>
										</div>
									</div>
									<c:if test="${vs.last == 'false'}">
										<div class="ms-spacer-30"></div>
									</c:if>
								</c:forEach>

								<!-- 								<div class="row"> -->
								<!-- 									<div class="col-5 col-md-3 col-lg-5"> -->
								<!-- 										<img src="images/product-1.jpg" class="img-fluid" -->
								<!-- 											alt="Product Image"> -->
								<!-- 									</div> -->
								<!-- 									<div class="col-7 col-md-9 col-lg-7 pl-2"> -->
								<!-- 										<p -->
								<!-- 											class="ms-font-lato font-weight-bold mt-1 mt-lg-0 mb-0 ms-font-111">Product -->
								<!-- 											Name</p> -->
								<!-- 										<h6 class="ms-font-lato">$218.00</h6> -->
								<!-- 										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i -->
								<!-- 											class="fas fa-star"></i> <i class="fas fa-star"></i> <i -->
								<!-- 											class="far fa-star"></i> -->
								<!-- 									</div> -->
								<!-- 								</div> -->

								<!-- 								<div class="row"> -->
								<!-- 									<div class="col-5 col-md-3 col-lg-5"> -->
								<!-- 										<img src="images/product-2.jpg" class="img-fluid" -->
								<!-- 											alt="Product Image"> -->
								<!-- 									</div> -->
								<!-- 									<div class="col-7 col-md-9 col-lg-7 pl-2"> -->
								<!-- 										<p -->
								<!-- 											class="ms-font-lato font-weight-bold mt-1 mt-lg-0 mb-0 ms-font-111">Product -->
								<!-- 											Name</p> -->
								<!-- 										<h6 class="ms-font-lato">$218.00</h6> -->
								<!-- 										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i -->
								<!-- 											class="fas fa-star"></i> <i class="far fa-star"></i> <i -->
								<!-- 											class="far fa-star"></i> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<!-- 								<div class="ms-spacer-30"></div> -->
								<!-- 								<div class="row"> -->
								<!-- 									<div class="col-5 col-md-3 col-lg-5"> -->
								<!-- 										<img src="images/product-3.jpg" class="img-fluid" -->
								<!-- 											alt="Product Image"> -->
								<!-- 									</div> -->
								<!-- 									<div class="col-7 col-md-9 col-lg-7 pl-2"> -->
								<!-- 										<p -->
								<!-- 											class="ms-font-lato font-weight-bold mt-1 mt-lg-0 mb-0 ms-font-111">Product -->
								<!-- 											Name</p> -->
								<!-- 										<h6 class="ms-font-lato">$218.00</h6> -->
								<!-- 										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i -->
								<!-- 											class="fas fa-star"></i> <i class="fas fa-star"></i> <i -->
								<!-- 											class="far fa-star"></i> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

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

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		//確定類別箭頭變成紅色(當前類別)
		$(function() {
			$(`#cate${category}`).attr("class", "active")
		});

		//透過sp_id加入購物車
		function addShopCart(sp_id,sp_pcs){
			$.ajax({
				type:"POST",
				url:"shopCart/add",
				data:"sp_id=" + sp_id + "&sc_pcs=" + sp_pcs,
				dataType:"text",
				error:function(xhr, status, error){
					alert("進到error");
					alert(xhr.responseText);
				},
				success:function(data){
					alert("進到success");
					if(data == "true"){
						alert("成功加入購物車");
					}else{
						alert("加入購物車失敗");
					}
				}
			});
		};
		
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
	<!-- <script src="vendor/owl_carousel/js/owl.carousel.min.js"></script> -->
	<!-- Themes's Custom Js -->
	<script src="js/theme.js"></script>

</body>
</html>
