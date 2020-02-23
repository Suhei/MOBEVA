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
<title>MOBEVA OrderList</title>
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
	width: 18%;
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
		<!-- 	10分鐘內登入失敗超過3次 -->
		<c:if test="${block==1}">
			<script>
				alert("登入失敗,此帳號已被鎖定${blocktime}後解鎖")
			</script>
		</c:if>
		
		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-contact-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">購物訂單查詢</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 購物訂單查詢
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
									<th>訂單號碼</th>
									<th>訂單⽇期</th>
									<th>訂單金額</th>
									<th>交易狀態</th>
									<th>付款方式</th>
									<th>狀態</th>
								</tr>
								<c:forEach var='order_list' items='${order_list}'>
									<form method="post" action="deluserorder"
										style="width: 1500px;" id="deleteorder" onsubmit="return confirm('確實要取消嗎?');">
										<tr>
											<td><a
												href="<spring:url value='order_detail?id=${order_list.so_id}'/>">${order_list.so_id}</a></td>
											<input type="hidden" name="so_id" value="${order_list.so_id}">
											<td>${order_list.so_date}</td>
											<td>${order_list.so_totalprice}</td>
											<c:if test="${order_list.so_status ==  0}">
												<td>已取消</td>
											</c:if>
											<c:if test="${order_list.so_status == 1}">
												<td>未付款</td>
											</c:if>
											<c:if test="${order_list.so_status ==  2}">
												<td>已付款</td>
											</c:if>
											<c:if test="${order_list.so_payment == 1}">
												<td>ATM</td>
											</c:if>
											<c:if test="${order_list.so_payment != 1}">
												<td>貨到付款</td>
											</c:if>
											<c:if test="${order_list.so_status !=  0}">
												<td><input type="submit"
													style="width: 100px; height: 30px;" value="取消訂單"
													 /></td>
											</c:if>

										</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
					</table>
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