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
<title>shopping cart</title>
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
	width: 100%;
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
									<c:if test="${b_loginsuccess==1}">
										<a
											onclick="javascript:location.href='<spring:url value='b_logout' />'"><img
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
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">購物車</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="${pageContext.request.contextPath}/">首頁</a>
							/ 購物車
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Cart Page Content -->
		<form action="${ctx}/checkout"
			method="POST" style="width: 100%">
			<section id="ms-cart-section"
				class="ms-sec-padding ms-special-footer-pad">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h3 class="d-inline-block ms-font-lato font-weight-bold">購物車</h3>
						</div>
					</div>
					<div class="row">
						<table>
							<tbody>
								<tr>
									<th>產品名稱</th>
									<th>數量</th>
									<th>價格</th>
									<th>小計</th>
									<th></th>
								</tr>
								<c:forEach var='cart' items='${cart}' varStatus="Status">
									<tr id="row${Status.count}">
										<td><a href="#">${cart.shopProductsBean.sp_name}</a></td>
										<input type="hidden" value="${cart.shopProductsBean.sp_id}"
											name="productid">
										<td><select id="pcs${Status.count}" class="pcs"
											name="sd_pcs"
											onChange="updatepcs(${Status.count},${cart.shopProductsBean.sp_id},this.value)">
												<option value='${cart.sc_pcs}'>${cart.sc_pcs}</option>
												<c:if test="${cart.shopProductsBean.sp_stock >= 10}">
													<option value='1'>1</option>
													<option value='2'>2</option>
													<option value='3'>3</option>
													<option value='4'>4</option>
													<option value='5'>5</option>
													<option value='6'>6</option>
													<option value='7'>7</option>
													<option value='8'>8</option>
													<option value='9'>9</option>
													<option value='10'>10</option>
												</c:if>
												<c:if test="${cart.shopProductsBean.sp_stock < 10}">
													<c:set var="stock"
														value="${cart.shopProductsBean.sp_stock}"></c:set>
													<c:forEach var="i" begin="1" end="${stock}">
														<option value='${i}'><c:out value='${i}' /></option>
													</c:forEach>
												</c:if>
										</select></td>
										<td><h6 id="price${Status.count}">${cart.shopProductsBean.sp_price}</h6></td>
										<input type="hidden" value="${cart.shopProductsBean.sp_price}"
											name="sp_price">
										<td><h6 id="subtotal${Status.count}">${cart.shopProductsBean.sp_price*cart.sc_pcs}
												<td><input type="button" value="取消"
													onclick="deletecart(${cart.shopProductsBean.sp_id},${Status.count})" /></td>
									</tr>
									<c:if test="${Status.last == 'True'}">
										<c:set var="count" value="${Status.count}"></c:set>
										<input type="hidden" id="counts" value="${count}">
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<div class="row">
							<div class="col-md-12">
								<div class="ms-seperator-black my-4"></div>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="offset-md-6 col-md-6">
							<p
								class="ms-font-lato d-inline-block font-weight-bold mb-0 ms-font-red">總金額:</p>
							<p
								class="ms-font-lato d-inline-block mb-0 float-right ms-font-red"
								id="total"></p>
							<input type="hidden" value="" id="so_totalprice"
								name="so_totalprice">
							<div class="ms-seperator-black my-4"></div>
							<button
								class="btn ms-primary-btn ms-primary-btn-two ms-font-oswald float-right"
								type="submit" name="payment" value="1">ATM付款</button>
							<button
								class="btn ms-primary-btn ms-primary-btn-two ms-font-oswald float-right"
								type="submit" name="payment" value="0">貨到付款</button>
						</div>
					</div>
				</div>
			</section>
		</form>
		<script>
		//計算初始總金額(放在這才抓的到初始資料)
		var count = document.getElementById("counts").value;
		var sum=0;
		for (var x=1; x<=count ;x++){
			var subtotal=0;
			var price = document.getElementById("price"+x).innerText
			var pcs = document.getElementById("pcs"+x).value
			subtotal = price * pcs
			sum = sum + subtotal;
		}
		document.getElementById("total").innerText=sum
		document.getElementById("so_totalprice").value=sum
		//數量變動後計算小計以及總金額
		function changepcs(x) {
		document.getElementById("subtotal"+x).innerText = document.getElementById("price"+x).innerText* document.getElementById("pcs"+x).value
		var sum=0;
		for (var x=1; x<=count ;x++){
			var subtotal=0;
			var price = document.getElementById("price"+x).innerText
			var pcs = document.getElementById("pcs"+x).value
			subtotal = price * pcs
			sum = sum + subtotal;
			}
	    	document.getElementById("total").innerText=sum;
	    	document.getElementById("so_totalprice").value=sum
		}
		
		//更新購物車
		function updatepcs(x,sp_id,sc_pcs){
			changepcs(x);
			$.ajax({
				type:"POST",
				url:"updatecart2",
				data:"sp_id=" + sp_id + "&sc_pcs=" + sc_pcs,
				dataType:"text",
				error:function(xhr, status, error){
					alert("進到error");
					alert(xhr.responseText);
				},
// 				success:function(data){
// 					alert("進到success");
// 					if(data == "true"){
// 						alert("成功加入購物車");
// 					}else{
// 						alert("加入購物車失敗");
// 					}
// 				}
			});
			
		}
		//移除購物車商品
		function deletecart(sp_id,x){
			$.ajax({
				type:"POST",
				url:"deletecart2",
				data:"sp_id2=" + sp_id,
				dataType:"text",
				error:function(xhr, status, error){
					alert("進到error");
					alert(xhr.responseText);
				},
				success:function(data){
				//重新計算給Controller的金額
				    var price =document.getElementById("subtotal"+x).innerText
					var total =document.getElementById("total").innerText;
					document.getElementById("total").innerText=total-price
					document.getElementById("so_totalprice").value=total-price
					//移除整欄
					document.getElementById("row"+x).innerHTML="";
				}
			});
			changepcs(x);
		} 
		</script>
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
