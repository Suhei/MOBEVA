<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MOBEVA booking</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- bootstrap begin -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<!-- bootstrap end   -->

<!-- Favicon -->
<link rel="shortcut icon" type="image/png" href="images/mobeva-fav.jpg">
<!-- Custom Fonts Css -->
<link rel="stylesheet" href="vendor/custom_fonts/fonts.css">
<!-- Bootstrap Css -->
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Font Awesome Css -->
<link rel="stylesheet" href="vendor/fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<style>
.btn-form {
	background: #ea4335;
	border: 2px solid #ea4335;
	font-size: 20px;
	color: #fff;
	transition: all 0.3s linear;
	-webkit-transition: all 0.3s linear;
	-o-transition: all 0.3s linear;
	padding: 12px 40px;
	border-radius: 40px;
	text-align: center;
}

.set-tab {
	font-size: 1.5rem;
}

.col {
	padding-left: 20px;
}

#tab-div {
	height: 100px;
}

.Depot-div {
	margin-left: auto;
	margin-top: 2rem;
}

.title-div {
	border-bottom-style: solid;
	border-color: #000094;
	border-block-end-width: 2px;
	width: 700px;
	margin-left: -20px;
	margin-top: 1.5rem;
}

.btn-div {
	margin-top: 2rem;
}

#img-btn1 {
	width: 180px;
	height: 180px;
	background-image: url("images/service-1.jpg");
	background-size: 100%;
	font-size: 1.5rem;
}

#img-btn2 {
	width: 180px;
	height: 180px;
	background-image: url("images/service-5.jpg");
	background-size: 100%;
	margin-left: 1rem;
	font-size: 1.5rem;
}

.img-btn:hover {
	color: red;
	text-decoration: none;
}

.modal-dialog {
	max-width: 900px;
}
</style>

<script>
	function mySet(index) {
		$("#choice-set").val(index);
	}

	// 	日期範圍限制
	$(function() {
		$("#datepicker").datepicker({
			minDate : "+1D",
			maxDate : "+1M +15D"
		});

		// 		$('input[type=button]').click(function(e) {
		// 			$('#mb_stage').val($(this).val());
		// 			alert($(this).val());
		// 		})	
	})

	function choice_stage() {
		var selectBox = document.getElementById("selectBox");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
	}

	// 	function selectDay1() {
	// 		document.getElementById("changeme").innerText = document
	// 				.getElementById("datepicker").value;
	// 	}
</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 以上新增 -->
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
						<h1 class="text-white ms-font-weight-900">服務項目</h1>
						<div class="ms-seperator my-4"></div>
						<h5 class="pt-1 font-weight-normal text-white">
							<a class="text-white" href="index.html">首頁</a> / 服務項目
						</h5>
					</div>
				</div>
			</div>
		</section>

		<!-- Service Page Tab Section -->
		<section id="ms-service-tab-section" class="ms-sec-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h2 class="ms-font-weight-900">服務項目</h2>
						<h4 class="ms-font-4a4a4a mb-4 mb-md-5">選擇並預約</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link active" id="v-pills-one-tab"
								href="<c:url value='/booking'/>">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/23.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約保養-方案A</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約保養-方案A</p>
									</div>
								</div>
							</a> <a class="nav-link" id="v-pills-two-tab"
								href="<c:url value='/booking'/>">
								<div
									class="ms-service-box rounded text-center position-relative">
									<img class="img-fluid pb-3 ms-main-img" src="images/24.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約保養-方案B</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約保養-方案B</p>
									</div>
								</div>
							</a> <a class="nav-link" id="v-pills-three-tab"
								href="<c:url value='/booking'/>">
								<div
									class="ms-service-box rounded text-center position-relative mb-0">
									<img class="img-fluid pb-3 ms-main-img" src="images/21.png"
										alt="Service Image">
									<p class="ms-font-lato font-weight-bold">預約維修</p>
									<div class="ms-service-box-hover position-absolute rounded">
										<img class="img-fluid pb-3" src="images/27.png"
											alt="Service Hover Image">
										<p class="ms-font-lato font-weight-bold">預約維修</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div style="margin-left: 80px;">
						<div class="title-div">
							<h3>填寫資料：</h3>
						</div>
						<br>
						<form:form method='POST' modelAttribute="MaintainBookingBean"
							class='form-horizontal' onsubmit="return testIf()">
							<fieldset>
								<div style="margin-left: -15px;">
									<p>會員名稱：</p>
								</div>
								<form:input type="text"
									class="form-control form-control-lg rounded-0"
									path="userInfoBean.u_name" readonly="true"
									style="margin-left: -15px;" />
								<form:input type="hidden" readonly="true"
									path="userInfoBean.u_id" />
								<hr>
								<div>
									<div class="row">
										<div class="form-row">
											<div class="col" style="width:350px;">
												<div>
													<p>選擇方案：</p>
												</div>
												<form:select class="form-control form-control-lg rounded-0"
													path="maintainInfoBean.mi_id" required="required">
													<form:options items="${SetList}" />
												</form:select>
											</div>
											<div class="col" style="width: 150px; height: 60px;">
												<div>
													<p>選擇車牌：</p>
												</div>
												<form:select class="form-control form-control-lg rounded-0"
													path="userCarBean.uc_id" required="required">
													<form:options items="${CarList}" />
												</form:select>
											</div>

											<div class="col">
												<div>
													<p>選擇車廠：</p>
												</div>
												<form:select class="form-control form-control-lg rounded-0"
													path="maintainStationBean.ms_id" required="required" id="Mstation"
													onchange="stageAjaxMstation(this.value)" >
													<form:options items="${StationList}" />
												</form:select>
											</div>

										</div>
									</div>
								</div>
								<hr>
								<!--開始選擇日期 -->
								<div class="row">
									<div class="form-row">
										<div class="col" id="choice-time">
											<div>
												<p>日期與時段：</p>
											</div>
											<div class="input-wrapper">
												<p>
													<form:input class="form-control form-control-lg rounded-0"
														path="mb_date" type="text" id="datepicker"
														placeholder="請點選日期 * " autocomplete="off"
														required="required" onchange="stageAjax(this.value)" />
												</p>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!--開始選擇時段 -->
								<div style="margin-left: -15px;">
									<div>
										<p>選擇時段：</p>
									</div>
									<div>
										<select id="selectedBox" name="mb_stage"
											onchange="choice_stage();" required
											class="form-control form-control-lg rounded-0">
											<option disabled selected value="0">請選擇時段 *</option>
											<option value="1">10:00~12:00</option>
											<option disabled value="0">--------------------</option>
											<option value="2">12:00~14:00</option>
											<option disabled value="0">--------------------</option>
											<option value="3">14:00~16:00</option>
											<option disabled value="0">--------------------</option>
											<option value="4" >16:00~18:00</option>
											<option disabled value="0">--------------------</option>
											<option value="5">18:00~20:00</option>
										</select>
									</div>
									<hr>
								</div>
								<input type="submit" value="確認預約"
									class="btn btn-primary btn-form" />
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
	</div>
	<!-- 	<div id="changeme"> -->
	<!-- 		<h1>改我改我</h1> -->
	<!-- 	</div> -->
	<!-- Footer Section -->
	
	<%@ include file="MOBEVAFooter.jsp"%>
	
	

	<!-- Body Wrapper Ends -->

	<!-- Preloader -->
	<div class="preloader"></div>

	<!-- General Js -->
	<script src="js/jquery-3.2.1.min.js"></script>

	<!-- 以下新增 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	//未輸入時段不能預約
		function testIf() {
			console.log($("#selectedBox").val());
			if ($("#selectedBox").val() == null) {
				alert("請選擇時段");	
				return false;
			}
		};

		// 		$(document).ready(function(){
		// 		    $("#button").click(function(){		         
		// 		        if($("#mb_stage").val()== null){
		// 		            alert("請選擇時段");
		// 		            eval("document.select['mb_stage'].focus()");        
		// 		        }else{
		// 		            document.select.submit();
		// 		        }
		// 		    });
		// 		 });

		//選擇日期後找出可以選擇的時間
		function stageAjax(day) {
			var ms = $("#Mstation").val();
			$.ajax({
				type : "POST",
				url : "ajaxDay",
				data : "mb_date=" + day +"&ms_id=" + ms,
				dataType : "text",
				success : function(data) {
					if (data == " ") {
						//把選項底色設為白色
						$('#selectedBox option:disabled').attr("style","background-color: white");
						//先移除目前選項的disabled
						$('#selectedBox option:disabled').removeAttr('disabled');
						//把選項請選擇加入disabled
						$('#selectedBox option[value="0"]').attr("disabled",true);
						//把請選擇設為預選
						$('#selectedBox')[0].selectedIndex = 0;
					} else {
						var arr1 = new Array();
						arr1 = data.split(" ");
						//把選項底色設為白色
						$('#selectedBox option:disabled').attr("style","background-color: white");
						//先移除目前選項的disabled
						$('#selectedBox option:disabled').removeAttr('disabled');
						//把選項請選擇加入disabled
						$('#selectedBox option[value="0"]').attr("disabled",true);
						//把請選擇設為預選
						$('#selectedBox')[0].selectedIndex = 0;
						//把被選到被時段，加上disabled
						for (let index = 0; index < arr1.length; index++) {
							$('#selectedBox option[value="' + arr1[index]+ '"]').attr("disabled",true).attr("style","background-color: gray");
						
						}
					}
				}
			});
		}

				function stageAjaxMstation(ms) {
				var day = $("#datepicker").val();
				$.ajax({
					type : "POST",
					url : "ajaxDay",
					data : "mb_date=" + day +"&ms_id=" + ms,
					dataType : "text",
					success : function(data) {
						if (data == " ") {
							//把選項底色設為白色
							$('#selectedBox option:disabled').attr("style","background-color: white");
							//先移除目前選項的disabled
							$('#selectedBox option:disabled').removeAttr('disabled');
							//把選項請選擇加入disabled
							$('#selectedBox option[value="0"]').attr("disabled",true);
							//把請選擇設為預選
							$('#selectedBox')[0].selectedIndex = 0;
						} else {
							var arr1 = new Array();
							arr1 = data.split(" ");
							//把選項底色設為白色
							$('#selectedBox option:disabled').attr("style","background-color: white");
							//先移除目前選項的disabled
							$('#selectedBox option:disabled').removeAttr('disabled');
							//把選項請選擇加入disabled
							$('#selectedBox option[value="0"]').attr("disabled",true);
							//把請選擇設為預選
							$('#selectedBox')[0].selectedIndex = 0;
							//把被選到被時段，加上disabled
							for (let index = 0; index < arr1.length; index++) {
								$('#selectedBox option[value="' + arr1[index]+ '"]').attr("disabled",true).attr("style","background-color: gray");
							
							}
						}
					}
				})						
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