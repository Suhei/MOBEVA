<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
<meta charset="utf-8">
<title>更新商品資料</title>
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
			<form:form class="layui-form" modelAttribute="ProductBean" enctype="multipart/form-data">


				<div class="layui-form-item">
					<form:label path="sp_id" class="layui-form-label">
						<span class="x-red"></span>商品編號
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" path="sp_id" class="layui-input"
							readonly="true" />
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>商品編號不能修改
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="sp_name" class="layui-form-label">
						<span class="x-red">*</span>商品名稱
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="productName" path="sp_name"
							required="" lay-verify="required" autocomplete="off"
							class="layui-input" />
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="sp_category" class="layui-form-label">
						<span class="x-red">*</span>商品類別
					</form:label>
					<div class="layui-input-inline">
						<form:select path="sp_category">
							<form:option value="1">配件</form:option>
							<form:option value="2">精品</form:option>
							<form:option value="3">改裝品</form:option>
						</form:select>
					</div>
				</div>


				<div class="layui-form-item">
					<form:label path="sp_price" class="layui-form-label">
						<span class="x-red">*</span>商品價格
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="productPrice" path="sp_price"
							required="" lay-verify="phone" autocomplete="off"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<form:label path="sp_stock" class="layui-form-label">
						<span class="x-red">*</span>庫存
					</form:label>
					<div class="layui-input-inline">
						<form:input type="text" id="productStock" path="sp_stock"
							required="" lay-verify="email" autocomplete="off"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<form:label path="sp_desc" class="layui-form-label">
						<span class="x-red">*</span>商品描述
					</form:label>
					<div class="layui-input-inline">
						<form:textarea rows="10" cols="50" id="sp_desc" path="sp_desc"
							required="" lay-verify="email" autocomplete="off"
							class="layui-input" />
					</div>
				</div>
				<div class="layui-form-item">
					<form:label path="uploadImg1" class="layui-form-label">
						<span class="x-red">*</span>產品圖片
					</form:label>
					<div class="layui-input-inline">
						<form:input type="file" name="uploadImg1" path="uploadImg1"
							class="layui-input" />
							<p>目前圖片
						<img src ="${ctx}/upload/images/${ProductBean.sp_img1}" width="225" height="225">
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="uploadImg2" class="layui-form-label">
						<span class="x-red">*</span>產品圖片2
					</form:label>
					<div class="layui-input-inline">
						<form:input type="file" name="uploadImg2" path="uploadImg2"
							class="layui-input" />
							<p>目前圖片
							<img src ="${ctx}/upload/images/${ProductBean.sp_img2}" width="225" height="225">
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="uploadImg3" class="layui-form-label">
						<span class="x-red">*</span>產品圖片3
					</form:label>
					<div class="layui-input-inline">
						<form:input type="file" name="uploadImg3" path="uploadImg3"
							class="layui-input" />
							<p>目前圖片
							<img src ="${ctx}/upload/images/${ProductBean.sp_img3}" width="225" height="225">
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="uploadintro" class="layui-form-label">
						<span class="x-red">*</span>產品介紹
					</form:label>
					<div class="layui-input-inline">
						<form:input type="file" name="uploadintro" path="uploadintro"
							class="layui-input" />
							<p>目前圖片
							<img src ="${ctx}/upload/images/${ProductBean.sp_intro}" width="225" height="225">
					</div>
				</div>
				<div class="layui-form-item">
					<form:label path="sp_recommend" class="layui-form-label">
						<span class="x-red">*</span>推薦商品
					</form:label>
					<div class="layui-input-inline">
						<form:select path="sp_recommend">
							<form:option value="0">正常</form:option>
							<form:option value="1">推薦</form:option>
						</form:select>
					</div>
				</div>

				<div class="layui-form-item">
					<form:label path="sp_status" class="layui-form-label">
						<span class="x-red">*</span>商品狀態
					</form:label>
					<div class="layui-input-inline">
						<form:select path="sp_status">
							<form:option value="1">上架</form:option>
							<form:option value="0">停售</form:option>
						</form:select>
					</div>

				</div>




				<div class="layui-form-item" style="display: none">
					<div class="layui-input-inline">
						<form:input type="hidden" path="sp_img1" />
						<form:input type="hidden" path="sp_img2" />
						<form:input type="hidden" path="sp_img3" />
						<form:input type="hidden" path="sp_intro" />
						<form:input type="hidden" path="sp_discount" />
						<form:input type="hidden" path="sp_modifieddate" />
						<form:input type="hidden" path="sp_createdate" />
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> </label> <input
						type="submit" value="修改商品" class="layui-btn">
				</div>
			</form:form>
		</div>
	</div>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定義驗證規則
			// 			form.verify({
			// 				nikename : function(value) {
			// 					if (value.length < 5) {
			// 						return '昵稱至少得5個字元啊';
			// 					}
			// 				},
			// 				pass : [ /(.+){6,12}$/, '密碼必須6到12位' ],
			// 				repass : function(value) {
			// 					if ($('#L_pass').val() != $('#L_repass').val()) {
			// 						return '兩次密碼不一致';
			// 					}
			// 				}
			// 			});

			// 			//監聽提交
			// 			form.on('submit(add)', function(data) {
			// 				console.log(data);
			// 				//發非同步，把數據提交給php
			// 				layer.alert("增加成功", {
			// 					icon : 6
			// 				}, function() {
			// 					//關閉目前frame
			// 					xadmin.close();

			// 					// 可以對父視窗進行重新整理 
			// 					xadmin.father_reload();
			// 				});
			// 				return false;
			// 			});

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
