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
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<script src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<style>
table, th, td {
	border: 10px solid white;
}
</style>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row">

			<form:form class="layui-form" modelAttribute="authinfo">
				<div class="layui-form-item">
					<form:label path="a_account" class="layui-form-label">
						<span class="x-red">*</span>員工帳號
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="a_account" path="a_account"
							required="" lay-verify="required" autocomplete="off"
							class="layui-input" readonly="true" />
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="a_password" class="layui-form-label">
						<span class="x-red">*</span>密碼
					</form:label>
					<div class="layui-input-inline">
						<form:input type="password" id="a_password" path="a_password"
							required="" lay-verify="pass" autocomplete="off"
							class="layui-input" />
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="a_email" class="layui-form-label">
						<span class="x-red">*</span>信箱
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="a_email" path="a_email" required=""
							lay-verify="email" autocomplete="off" class="layui-input" />
					</div>
				</div>

				<div class="layui-form-item">
					<!-- 					<div class="layui-input-block"> -->
					<form:label path="ag_type" class="layui-form-label">
						<span class="x-red">*</span>權限管理
					</form:label>
					<div class="layui-input-inline">
					<c:if test="${authinfo.ag_type == 1}" >
					<form:input type="text" path="ag_type" class="layui-input" readonly="true"/>商城部門
					</c:if>
					<c:if test="${authinfo.ag_type == 2}" >
					<form:input type="hidden" path="ag_type" class="layui-input" readonly="true" />
					<input class="layui-input" readonly value="會員部門">
					</c:if>					
					<c:if test="${authinfo.ag_type == 3}" >
					<form:input type="text" path="ag_type" class="layui-input" readonly="true"/>維修部門
					</c:if>	
						
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="a_status" class="layui-form-label">
						<span class="x-red">*</span>帳號狀態
					</form:label>
					<div class="layui-input-inline">

						<c:if test="${authinfo.a_status == 0}" >
						<form:input type="hidden" path="a_status" class="layui-input" readonly="true"/>
						<input class="layui-input" readonly value="註銷">
						</c:if>	
						
						<c:if test="${authinfo.a_status == 1}" >
						<form:input type="hidden" path="a_status" class="layui-input" readonly="true"/>
						<input class="layui-input" readonly value="正常">
						</c:if>	

					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="a_createdate" class="layui-form-label">
						<span class="x-red">*</span>建立時間
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" path="a_createdate" class="layui-input"
							readonly="true" />
					</div>
				</div>

				<div class="layui-form-item" style="display: none;">
					<div class="layui-input-inline">
						<form:input type="hidden" path="a_id" />
						<form:input type="hidden" path="a_block" />
						<form:input type="hidden" path="a_ip" />
						<form:input type="hidden" path="a_modifieddate" />
					</div>
				</div>


				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> </label> <input
						type="submit" value="修改資料" class="layui-btn">
				</div>
			</form:form>
			
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
	window.onload = (function() {
		var flag = ${MsgSuccess};
		if( flag == true){
			alert("修改成功");
		}
		});


	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</html>