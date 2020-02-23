<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA MaintanOrder</title>
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
						<h1 class="text-white ms-font-weight-900">�w���d��</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">����</a> / �w���d��
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!--�q�o�}�l��-->
		<section id="ms-contact-section"
			class="ms-sec-padding ms-special-footer-pad">
			<div class="container">
				<div class="row">
					<table>

						<table id="tb_tra">
							<tbody class="form-control-lg rounded-0">
								<tr>
									<th>�O�i�渹</th>
									<th>���P���X</th>
									<th>�O�׾��I</th>
									<th>�w�����</th>
									<th>���A</th>
								</tr>
								<c:forEach var='m_order' items='${m_orders}'>
									<form method="POST" action="updateMo_detail"
										onSubmit="return confirm('�T�{����')">
									<tr>
										<td><input type='hidden' name='mb_id'
											value="${m_order.mb_id}"> <a
											href="<spring:url value='/m_detail?id=${m_order.mb_id}'/>">${m_order.mb_id}
										</a></td>
										<td>${m_order.userCarBean.uc_number}</td>
										<td>${m_order.maintainStationBean.ms_name}</td>
										<td>${m_order.mb_date}</td>
										<td><c:if test="${m_order.mb_status == 0}">
											�w����
									</c:if> <c:if test="${m_order.mb_status == 1}">
												<input type="hidden" name='mb_status'
													value='${m_order.mb_status}'>
												<a href="<spring:url value='/updateMo_detail'/>"><button
														type="submit"
														class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">����</button></a>
											</c:if> <c:if test="${m_order.mb_status == 2}">
											�w����
									</c:if></td>
									</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>


					</table>
				</div>
				<div class="ms-spacer-30"></div>
				<a href="javascript:history.go(-1)"><button type="submit"
						class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">�W�@��</button></a>

			</div>

		</section>



		<!-- Footer Section ��-->

		<%@ include file="MOBEVAFooter.jsp"%>

	</div>
	<!-- Body Wrapper Ends -->

	<!-- Preloader -->
	<div class="preloader"></div>

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- �H�U�s�W -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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