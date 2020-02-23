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
<title>MOBEVA Contact</title>
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
						<h1 class="text-white ms-font-weight-900">聯絡我們</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 聯絡我們
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Contact Page Content -->
		<section id="ms-contact-section"
			class="ms-sec-padding ms-special-footer-pad">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<h2 class="ms-font-weight-900">訊息</h2>
						<div class="ms-spacer-30"></div>
						<h5 class="font-weight-bold">地址</h5>
						<p class="mb-0">
							台北市大安區復興南路一段390號1F<br>台灣
						</p>
						<div class="ms-spacer-30"></div>
						<h5 class="font-weight-bold">信箱</h5>
						<p class="mb-0"></p>
						<a href="mailto:eeit11034@gmail.com"><p
								class="d-inline-block ms-font-red mb-0">
								<u>eeit11034@gmail.com</u>
							</p></a>
						<div class="ms-spacer-30"></div>
						<h5 class="font-weight-bold">聯繫我們</h5>
						<div class="ms-social-icon mt-3 mb-3 mb-md-0">
							<a href="" target="_blank"><i
								class="fab fa-facebook-f ms-icon mr-2"></i></a> <a
								href="https://www.instagram.com/daat.creations" target="_blank"><i
								class="fab fa-instagram ms-icon mr-2"></i></a> <a href=""
								target="_blank"><i class="fab fa-twitter ms-icon"></i></a>
						</div>
					</div>

					<div class="col-md-7">
						<h2 class="ms-font-weight-900">給予建議</h2>
						<div class="ms-spacer-30"></div>
						<form id="contactForm" method="POST"
							action="<spring:url value='/sendemail'/>">
							<div class="form-row">
								<div class="form-group col-12">
									<input type="text"
										class="form-control form-control-lg rounded-0" name="name"
										placeholder="姓名*">
								</div>
								<div class="form-group col-12 col-md-6">
									<input type="email"
										class="form-control form-control-lg rounded-0" name="email"
										placeholder="Email*">
								</div>
								<div class="form-group col-12 col-md-6">
									<input type="tel"
										class="form-control form-control-lg rounded-0" name="tel"
										placeholder="電話*">
								</div>
								<div class="form-group col-12">
									<textarea class="form-control form-control-lg rounded-0"
										name="review" rows="7" placeholder="內容*" required></textarea>
								</div>
							</div>
							<button type="submit"
								class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">送出</button>
						</form>
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
	<!-- <script src="vendor/owl_carousel/js/owl.carousel.min.js"></script> -->
	<!-- Themes's Custom Js -->
	<script src="js/theme.js"></script>


</body>
<script>
	$("#contactForm").submit(function(e) {

		var form = $(this);
		var myurl = form.attr('action');

		$.ajax({
			type : "POST",
			url : myurl,
			data : form.serialize(), // serializes the form's elements.
// 			beforeSend : function() {
// 				$("#loadingAjax").show();
// 			},
// 			complete : function() {
// 				$("#loadingAjax").hide();
// 			},
			error:function(xhr, status, error){
				alert("進到error");
				alert(xhr.responseText);
			},
			success : function(data) {
				alert("發送成功");
				// 				if (data == "success") {
				// 					alert("發送成功"); // show response from the php script.
				// 				}
			}
		});

		e.preventDefault(); // avoid to execute the actual submit of the form.
	});
</script>
</html>
