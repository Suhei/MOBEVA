<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA ShopDetail</title>
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

</head>

<body>
	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-shop-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">商品內容</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 商品內容
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Shop Detail Content Section -->
		<section id="ms-shop-detail-section"
			class="ms-sec-padding ms-special-footer-pad">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-9">
						<div class="row">
							<div class="col-md-6">
								<div id="carousel" class="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="${ctx}/upload/images/${product.sp_img1}" alt="Image">
										</div>
										<div class="carousel-item">
											<img src="${ctx}/upload/images/${product.sp_img2}" alt="Image">
										</div>
										<div class="carousel-item">
											<img src="${ctx}/upload/images/${product.sp_img3}" alt="Image">
										</div>
									</div>
								</div>
								<div class="clearfix">
									<div id="thumbcarousel" class="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<div data-target="#carousel" data-slide-to="0" class="thumb">
													<img src="${ctx}/upload/images/${product.sp_img1}"
														alt="Image">
												</div>
												<div data-target="#carousel" data-slide-to="1" class="thumb">
													<img src="${ctx}/upload/images/${product.sp_img2}"
														alt="Image">
												</div>
												<div data-target="#carousel" data-slide-to="2" class="thumb">
													<img src="${ctx}/upload/images/${product.sp_img3}"
														alt="Image">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<h3 class="ms-font-lato font-weight-bold mt-4 mt-md-0">${product.sp_name}</h3>
								<!--                                 <div class="mb-3"> -->
								<!--                                     <i class="fas fa-star ms-rating-star"></i> -->
								<!--                                     <i class="fas fa-star ms-rating-star"></i> -->
								<!--                                     <i class="fas fa-star ms-rating-star"></i> -->
								<!--                                     <i class="fas fa-star ms-rating-star"></i> -->
								<!--                                     <i class="far fa-star ms-rating-star"></i> -->
								<!--                                     <h6 class="font-weight-normal ms-customer d-inline-block ml-2">( <a href="#.">5 Customers Review</a> )</h6> -->
								<!--                                 </div> -->
								<!--                                 <h3 class="d-inline ms-font-lato font-weight-bold ms-font-4a4a4a"><del>$500</del></h3> -->
								<h3
									class="d-inline ms-font-lato font-weight-bold ms-font-red ml-1">$${product.sp_price}</h3>
								<p class="mt-3 mb-4">
								<ul>${product.sp_desc}</ul>
								</p>
								<!--                                 <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Et harum quidem rerum expedita.</b></h6> -->
								<!--                                 <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Repudiated and annoyances accepted.</b></h6> -->
								<!--                                 <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Nam libero tempore, cum solutanobis est.</b></h6> -->
								<!--                                 <p class="my-4">When our power of choice is untrammelled and when every pleasure is to be welcomed.</p> -->
								<div class="mb-3">
									<div class="ms-number d-inline-block mr-3">
										<c:if test="${product.sp_stock >= 10}">
											<c:set var="count" value="10"></c:set>
										</c:if>
										<c:if test="${product.sp_stock < 10}">
											<c:set var="count" value="${product.sp_stock}"></c:set>
										</c:if>
										<select id="pcs">
											<c:if test="${count == 0}">
												<option value='0'>Sold Out</option>
											</c:if>
											<c:forEach var="i" begin="1" end="${count}">
												<option value='${i}'><c:out value='${i}' /></option>
											</c:forEach>
										</select>
									</div>
									<a class="btn ms-btn-dark position-absolute"
										onClick="addShopCart(${product.sp_id})">加入購物車</a>
								</div>
								<!--                                 <h6 class="ms-font-lato font-weight-normal ms-wishlist"><a class="ms-font-red" href="#."><u>Add To Wishlist</u></a></h6> -->
							</div>
						</div>
						<div class="ms-spacer-60"></div>
						<div class="row">
							<div class="col-md-12">
								<div class="ms-tabs-section">
									<ul class="nav mb-3" id="pills-tab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="pills-description-tab" data-toggle="pill"
											href="#pills-description" role="tab"
											aria-controls="pills-description" aria-selected="true">DESCRIPTION</a>
										</li>
										<!--                                         <li class="nav-item"> -->
										<!--                                             <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false">REVIEWS(5)</a> -->
										<!--                                         </li> -->
									</ul>
									<div class="tab-content" id="pills-tabContent">
										<div class="tab-pane fade show active" id="pills-description"
											role="tabpanel" aria-labelledby="pills-description-tab">
											<div class="ms-seperator-black mb-3"></div>
											<h3 class="ms-font-lato font-weight-bold">產品描述</h3>
											<p class="mt-3 mb-4">
												<img src="${ctx}/upload/images/${product.sp_intro}">
											</p>
											<!--                                             <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Et harum quidem rerum expedita distinction.</b></h6> -->
											<!--                                             <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Repudiated and annoyances accepted.</b></h6> -->
											<!--                                             <h6 class="ms-font-lato mb-2"><i class="fas fa-check-circle ms-font-red ms-icon-size mr-3"></i><b>Nam libero tempore, cum solutanobis est.</b></h6> -->
											<!--                                             <p class="mt-4">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectutor, adipisci velit, sed quia non numquam eius modi  -->
											<!--                                                 tempora incidunt ut labore et dolore magnam. adipisci velit, Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectutor.</p> -->
											<!--                                             <div class="ms-spacer-40"></div> -->
											<!--                                             <table class="table table-bordered text-center"> -->
											<!--                                                 <tr class="ms-font-lato"> -->
											<!--                                                     <th><b>製造商<span class="ms-font-red">*</span></b></th> -->
											<!--                                                     <th><b>保證<span class="ms-font-red">*</span></b></th> -->
											<!--                                                     <th><b>運費<span class="ms-font-red">*</span></b></th> -->
											<!--                                                 </tr>                -->
											<!--                                                 <tr class="ms-font-roboto-slab"> -->
											<!--                                                     <td>BMW</td> -->
											<!--                                                     <td>免費三年</td> -->
											<!--                                                     <td>無運費</td> -->
											<!--                                                 </tr> -->
											<!--                                             </table> -->
											<!--                                             <table class="table table-bordered text-center"> -->
											<!--                                                 <tr class="ms-font-lato"> -->
											<!--                                                     <th><b>Size<span class="ms-font-red">*</span></b></th> -->
											<!--                                                     <th><b>可退貨<span class="ms-font-red">*</span></b></th> -->
											<!--                                                     <th><b>產品寬度<span class="ms-font-red">*</span></b></th> -->
											<!--                                                 </tr>                -->
											<!--                                                 <tr class="ms-font-roboto-slab"> -->
											<!--                                                     <td>3公升雙渦輪增壓</td> -->
											<!--                                                     <td>30天內</td> -->
											<!--                                                     <td>50</td> -->
											<!--                                                 </tr> -->
											<!--                                             </table> -->
										</div>
										<div class="tab-pane fade" id="pills-review" role="tabpanel"
											aria-labelledby="pills-review-tab">
											<div class="ms-seperator-black mb-3"></div>
											<h3 class="ms-font-lato font-weight-bold">5 Reviews for
												Fuel Injection Pump</h3>
											<div class="row mt-4">
												<div class="col-md-2">
													<img src="images/product-1.jpg" class="img-fluid"
														alt="Image">
												</div>
												<div class="col-md-10">
													<div class="ms-reviews-tab-sec">
														<h6 class="font-weight-normal text-dark">
															<b>Coen Jacobs</b> - June 7, 2019
														</h6>
														<i class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="far fa-star ms-rating-star"></i>
														<p class="mt-2">Really happy with this print. The
															colors are great, and the paper quality is good too.</p>
													</div>
												</div>
											</div>
											<div class="ms-spacer-30"></div>
											<div class="row">
												<div class="col-md-2">
													<img src="images/product-1.jpg" class="img-fluid"
														alt="Image">
												</div>
												<div class="col-md-10">
													<div class="ms-reviews-tab-sec">
														<h6 class="font-weight-normal text-dark">
															<b>John Doe</b> - June 6, 2019
														</h6>
														<i class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i>
														<p class="mt-2">This is my favorite product. In fact,
															I've ordered 5 of them.</p>
													</div>
												</div>
											</div>
											<div class="ms-spacer-30"></div>
											<div class="row">
												<div class="col-md-2">
													<img src="images/product-1.jpg" class="img-fluid"
														alt="Image">
												</div>
												<div class="col-md-10">
													<div class="ms-reviews-tab-sec">
														<h6 class="font-weight-normal text-dark">
															<b>Amanda Pearl</b> - June 5, 2019
														</h6>
														<i class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="far fa-star ms-rating-star"></i> <i
															class="far fa-star ms-rating-star"></i>
														<p class="mt-2">This is a fantastic quality print and
															is happily hanging framed on my wall now.</p>
													</div>
												</div>
											</div>
											<div class="ms-spacer-30"></div>
											<div class="row">
												<div class="col-md-2">
													<img src="images/product-1.jpg" class="img-fluid"
														alt="Image">
												</div>
												<div class="col-md-10">
													<div class="ms-reviews-tab-sec">
														<h6 class="font-weight-normal text-dark">
															<b>Dwyane Johnson</b> - June 4, 2019
														</h6>
														<i class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i>
														<p class="mt-2">You only get the picture, not the
															person holding it, something they don't mention in the
															description, now I've got to find my own person.</p>
													</div>
												</div>
											</div>
											<div class="ms-spacer-30"></div>
											<div class="row">
												<div class="col-md-2">
													<img src="images/product-1.jpg" class="img-fluid"
														alt="Image">
												</div>
												<div class="col-md-10">
													<div class="ms-reviews-tab-sec">
														<h6 class="font-weight-normal text-dark">
															<b>Paul Stephens</b> - June 3, 2019
														</h6>
														<i class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="fas fa-star ms-rating-star"></i> <i
															class="far fa-star ms-rating-star"></i>
														<p class="mt-2">This is my favorite product. In fact,
															I've ordered 5 of them.</p>
													</div>
												</div>
											</div>
											<div class="ms-spacer-10"></div>
											<div class="ms-seperator-black my-4"></div>
											<p class="ms-font-lato d-inline-block mb-2 ms-font-111">
												<b>ADD A REVIEW</b>
											</p>
											<div class="float-right">
												<i class="fas fa-star ms-rating-star"></i> <i
													class="fas fa-star ms-rating-star"></i> <i
													class="fas fa-star ms-rating-star"></i> <i
													class="fas fa-star ms-rating-star"></i> <i
													class="far fa-star ms-rating-star"></i>
											</div>
											<p>Your email address will not be published. Required
												fields are marked *</p>
											<form method="POST">
												<div class="form-row">
													<div class="form-group col-12">
														<input type="text"
															class="form-control form-control-lg rounded-0" id="name"
															placeholder="Name*">
													</div>
													<div class="form-group col-12">
														<input type="email"
															class="form-control form-control-lg rounded-0" id="email"
															placeholder="Email*">
													</div>
													<div class="form-group col-12">
														<textarea class="form-control form-control-lg rounded-0"
															id="review" rows="7" placeholder="Review*"></textarea>
													</div>
													<div class="form-group col-10 form-check ml-4">
														<input class="form-check-input" type="checkbox"
															value="Remember Me" id="defaultCheck1"> <label
															class="form-check-label" for="defaultCheck1">Remember
															Me</label>
													</div>
												</div>
												<button type="submit"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">SUBMIT
													NOW</button>
											</form>
										</div>
									</div>
								</div>
								<div class="ms-spacer-60"></div>
								<p class="ms-font-lato d-inline-block mb-2 ms-font-111">
									<b>相關產品</b>
								</p>
								<div class="ms-seperator-black mt-2 mb-4"></div>
							</div>
						</div>
						<div class="row" id="ms-shop-section">
							<c:forEach var="relatedpd" items="${relatedproducts}">
								<div class="col-md-4 pb-5">
									<div class="ms-shop-box text-center rounded">
										<img class="img-fluid"
											src="${ctx}/upload/images/${relatedpd.sp_img1}"
											alt="Shop Image">
										<p class="ms-font-21 ms-font-lato font-weight-bold mb-0">${relatedpd.sp_name}</p>
										<!--                                     <h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor silok consectet</h6> -->
										<h3 class="d-inline ms-font-oswald">$${relatedpd.sp_price}</h3>
										<!--                                     <h3 class="d-inline ms-font-oswald ms-font-red ml-1">$400</h3> -->
										<div class="row position-relative">
											<div class="w-50">
												<a href="${ctx}/shopdetail/${relatedpd.sp_id}"
													class="btn ms-font-oswald d-block ms-add-btn">商品內容</a>
											</div>
											<div class="w-50">
												<a href="#." class="btn ms-font-oswald d-block ms-buy-btn">立即購買</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!--                             <div class="col-md-4 pb-5"> -->
							<!--                                 <div class="ms-shop-box text-center rounded"> -->
							<!--                                     <img class="img-fluid" src="images/Wheel.png" alt="Shop Image"> -->
							<!--                                     <p class="ms-font-21 ms-font-lato font-weight-bold mb-0">Flat Tyres</p> -->
							<!--                                     <h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor silok consectet</h6> -->
							<!--                                     <h3 class="d-inline ms-font-oswald"><del>$150</del></h3> -->
							<!--                                     <h3 class="d-inline ms-font-oswald ms-font-red ml-1">$120</h3> -->
							<!--                                     <div class="row position-relative"> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-add-btn">ADD TO CART</a> -->
							<!--                                         </div> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-buy-btn">BUY NOW</a> -->
							<!--                                         </div> -->
							<!--                                     </div> -->
							<!--                                 </div> -->
							<!--                             </div> -->
							<!--                             <div class="col-md-4 pb-5"> -->
							<!--                                 <div class="ms-shop-box text-center rounded"> -->
							<!--                                     <img class="img-fluid" src="images/Car-oil.png" alt="Shop Image"> -->
							<!--                                     <p class="ms-font-21 ms-font-lato font-weight-bold mb-0">Car Oil Filter</p> -->
							<!--                                     <h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor silok consectet</h6> -->
							<!--                                     <h3 class="d-inline ms-font-oswald"><del>$500</del></h3> -->
							<!--                                     <h3 class="d-inline ms-font-oswald ms-font-red ml-1">$400</h3> -->
							<!--                                     <div class="row position-relative"> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-add-btn">ADD TO CART</a> -->
							<!--                                         </div> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-buy-btn">BUY NOW</a> -->
							<!--                                         </div> -->
							<!--                                     </div> -->
							<!--                                 </div> -->
							<!--                             </div> -->
							<!--                             <div class="col-md-4 pb-5"> -->
							<!--                                 <div class="ms-shop-box text-center rounded"> -->
							<!--                                     <img class="img-fluid" src="images/Engine.png" alt="Shop Image"> -->
							<!--                                     <p class="ms-font-21 ms-font-lato font-weight-bold mb-0">Fuel Injection</p> -->
							<!--                                     <h6 class="ms-font-4a4a4a ms-font-roboto-slab mb-4">dolor silok consectet</h6> -->
							<!--                                     <h3 class="d-inline ms-font-oswald"><del>$300</del></h3> -->
							<!--                                     <h3 class="d-inline ms-font-oswald ms-font-red ml-1">$250</h3> -->
							<!--                                     <div class="row position-relative"> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-add-btn">ADD TO CART</a> -->
							<!--                                         </div> -->
							<!--                                         <div class="w-50"> -->
							<!--                                             <a href="#." class="btn ms-font-oswald d-block ms-buy-btn">BUY NOW</a> -->
							<!--                                         </div> -->
							<!--                                     </div> -->
							<!--                                 </div> -->
							<!--                             </div> -->
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
												src="${ctx}/upload/images/${repd.sp_img1}" class="img-fluid"
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
									<div class="ms-spacer-30"></div>
								</c:forEach>
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

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
 	//確定類別箭頭變成紅色(當前類別)
    $(function(){
    	$(`#cate${product.sp_category}`).attr("class","active")
      });
 	
    function addShopCart(sp_id){
    	var sc_pcs = $("#pcs").val();
    	if(sc_pcs == 0){
    		alert("商品已完售。");
    		return;
    	}
		$.ajax({
			type:"POST",
			url:"shopCart/add",
			data:"sp_id="+sp_id+"&sc_pcs=" + sc_pcs,
			dataType:"text",
			error:function(xhr, status, error){
				alert("進到error");
				alert(xhr.responseText);
			},
			success:function(data){
				if(data == "true"){
					alert("成功加入購物車");
				}else if(data == "visitor"){
					alert("請先登入");
				}else if(data == "soldout"){
					alert("庫存不足");
				}else{
					alert("加入購物車失敗");
				}
			}
		});
	};

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
