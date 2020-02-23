<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>預約列表</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="admin/css/font.css">
<link rel="stylesheet" href="admin/css/xadmin.css">
<script src="admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="admin/js/xadmin.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// 	日期範圍限制
	$(function() {
		$("#datepicker").datepicker({
			minDate : "+1D",
			maxDate : "+1M +15D",
		});
		//將日期直接嵌在指定容器中
		laydate.render({
			elem : '#datepicker',
			format : 'dd/MM/yyyy'
		});

	});

	function choice_stage() {
		var selectBox = document.getElementById("selectBox");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
	}
</script>


<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a>首頁</a> <a>預約管理</a> <a> <cite>預約列表</cite></a><a>修改預約</a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="重新整理"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body "></div>
					<div style="text-align: right;"></div>
					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>會員名稱</th>
									<th>車牌號碼</th>
									<th>預約方案</th>
									<th>預約廠區</th>
									<th>預約日期</th>
									<th>預約時段</th>
									<th></th>
							</thead>
							<tbody>
								<form:form method='POST' modelAttribute="in_booking"
									class='form-horizontal' onsubmit="return testIf()">
									<tr>
										<form:input type="hidden" path="userInfoBean.u_name" />
										<form:input type="hidden" path="userInfoBean.u_email" />
										<form:input type="hidden" path="userInfoBean.u_id" />
										<td>${in_booking.userInfoBean.u_name}</td>
										<td><form:select path="userCarBean.uc_id">
												<form:options items="${CarList}" />
											</form:select></td>
										<td><form:select path="maintainInfoBean.mi_id">
												<form:options items="${SetList}" />
											</form:select></td>
										<td><form:select path="maintainStationBean.ms_id"
												id="Mstation">
												<form:options items="${StationList}" />
											</form:select></td>
										<td>
											<p>
												<form:input path="mb_date" type="text" id="datepicker"
													autocomplete="off" required="required"
													onchange="stageAjax(this.value)" />
											</p>
										</td>
										<td><form:select id="selectedBox" path="mb_stage"
												onchange="choice_stage();" required="required">
												<form:option disabled="true" selected="true" value="0">請選擇時段 *</form:option>
												<form:option value="1">10:00~12:00</form:option>
												<form:option disabled="true" value="0">--------------------</form:option>
												<form:option value="2">12:00~14:00</form:option>
												<form:option disabled="true" value="0">--------------------</form:option>
												<form:option value="3">14:00~16:00</form:option>
												<form:option disabled="true" value="0">--------------------</form:option>
												<form:option value="4">16:00~18:00</form:option>
												<form:option disabled="true" value="0">--------------------</form:option>
												<form:option value="5">18:00~20:00</form:option>
											</form:select></td>
										<td class="td-manage"><a title="確認"
											style="margin-left: 20px;">
												<button type="submit">確認</button>
										</a>
									</tr>
								</form:form>
							</tbody>

						</table>
					</div>
					<div class="layui-card-body "></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	//選擇日期後找出廠區並且篩選的時間
	function stageAjax(day) {
		var ms = $("#MBstation").val();
		$.ajax({
			type : "POST",
			url : "b_ajaxDay",
			data : "mb_date=" + day + "&ms_id=" + ms,
			dataType : "text",
			success : function(data) {
				if (data == " ") {
					//把選項底色設為白色
					$('#selectedBox option:disabled').attr("style",
							"background-color: white");
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
					//把請選擇設為預選
					$('#selectedBox')[0].selectedIndex = 0;
				} else {
					var arr1 = new Array();
					arr1 = data.split(" ");
					//把選項底色設為白色
					$('#selectedBox option:disabled').attr("style",
							"background-color: white");
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
					//把請選擇設為預選
					$('#selectedBox')[0].selectedIndex = 0;
					//把被選到被時段，加上disabled
					for (let index = 0; index < arr1.length; index++) {
						$('#selectedBox option[value="' + arr1[index] + '"]')
								.attr("disabled", true).attr("style",
										"background-color: gray");

					}
				}
			}
		});
	}
	//選擇廠區後找出日期並且篩選的時間
	function stageAjaxMstation(ms) {
		var day = $("#datepicker").val();
		$.ajax({
			type : "POST",
			url : "b_ajaxDay",
			data : "mb_date=" + day + "&ms_id=" + ms,
			dataType : "text",
			success : function(data) {
				if (data == " ") {
					//把選項底色設為白色
					$('#selectedBox option:disabled').attr("style",
							"background-color: white");
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
					//把請選擇設為預選
					$('#selectedBox')[0].selectedIndex = 0;
				} else {
					var arr1 = new Array();
					arr1 = data.split(" ");
					//把選項底色設為白色
					$('#selectedBox option:disabled').attr("style",
							"background-color: white");
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
					//把請選擇設為預選
					$('#selectedBox')[0].selectedIndex = 0;
					//把被選到被時段，加上disabled
					for (let index = 0; index < arr1.length; index++) {
						$('#selectedBox option[value="' + arr1[index] + '"]')
								.attr("disabled", true).attr("style",
										"background-color: gray");

					}
				}
			}
		})
	};
	layui.use([ 'laydate', 'form' ], function() {
		var laydate = layui.laydate;
		var form = layui.form;

		//執行一個laydate實例
		laydate.render({
			elem : '#start' //指定元素
		});

		//執行一個laydate實例
		laydate.render({
			elem : '#end' //指定元素
		});
	});

	/*使用者-停用*/
	function member_stop(obj, id) {
		layer.confirm('確認要停用嗎？', function(index) {

			if ($(obj).attr('title') == '啟用') {

				//發非同步把使用者狀態進行更改
				$(obj).attr('title', '停用')
				$(obj).find('i').html('&#xe62f;');

				$(obj).parents("tr").find(".td-status").find('span').addClass(
						'layui-btn-disabled').html('已停用');
				layer.msg('已停用!', {
					icon : 5,
					time : 1000
				});

			} else {
				$(obj).attr('title', '啟用')
				$(obj).find('i').html('&#xe601;');

				$(obj).parents("tr").find(".td-status").find('span')
						.removeClass('layui-btn-disabled').html('已啟用');
				layer.msg('已啟用!', {
					icon : 5,
					time : 1000
				});
			}

		});
	}

	/*使用者-刪除*/
	function member_del(obj, id) {
		layer.confirm('確認要刪除嗎？', function(index) {
			//發非同步刪除數據
			$(obj).parents("tr").remove();
			layer.msg('已刪除!', {
				icon : 1,
				time : 1000
			});
		});
	}

	function delAll(argument) {

		var data = tableCheck.getData();

		layer.confirm('確認要刪除嗎？' + data, function(index) {
			//捉到所有被選中的，發非同步進行刪除
			layer.msg('刪除成功', {
				icon : 1
			});
			$(".layui-form-checked").not('.header').parents('tr').remove();
		});
	}
</script>



<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</html>