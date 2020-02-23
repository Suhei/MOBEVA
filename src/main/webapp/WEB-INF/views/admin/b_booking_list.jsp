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
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<script src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>

<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首頁</a> <a href="">預約管理</a>
			<a> <cite>預約列表</cite></a>
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
					<div style="text-align: right;">
						<form method="GET" action="${ctx}/test">
							<a>
								<button style="margin-right: 30px;" >新增預約</button>
							</a>
						</form>
					</div>
					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th>預約單號</th>
									<th>會員ID</th>
									<th>姓名</th>
									<th>電話</th>
									<th>車牌號碼</th>
									<th>預約方案</th>
									<th>預約廠區</th>
									<th>預約日期</th>
									<th>預約時段</th>
									<th>建立時間</th>
									<th>修改時間</th>
									<th>預約狀況</th>
									<th></th>
									<th></th>
							</thead>
							<tbody>

								<c:forEach var='booking' items='${m_booking}'>
									<tr>
										<td>${booking.mb_id}</td>
										<td>${booking.userInfoBean.u_id}</td>
										<td>${booking.userInfoBean.u_account}</td>
										<td>${booking.userInfoBean.u_mobile}</td>
										<td>${booking.userCarBean.uc_number}</td>
										<td>${booking.maintainInfoBean.mi_name}</td>
										<td>${booking.maintainStationBean.ms_name}</td>
										<td>${booking.mb_date}</td>
										<td>${booking.mb_stage}</td>
										<td>${booking.mb_createdate}</td>
										<td>${booking.mb_modifieddate}</td>
										<c:if test="${booking.mb_status==1}">
											<th>預約中</th>
										</c:if>
										<c:if test="${booking.mb_status==0}">
											<th>已取消</th>
										</c:if>
										<c:if test="${booking.mb_status==2}">
											<th>保養完成</th>
										</c:if>

										<td class="td-manage">
											<form method="GET" action="${ctx}/updatetest">
												<c:if test="${booking.mb_status==1}">
													<input type='hidden' name="mb_id" value="${booking.mb_id}" />
													<input type='hidden' name="u_id"  value="${booking.userInfoBean.u_id}" />
													<a title="修改" style="margin-left: 20px;">
														<button type="submit">修改</button>
													</a>
												</c:if>
											</form>
											<form method="POST" action="${ctx}/updatestatus" onSubmit="return confirm('確定取消預約?') ">
												<c:if test="${booking.mb_status==1}">
													<th><input type='hidden' name="mb_id" value="${booking.mb_id}" /> 
													<input type="hidden" name='mb_status' value='${booking.mb_status}' /> 
													<a title="取消" style="margin-left: 20px;">
														<input type="submit" value="取消預約"/>
													</a>
													</th>
												</c:if>
												<c:if test="${booking.mb_status==0}">
													<th><a title="已取消" style="margin-left: 20px;">
															<button disabled>已取消</button>
													</a></th>
												</c:if>
												<c:if test="${booking.mb_status==2}">
													<th><a title="已保養" style="margin-left: 20px;">
															<button disabled>已保養</button>
													</a></th>
												</c:if>
											</form>
									</tr>
								</c:forEach>
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