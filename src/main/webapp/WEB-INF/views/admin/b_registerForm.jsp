<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
<meta charset="utf-8">
<title>新增員工</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<script type="text/javascript" src="${ctx}/admin/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<!-- 讓IE8/9支援媒體查詢，從而相容柵格 -->
<!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form:form class="layui-form" modelAttribute="RegisterAuthInfoBean">
				<div class="layui-form-item">
					<form:label path="a_account" class="layui-form-label">
						<span class="x-red">*</span>員工帳號
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="a_account" path="a_account"
							required="" lay-verify="required" autocomplete="off"
							class="layui-input" />
						<font color="red" size="2"><br>${ErrMsg}</font>
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
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="ag_type" class="layui-form-label">
						<span class="x-red">*</span>權限管理
					</form:label>
					<div class="layui-input-inline">
						<form:select path="ag_type">
							<form:option value="0">管理者</form:option>
							<form:option value="1">商城部門</form:option>
							<form:option value="2">會員部門</form:option>
							<form:option value="3">維修部門</form:option>
						</form:select>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> </label> <input
						type="submit" value="新增員工" class="layui-btn"> 
						<input	class="layui-btn" type="reset" value="重新填寫" />
				</div>
			</form:form>
		</div>
	</div>

	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定義驗證規則
			form.verify({
				nikename : function(value) {
					if (value.length < 5) {
						return '昵稱至少得5個字元啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密碼必須6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '兩次密碼不一致';
					}
				}
			});

			//監聽提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//發非同步，把數據提交給php
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					//關閉目前frame
					xadmin.close();

					// 可以對父視窗進行重新整理 
					xadmin.father_reload();
				});
				return false;
			});

		});
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
</body>

</html>
