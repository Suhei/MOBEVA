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
<title>MOBEVA</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<!-- Favicon -->
<link rel="shortcut icon" type="image/png" href="${ctx}/images/mobeva-fav.jpg">
<!-- Custom Fonts Css -->
<link rel="stylesheet" href="${ctx}/vendor/custom_fonts/fonts.css">
<!-- Bootstrap Css -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Font Awesome Css -->
<link rel="stylesheet" href="${ctx}/vendor/fontawesome/css/all.min.css">
<!-- Owl Carousel Css -->
<!-- <link rel="stylesheet" href="vendor/owl_carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor/owl_carousel/css/owl.theme.default.css"> -->
<!-- Custom Style Css -->
<link rel="stylesheet" href="${ctx}/css/style.css">
<link rel="stylesheet" href="${ctx}/css/responsive.css">

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
						<h1 class="text-white ms-font-weight-900">商場</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="${ctx}/index">首頁</a> / 商場
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
							<c:forEach var="product" items="${shopproducts}">
							<c:if test="${product.sp_status == 1}">
								<div class="col-md-4 pb-5">
									<div class="ms-shop-box text-center rounded">
										<img class="img-fluid"
											src="${ctx}/upload/images/${product.sp_img1}" alt="Shop Image">
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
											
											<c:choose>
												<c:when test="${product.sp_stock == 0}">
													<a class="btn ms-font-oswald d-block ms-buy-btn" >商品已完售</a>
												</c:when>
												<c:otherwise>
													<a class="btn ms-font-oswald d-block ms-buy-btn" onClick="addShopCart(${product.sp_id},1)">加入購物車</a>
												</c:otherwise>
											</c:choose>
										
											</div>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
							<div class="col-md-12 mt-4">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center mb-md-5 mb-lg-0">
										<c:if test="${pageNo != 1}">
											<li class="page-item"><a class="page-link"
												href="<c:url value='shop/${category}?pageNo=${pageNo-1}' />"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach begin="1" end="${totalPages}" varStatus="vs">
											<c:choose>
												<c:when test="${pageNo == vs.count}">
													<li class="page-item"><a class="page-link active"
														href="<c:url value='shop/${category}?pageNo=${vs.count}' />">${vs.count}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="<c:url value='shop/${category}?pageNo=${vs.count}' />">${vs.count}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageNo != totalPages}">
											<li class="page-item"><a class="page-link"
												href="<c:url value='shop/${category}?pageNo=${pageNo+1}' />"
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
			
		<%@ include file="MOBEVAFooter.jsp"%>

	</div>
	<!-- Body Wrapper Ends -->

	<!-- Preloader -->
	<div class="preloader"></div>

	<!-- General Js -->
	<script src="${ctx}/js/jquery-3.2.1.min.js"></script>

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
	<script src="${ctx}/vendor/fontawesome/js/all.min.js"></script>
	<!-- Owl Carousel Js -->
	<!-- <script src="vendor/owl_carousel/js/owl.carousel.min.js"></script> -->
	<!-- Themes's Custom Js -->
	<script src="${ctx}/js/theme.js"></script>

</body>
</html>
