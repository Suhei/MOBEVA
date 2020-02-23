﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>商城訂單</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>

</head>
<body>
	<div class="x-nav">
		<a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="重新整理"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
									<div class="layui-card-body "></div>
								<h1 style="text-align: center;">商城訂單列表</h1>
					<div class="layui-card-body">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>訂單號碼</th>
									<th>訂貨ID</th>
									<th>訂貨人</th>
									<th>訂單⽇期</th>
									<th>訂單金額</th>
									<th>付款方式</th>
									<th>交易狀態</th>
									<th></th>
							</thead>
							<tbody>
								<c:forEach var='orders' items='${orders}'>
									<tr>
										<td><a
											href="<spring:url value='b_order_detail?id=${orders.so_id}'/>"><span
												style="color: blue;">${orders.so_id}</span></a></td>
										<td>${orders.userInfoBean.u_id}</td>
										<td>${orders.userInfoBean.u_name}</td>
										<td>${orders.so_date}</td>
										<td>${orders.so_totalprice}</td>
										<c:if test="${orders.so_payment==1}">
											<td>ATM</td>
										</c:if>
										<c:if test="${orders.so_payment==0}">
											<td>貨到付款</td>
										</c:if>
										<c:if test="${orders.so_status==0}">
											<td>已取消</td>
										</c:if>
										<c:if test="${orders.so_status==1}">
											<td>未付款</td>
										</c:if>
										<c:if test="${orders.so_status==2}">
											<td>已付款</td>
										</c:if>
										<td><a title="取消訂單"
											href="<spring:url value='delorder?id=${orders.so_id}'/>"><i
												class="layui-icon">&#xe640;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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