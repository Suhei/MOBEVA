<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA Profile</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
</style>
<!-- 以上新增 -->

<!-- 新增 form 送出前確認視窗 -->
<script language="Javascript">
	// 確認修改會員資料
	function CheckForm() {
		if (confirm("是否確認送出嗎？") == true)
			return true;
		else
			return false;
	}
</script>


</head>

<body>
	<!-- Body Wrapper -->
	<div class="overflow-hidden">

		<!-- Header Section -->

		<%@ include file="MOBEVAHeader.jsp"%>

		<!-- Banner Section -->
		<section id="ms-banner-section" class="ms-service-bnr">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white ms-font-weight-900">會員資料</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 會員資料
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Service Page Tab Section -->
		<section id="ms-service-tab-section" class="ms-sec-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">

							<a class="nav-link active" id="v-pills-one-tab"
								data-toggle="pill" href="#v-pills-one" role="tab"
								aria-controls="v-pills-one" aria-selected="true">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/24.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">個人資料</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/25.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">個人資料</p>
									</div>
								</div>
							</a> <a class="nav-link" id="v-pills-two-tab" data-toggle="pill"
								href="#v-pills-two" role="tab" aria-controls="v-pills-two"
								aria-selected="false">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/23.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">車籍資料</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/26.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">車籍資料</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-9">
						<div class="tab-content" id="v-pills-tabContent">
							<!-- 個人資料開始 -->
							<div class="tab-pane fade show active" id="v-pills-one"
								role="tabpanel" aria-labelledby="v-pills-one-tab">
								<!-- 個人資料管理開始 -->
								<div class="col-md-7">
									<h2 class="ms-font-weight-900">個人資料管理</h2>
									<div class="ms-spacer-30"></div>
									<form:form method="POST" modelAttribute="UserInfo"
										onsubmit="return CheckForm();">
										<div class="form-row">

											<!-- openid 沒綁定帳號前不顯示帳號欄位 -->
											<c:if
												test="${loginuser.u_openid == NULL || loginuser.u_status == 2}">
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">帳號</p>
												<div class="form-group col-10">
													<form:input type="text"
														class="form-control form-control-lg rounded-0"
														id="account" path="u_account" readonly="true" />
												</div>
											</c:if>
<!-- 											OPENID未綁定，要修改資料(信箱、電話、地址) -->
											<c:if
												test="${loginuser.u_openid != NULL && loginuser.u_status == 1}">
<!-- 												<p -->
<!-- 													class="ms-font-lato ms-font-weight-900 text-center text-black"></p><br>										 -->
<!-- 												<div class="form-group col-10"> -->
													<form:input type="hidden"													
														path="u_account" readonly="true" />
														<form:input type="hidden"						
														path="u_idcard" readonly="true" />
<!-- 												</div> -->
											</c:if>
<!-- 											OPENID未綁定，要修改資料(信箱、電話、地址) -->
											<p
												class="ms-font-lato ms-font-weight-900 text-center text-black">姓名</p>
											<div class="form-group col-10">
												<form:input type="text"
													class="form-control form-control-lg rounded-0" id="name"
													path="u_name" placeholder="Name*" readonly="true" />
											</div>

											<!-- openid 沒綁定帳號前不顯示身份證欄位 -->
											<c:if
												test="${loginuser.u_openid == NULL || loginuser.u_status == 2}">
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">身份證號</p>
												<div class="form-group col-12 col-md-9">
													<form:input type="text"
														class="form-control form-control-lg rounded-0" id="idcard"
														path="u_idcard" readonly="true" />
												</div>
											</c:if>

											<p
												class="ms-font-lato ms-font-weight-900 text-center text-black">信箱</p>
											<div class="form-group col-12 col-md-10">
												<form:input type="email"
													class="form-control form-control-lg rounded-0" id="email"
													path="u_email" placeholder="Email*" />
											</div>
											<p
												class="ms-font-lato ms-font-weight-900 text-center text-black">電話</p>
											<div class="form-group col-12 col-md-10">
												<form:input type="tel"
													class="form-control form-control-lg rounded-0" id="mobile"
													path="u_mobile" placeholder="Mobile*" />
											</div>
											<p
												class="ms-font-lato ms-font-weight-900 text-center text-black">地址</p>
											<div class="form-group col-10">
												<form:textarea
													class="form-control form-control-lg rounded-0" id="address"
													path="u_address" rows="3" cols="30" placeholder="Address*" />

												<!-- 帶入UserInfoBean內的資料
												避免Hibernate Update時塞NULL給這些欄位 -->
												<form:input type="hidden" path="u_id" />
												<form:input type="hidden" path="u_password" />
												<form:input type="hidden" path="u_openid" />
												<form:input type="hidden" path="u_status" />
												<form:input type="hidden" path="u_createdate" />

											</div>

										</div>

										<div>
											<!-- 非 openid 帳號，按鈕置中 -->
											<c:if test="${loginuser.u_openid == NULL}">
												<button type="submit" style="margin-left: 146px"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">修改</button>
											</c:if>
											<!-- openid 帳號，按鈕靠左 -->
											<c:if test="${loginuser.u_openid != NULL}">
												<button type="submit" style="margin-left: 50px"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">修改</button>
											</c:if>

											<!-- 綁定按鈕 -->
											<!-- u_openid 有值 & u_status = 1 顯示綁定按鈕-->
											<c:if
												test="${loginuser.u_openid != NULL && loginuser.u_status == 1}">
												<div style="cursor: pointer; margin-left: 20px"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald"
													onclick="location.href='openid_binding';">綁定帳號</div>
											</c:if>

											<!-- u_openid 有值 & u_status = 2 顯示已綁定按鈕-->
											<c:if
												test="${loginuser.u_openid != NULL && loginuser.u_status == 2}">
												<div
													style="cursor: pointer; margin-left: 20px; background-color: #ABB2B9; border: #ABB2B9; color: #fff;"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">帳號已綁定</div>
											</c:if>

										</div>

									</form:form>

								</div>
								<!-- 個人資料管理結束 -->
							</div>
							<!-- 個人資料結束 -->

							<!-- 車籍資料開始 -->
							<div class="tab-pane fade" id="v-pills-two" role="tabpanel"
								aria-labelledby="v-pills-two-tab">

								<!-- 車籍資料管理開始 -->
								<div class="col-md-7">
									<h2 class="ms-font-weight-900">車籍資料管理</h2>
									<div class="ms-spacer-30"></div>
									<div class="form-row">
										<p
											class="ms-font-lato ms-font-weight-900 text-center text-black">車牌</p>
										<div class="form-group col-10">
											<select id="carcnt" onChange="showCarInfo(this.value)"
												class="form-control form-control-lg rounded-0">
												<option value="0" selected="selected">請選擇</option>
												<c:forEach var="allusercar" items='${AllUserCar}'>
													<option value='${allusercar.uc_id}'>${allusercar.uc_number}</option>
												</c:forEach>
												<option value="-1">新增車籍資料</option>
											</select>
										</div>
									</div>

									<div>
										<c:forEach var="carinfo" items="${AllUserCar}">

											<!-- 在每行開頭顯示 carinfo.uc_id -->
											<%-- 										<p>showId${carinfo.uc_id}</p> --%>
											<!-- 在每行開頭顯示 carinfo.uc_id -->
											<form method="POST" style="display: none"
												id="showId${carinfo.uc_id}"
												action="<c:url value='/userCarDelete'/> ">
												<div class="form-row">

													<!-- 刪除車籍資料使用的uc_id -->
													<input type="hidden" value="${carinfo.uc_id}" name="uc_id">

													<p
														class="ms-font-lato ms-font-weight-900 text-center text-black">廠牌</p>
													<div class="form-group col-10">
														<input type="text"
															class="form-control form-control-lg rounded-0"
															id="cbrand" value="${carinfo.uc_brand}"
															placeholder="Brand*" readonly="readonly">
													</div>
													<p
														class="ms-font-lato ms-font-weight-900 text-center text-black">車型</p>
													<div class="form-group col-12 col-md-10">
														<input type="text"
															class="form-control form-control-lg rounded-0"
															id="cmodel" value="${carinfo.uc_model}"
															placeholder="Model*" readonly="readonly">
													</div>
													<p
														class="ms-font-lato ms-font-weight-900 text-center text-black">年份</p>
													<div class="form-group col-12 col-md-10">
														<input type="text"
															class="form-control form-control-lg rounded-0"
															id="cbuilddate" value="${carinfo.uc_modelyear}"
															placeholder="BuildDate*" readonly="readonly">
													</div>
													<p
														class="ms-font-lato ms-font-weight-900 text-center text-black">引擎號碼</p>
													<div class="form-group col-12 col-md-9">
														<input type="text"
															class="form-control form-control-lg rounded-0"
															id="cenginenumber" value="${carinfo.uc_engine}"
															placeholder="EngineNumber*" readonly="readonly">
													</div>
												</div>
												<button type="submit" style="margin-left: 146px"
													class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">刪除</button>
											</form>
										</c:forEach>

										<!-- 新增車籍資料 -->
										<form:form method="POST" modelAttribute="AddUserCar"
											id="showId-1" style="display: none"
											servletRelativeAction="/AddUserCar">
											<div class="form-row">
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">車牌</p>
												<div class="form-group col-10">
													<form:input type="text"
														class="form-control form-control-lg rounded-0"
														id="cnumber2" path="uc_number" placeholder="Number*" />
												</div>
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">廠牌</p>
												<div class="form-group col-10">
													<form:input type="text"
														class="form-control form-control-lg rounded-0" id="cbrand2"
														path="uc_brand" placeholder="Brand*" />
												</div>
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">車型</p>
												<div class="form-group col-12 col-md-10">
													<form:input type="text"
														class="form-control form-control-lg rounded-0" id="cmodel2"
														path="uc_model" placeholder="Model*" />
												</div>
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">年份</p>
												<div class="form-group col-12 col-md-10">
													<form:input type="text"
														class="form-control form-control-lg rounded-0"
														id="cbuilddate2" path="uc_modelyear"
														placeholder="BuildDate*" />
												</div>
												<p
													class="ms-font-lato ms-font-weight-900 text-center text-black">引擎號碼</p>
												<div class="form-group col-12 col-md-9">
													<form:input type="text"
														class="form-control form-control-lg rounded-0"
														id="cenginenumber2" path="uc_engine"
														placeholder="EngineNumber*" />
												</div>
											</div>
											<button type="submit" style="margin-left: 50px"
												class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">新增</button>
											<div style="cursor:pointer; margin-left:20px; background-color:#ABB2B9; border:#ABB2B9; color: #fff; "
             class="btn ms-primary-btn ms-red-border-btn ms-font-oswald" onclick="allinput()">一鍵輸入</div>											
										</form:form>
									</div>
								</div>
								<!-- 車籍資料管理結束 -->
							</div>
							<!-- 車籍資料結束 -->
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
		// 車籍資料_車籍資料管理_顯示車籍資料（方法1）
		var lastSelected = 0;
		function showCarInfo(index) {
			var lastSelectId = "#showId" + lastSelected;
			$(lastSelectId).toggle();
			console.log("變更前lastSelectId：" + lastSelectId);
			lastSelected = index;
			var nowSelectId = "#showId" + index;
			$(nowSelectId).toggle();
			console.log("變更後nowSelectId：" + nowSelectId);
		};

		for (let index = 0; index < 5; index++) {
			console.log(index);
			$("#s" + index + "").click(function() {
				$('html,body').animate({
					scrollTop : $("#section" + index + "").offset().top
				}, "show");
				return false;
			});
		};

		// 車籍資料_車籍資料管理_顯示車籍資料（方法2）
		//         var lastSelected = 0;
		//         function showCarInfo2(index){
		//			document.getElementById("showId"+lastSelected).style.display="none";
		//         	console.log("變更前lastSelected：" + lastSelected);
		// 			document.getElementById("showId"+index).style.display="inline";
		// 			lastSelected = index;
		// 			console.log("變更後lastSelected：" + lastSelected);
		//         }
		function allinput() {
			document.getElementById("cbrand2").value = "BMW"
			document.getElementById("cnumber2").value = "ANA-1122"
			document.getElementById("cmodel2").value = "3 Series Gran Turismo"
			document.getElementById("cbuilddate2").value = "2015"
			document.getElementById("cenginenumber2").value = "AA123456789"
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

</body>

</html>