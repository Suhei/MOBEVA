<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<!-- �H�U�s�W -->
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
<!-- �H�W�s�W -->
</head>

<body>
	<!-- �H�U�s�W -->
	<div id="dialog" style="background-color: white; padding: 10px;">
		<div style="display: inline-block; vertical-align: top; width: 220px;">
			<h4>Sign in</h4>
			<form>
				<input id="username" type="text" placeholder="Email �|���b��"
					name="account"><br> <input id="password"
					type="password" placeholder="Password �|���K�X" name="password"><br>
				<a href="#." style="font-size: 13px;"><b>�ѰO�K�X</b></a><br> <input
					type="submit"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="�n�J" style="padding: 5px 20px; margin-top: 15px;">
			</form>
		</div>
		<div
			style="display: inline-block; border-left: solid 1px #cccccc; margin: 5px; height: 155px;"></div>
		<div
			style="display: inline-block; width: 220px; vertical-align: top; margin-left: 20px;">
			<form>
				<h4>Register</h4>
				<input id="registerusername" type="text" placeholder="Email �|���b��"
					name="registeraccount"><br> <input
					id="registerpassword" type="password" placeholder="Password �|���K�X"
					name="registerpassword"><br> <input id="checkpassword"
					type="password" placeholder="Password �A����J�K�X" name="checkpassword"><br>
				<input type="submit"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="���U" style="padding: 5px 20px; margin-top: 10px;"> <input
					type="reset"
					class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
					value="����" style="padding: 5px 20px; margin-top: 10px;">
			</form>
		</div>
	</div>
	<!-- �H�W�s�W -->

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
										href="cart.html"><img src="images/shopping-cart01.png"
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
												href="index.html">����</a></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="about_us.html">����ڭ�</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												data-toggle="dropdown" href="#." role="button"
												aria-haspopup="true" aria-expanded="false">�A�ȶ���</a>
												<div class="dropdown-menu">
													<a class="dropdown-item ms-font-oswald ms-font-17"
														href="service_1.html">�A�ȶ���</a> <a
														class="dropdown-item ms-font-oswald ms-font-17"
														href="service_detail.html">�A�Ȥ��e</a>
												</div></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="profile.html" role="button" aria-haspopup="true"
												aria-expanded="false">�|�����</a></li>
											<li class="dropdown nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="shop.html" role="button" aria-haspopup="true"
												aria-expanded="false">�ʪ��M��</a> <!-- <div class="dropdown-menu">
                                                    <a class="dropdown-item ms-font-oswald ms-font-17"
                                                        href="shop.html">�ʪ��M��</a>
                                                    <a class="dropdown-item ms-font-oswald ms-font-17"
                                                        href="shop_detail.html">�ӫ~���e</a>
                                                </div> --></li>
											<li class="nav-item"><a
												class="nav-link ms-font-oswald ms-font-17 text-white"
												href="contact.html">�p���ڭ�</a></li>
										</ul>
									</div>
								</nav>
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
						<h1 class="text-white ms-font-weight-900">�O�i����</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">����</a> / �O�i����
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
										<th>�O�i���� </th>
										<th>�s��s�� </th>
										<th>�s��ƶq</th>
										<th>�w�����</th>
										<th>�Ƶ�</th>
									</tr>
								<c:forEach var='m_detail' items='${m_details}'>
								<tr>
									<td>${m_detail.md_id}</td>
									<td>${m_detail.maintainPartsBean.mp_id}</td>
									<td>${m_detail.md_pcs}</td>
									<td>${m_detail.md_pcs}</td>
									<td>${m_detail.md_createdate}</td>
								</tr>
								</c:forEach>
							</table>
							<br>								
                        <a href="javascript:history.go(-1)"><button type="submit" class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">�W�@��</button></a>
                    </table>
<!-- 								

							</tbody>
						</table>
						<a href="javascript:history.go(-1)"><button type="submit"
								class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">�W�@��</button></a>
					</table>
					<!-- <div class="col-md-5">
                        <h2 class="ms-font-weight-900">�O�׳渹</h2>
                        <p class="mb-0">M202002099P1</p>
                        
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">�a�}</h5>
                        <p class="mb-0">M202002099P1<br>�x�W</p>
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">�H�c</h5>
                        <p class="mb-0"></p>
                        <a href="mailto:example@gmail.com">
                            <p class="d-inline-block ms-font-red mb-0"><u>example@gmail.com</u></p>
                        </a>
                        <div class="ms-spacer-30"></div>
                        <h5 class="font-weight-bold">�pô�ڭ�</h5>
                        <div class="ms-social-icon mt-3 mb-3 mb-md-0">
                            <a href="" target="_blank"><i class="fab fa-facebook-f ms-icon mr-2"></i></a>
                            <a href="https://www.instagram.com/daat.creations" target="_blank"><i
                                    class="fab fa-instagram ms-icon mr-2"></i></a>
                            <a href="" target="_blank"><i class="fab fa-twitter ms-icon"></i></a>
                        </div>
                    </div> -->
					<!-- <div class="col-md-7">
                        <h2 class="ms-font-weight-900">������ĳ</h2>
                        <div class="ms-spacer-30"></div>
                        <form method="POST">
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <input type="text" class="form-control form-control-lg rounded-0" id="name"
                                        placeholder="�m�W*">
                                </div>
                                <div class="form-group col-12 col-md-6">
                                    <input type="email" class="form-control form-control-lg rounded-0" id="email"
                                        placeholder="Email*">
                                </div>
                                <div class="form-group col-12 col-md-6">
                                    <input type="tel" class="form-control form-control-lg rounded-0" id="tel"
                                        placeholder="�q��*">
                                </div>
                                <div class="form-group col-12">
                                    <textarea class="form-control form-control-lg rounded-0" id="review" rows="7"
                                        placeholder="���e*"></textarea>
                                </div>
                            </div>
                            <button type="submit"
                                class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">�e�X</button>
                        </form>
                    </div> -->
				</div>
			</div>
		</section>



		<!-- Footer Section ��-->
		<footer id="ms-footer">
			<div class="ms-footer-top">
				<div class="container">
					<div class="ms-spacer-100"></div>
					<div class="row">
						<div class="col-md-3 pb-4 pb-md-0">
							<h5 class="text-white ms-font-21 font-weight-bold mb-4">�ڭ̪��A��</h5>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">�o�ʾ�����</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">�ʤO��V</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">�󴫯ӧ�</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">�Ʈ��ˬd</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">���L�ˬd</a>
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								<a href="service_detail.html">�����A��</a>
							</h6>
						</div>
						<div class="col-md-3 pb-4 pb-md-0">
							<h5 class="text-white ms-font-21 font-weight-bold mb-4">��~�ɶ�</h5>
							<h6 class="ms-font-roboto-slab font-weight-light mb-4">
								�g�@��g��:<br> ���W10�I �� �ߤW8�I
							</h6>
							<h6 class="ms-font-roboto-slab font-weight-light">
								�𰲤�:<br> �C�g��<br> ��k�w����
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
								<h5 class="ms-font-weight-900">�p���覡</h5>
								<h5 class="ms-font-roboto-slab font-weight-light mb-0">
									�q��: <span><a href="" class="text-white">(02)66318168</a></span>
								</h5>
								<h5 class="ms-font-roboto-slab font-weight-light mb-1">
									Email: <span><a href="mailto:info@website.com"
										class="text-white">info@website.com</a></span>
								</h5>
								<h5 class="ms-font-roboto-slab font-weight-light">�a�}:�x�_���j�w�ϴ_���n���@�q390��1F</h5>
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

	<!-- �H�U�s�W -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#dialog").dialog({
				autoOpen : false,
				modal : true,
				width : 515,
				title : "�|���n�J",
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
				//     var _con = $('#dialog');  // �]�w�ؼаϰ�
				//     if (!_con.is(e.target) && _con.has(e.target).length === 0) { // Mark 1
				//         //$('#divTop').slideUp('slow');  //�ưʮ���
				//         console.log("SSSSSSSSSSS");     //�H�X����
				//     }
				// });
			});
		});
	</script>
	<!-- �H�W�s�W -->
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