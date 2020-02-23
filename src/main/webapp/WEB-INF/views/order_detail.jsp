<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA OrderDetail</title>
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
</style>
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
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">購物訂單明細</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 購物訂單明細
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!--從這開始打-->
		<section id="ms-contact-section"
			class="ms-sec-padding ms-special-footer-pad">
			<div class="container">
				<div class="row">
					<table>
						<table id="tb_tra">
							<tbody class="form-control-lg rounded-0">
								<tr>
									<th>產品編號</th>
									<th>產品名稱</th>
									<th>數量</th>
									<th>金額</th>
									<th>備註</th>
								</tr>
								<c:forEach var='order_detail' items='${order_detail}'>
									<tr>
										<td>${order_detail.shopProductsBean.sp_id}</td>
										<td>${order_detail.shopProductsBean.sp_name}</td>
										<td>${order_detail.sd_pcs}</td>
										<td>${order_detail.sd_price}</td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<a href="javascript:history.go(-1)"><button type="submit"
								class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">上一頁</button></a>
					</table>
					<!-- <div class="col-md-5">
                        <h2 class="ms-font-weight-900">保修單號</h2>
                        <p class="mb-0">M202002099P1</p>
                        
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">地址</h5>
                        <p class="mb-0">M202002099P1<br>台灣</p>
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">信箱</h5>
                        <p class="mb-0"></p>
                        <a href="mailto:example@gmail.com">
                            <p class="d-inline-block ms-font-red mb-0"><u>example@gmail.com</u></p>
                        </a>
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">聯繫我們</h5>
                        <div class="ms-social-icon mt-3 mb-3 mb-md-0">
                            <a href="" target="_blank"><i class="fab fa-facebook-f ms-icon mr-2"></i></a>
                            <a href="https://www.instagram.com/daat.creations" target="_blank"><i
                                    class="fab fa-instagram ms-icon mr-2"></i></a>
                            <a href="" target="_blank"><i class="fab fa-twitter ms-icon"></i></a>
                        </div>
                    </div> -->
					<!-- <div class="col-md-7">
                        <h2 class="ms-font-weight-900">給予建議</h2>
                        <div class="ms-spacer-30"></div>
                        <form method="POST">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <input type="text" class="form-control form-control-lg rounded-0" id="name"
                                        placeholder="姓名*">
                                </div>
                                <div class="form-group col-12 col-md-6">
                                    <input type="email" class="form-control form-control-lg rounded-0" id="email"
                                        placeholder="Email*">
                                </div>
                                <div class="form-group col-12 col-md-6">
                                    <input type="tel" class="form-control form-control-lg rounded-0" id="tel"
                                        placeholder="電話*">
                                </div>
                                <div class="form-group col-12">
                                    <textarea class="form-control form-control-lg rounded-0" id="review" rows="7"
                                        placeholder="內容*"></textarea>
                                </div>
                            </div>
                            <button type="submit"
                                class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">送出</button>
                        </form>
                    </div> -->
				</div>
			</div>
		</section>



		<!-- Footer Section 底-->
		
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