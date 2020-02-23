<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>員工列表</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<script src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="x-nav">
		<a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="重新整理"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i></a>
	</div>
	
	<div class="layui-card-header">
		<a href="${ctx}/admin/registerForm"><button
				class="layui-btn layui-btn-danger">
				<i class="layui-icon"></i>新增員工
			</button></a>
	</div>
	
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body "></div>
					<h1 style="text-align: center;">員工列表</h1>
					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>員工ID</th>
									<th>帳號</th>
									<th>密碼</th>
									<th>email</th>
									<th>權限</th>
									<th>帳號狀況</th>
									<th>登入IP</th>
									<th>黑名單時間</th>
									<th>建立時間</th>
									<th>操作</th>
							</thead>
							<tbody>
								<c:forEach var='auth' items='${Authinfos}'>
									<tr>
										<td>${auth.a_id}</td>
										<td>${auth.a_account}</td>
										<td>${auth.a_password}</td>
										<td>${auth.a_email}</td>
										<c:if test="${auth.ag_type==0}">
											<th>管理者</th>
										</c:if>
										<c:if test="${auth.ag_type==1}">
											<th>商城部門</th>
										</c:if>
										<c:if test="${auth.ag_type==2}">
											<th>會員部門</th>
										</c:if>
										<c:if test="${auth.ag_type==3}">
											<th>維修部門</th>
										</c:if>
										<c:if test="${auth.a_status==1}">
											<th>正常</th>
										</c:if>
										<c:if test="${auth.a_status==0}">
											<th>註銷</th>
										</c:if>
										<td>${auth.a_ip}</td>
										<td>${auth.a_block}</td>
										<td>${auth.a_createdate}</td>


										<td class="td-manage"><a title="編輯"
											href="<spring:url value='/admin/auth_detail?id=${auth.a_id}'/>">

												<i class="layui-icon">&#xe642;</i>
										</a> <a title="刪除"
											href="<spring:url value='/admin/auth_del?id=${auth.a_id}'/>"><i
												class="layui-icon">&#xe640;</i> </a></td>
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