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
<style>
table, th, td {
	border: 10px solid white;
}
</style>
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
					<div class="layui-card-body">
						<form method="POST" action="updateuser">
							<table>
								<tr>
									<td style="width: 300px;"><h1>會員ID:</h1></td>
									<td><h1>${user.u_id}</h1></td>
									<input type="hidden" value="${user.u_id}" name="u_id">
								</tr>
								<tr>
									<td><h1>帳號:</h1></td>
									<td><h1>${user.u_account}</h1></td>
								</tr>
								<tr>
									<td><h1>openID:</h1></td>
									<td><h1>${user.u_openid}</h1></td>
								</tr>
								<tr>
									<td><h1>姓名:</h1></td>
									<td><h1>
											<input type="text" value="${user.u_name}" name="u_name"
												style="width: 600px;">
										</h1></td>
								</tr>
								<tr>
									<td><h1>身分證:</h1></td>
									<td><h1>${user.u_idcard}</h1></td>
								</tr>
								<tr>
									<td><h1>email:</h1></td>
									<td><h1>
											<input type="text" value="${user.u_email}" name="u_email"
												style="width: 600px;">
										</h1></td>
								</tr>
								<tr>
									<td><h1>電話:</h1></td>
									<td><h1>
											<input type="text" value="${user.u_mobile}" name="u_mobile"
												style="width: 600px;">
										</h1></td>
								</tr>
								<tr>
									<td><h1>地址</h1></td>
									<td><h1>
											<input type="text" value="${user.u_address}" name="u_address"
												style="width: 600px;">
										</h1></td>
								</tr>
								<tr>
									<td><h1>黑名單時間:</h1></td>
									<td><h1>
											<input type="text" value="${user.u_block}" name="u_block"
												style="width: 600px; background: #CCCCCC;"
												readonly="readonly">
										</h1>
								</tr>
								<tr>
									<td><h1>建立時間:</h1></td>
									<td><h1>${user.u_createdate}</h1></td>
								</tr>
								<tr>
									<td><h1>修改時間:</h1></td>
									<td><h1>${user.u_modifieddate}</h1></td>
								</tr>
								<tr>
									<td><h1>使用狀況:</h1></td>
									<td><h1>
											<input type="text" value="${user.u_status}" name="u_status"
												style="width: 600px;">
										</h1></td>
								</tr>
								<tr>
									<td><h1>最後登入時間:</h1></td>
									<td><h1>${user.u_lastlogin}</h1></td>
								</tr>
								<tr>
									<td>
										<button type="submit" class="layui-btn layui-btn-danger">更新會員資料</button>
										<div style="cursor: pointe" class="layui-btn layui-btn-danger"
											onclick="javascript:location.href='<spring:url value='unlockblock?id=${user.u_id}' />'">
											解鎖黑名單</div>
										<div style="cursor: pointe" class="layui-btn layui-btn-danger"
											onclick="javascript:location.href='<spring:url value='selectloginlist?id=${user.u_id}' />'">
											會員登入資訊</div>
									</td>
									<!-- 									<td><h1> -->
									<!-- 											<button type="submit" class="layui-btn layui-btn-danger" -->
									<!-- 												name="onblock" value="1">解鎖黑名單</button> -->
									<!-- 										</h1></td> -->
								</tr>
							</table>
						</form>
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