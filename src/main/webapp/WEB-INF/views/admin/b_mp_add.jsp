﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>會員資料</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首頁</a> <a href="">演示</a>
			<a> <cite>導航元素</cite></a>
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
					<div class="layui-card-body ">
						
						<!-- 新增零件 -->

						<form:form method="POST" modelAttribute="New_Mp_Form"
							id="showId-1" servletRelativeAction="/admin/b_mp_add">
							<div class="form-row">
<!-- 								<p -->
<!-- 									class="ms-font-lato ms-font-weight-900 text-center text-black">零件編號</p> -->
<!-- 								<div class="form-group col-10"> -->
<%-- 									<form:input type="text" id='mp_id' --%>
<%-- 										class="form-control form-control-lg rounded-0" --%>
<%-- 										path="mp_id" placeholder="零件編號*" /> --%>
<!-- 								</div> -->
								<p
									class="ms-font-lato ms-font-weight-900 text-center text-black">零件名稱</p>
								<div class="form-group col-10">
									<form:input type="text" id='mp_name'
										class="form-control form-control-lg rounded-0"
										path="mp_name" placeholder="零件名稱*" />
								</div>
								<p
									class="ms-font-lato ms-font-weight-900 text-center text-black">零件價格</p>
								<div class="form-group col-10">
									<form:input type="text" id='mp_price'
										class="form-control form-control-lg rounded-0"
										path="mp_price" placeholder="零件價格*" />
								</div>
								<p
									class="ms-font-lato ms-font-weight-900 text-center text-black">零件庫存數量</p>
								<div class="form-group col-10">
									<form:input type="text" id='mp_stock'
										class="form-control form-control-lg rounded-0"
										path="mp_stock" placeholder="零件庫存數量*" />
								</div>
<!-- 								<p -->
<!-- 									class="ms-font-lato ms-font-weight-900 text-center text-black">新增日期</p> -->
<!-- 								<div class="form-group col-10"> -->
<%-- 									<form:input type="text" id='mp_createdate' --%>
<%-- 										class="form-control form-control-lg rounded-0" --%>
<%-- 										path="mp_createdate" placeholder="新增日期*" /> --%>
<!-- 								</div> -->
<!-- 								<p -->
<!-- 									class="ms-font-lato ms-font-weight-900 text-center text-black">修改日期</p> -->
<!-- 								<div class="form-group col-12 col-md-10"> -->
<%-- 									<form:input type="text" id='mp_modifieddate' --%>
<%-- 										class="form-control form-control-lg rounded-0" --%>
<%-- 										path="mp_modifieddate" placeholder="修改日期*" /> --%>
<!-- 								</div> -->
								<p
									class="ms-font-lato ms-font-weight-900 text-center text-black">販售狀態</p>
								<div class="form-group col-12 col-md-9">
									<form:input type="text" id='mp_status'
										class="form-control form-control-lg rounded-0"
										path="mp_status" placeholder="EngineNumber*" />
								</div>
							</div>
							<button type="submit"
								class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">新增</button>
								
							
<!-- 							<div style="display: none"> -->
<%-- 								<form:input path="maintainBookingBean.mb_id" --%>
<%-- 									value="${Orderlist_mb_id}" /> --%>
<!-- 							</div> -->
						</form:form>
						<button onclick="allinput()"
								class="btn ms-primary-btn ms-red-border-btn ms-font-oswald">一鍵輸入</button>
					</div>
					<div class="layui-card-body ">
						<!-- 						<div class="page"> -->
						<!-- 							<div> -->
						<!-- 								<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> -->
						<!-- 								<span class="current">2</span> <a class="num" href="">3</a> <a -->
						<!-- 									class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
 
<script>
	
	function allinput() {
// 	    document.getElementById("mp_id").value = ""
	    document.getElementById("mp_name").value = "oil_Repsol_5w40"
	    document.getElementById("mp_price").value = "500"
	    document.getElementById("mp_stock").value = "24"
// 	    document.getElementById("mp_createdate").value = ""
// 	    document.getElementById("mp_modifieddate").value = ""
	    document.getElementById("mp_status").value = "1"
	   }

	//車籍資料_車籍資料管理_顯示車籍資料（方法1）
	var lastSelected = 0;
	function showAuthInfo(index) {
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