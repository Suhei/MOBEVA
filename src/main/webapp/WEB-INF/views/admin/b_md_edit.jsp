<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>保養單號修改</title>
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
						<div>
							<input type="button"> <a
								href="<spring:url value='/admin/b_md_add?mb_id=${Orderlist_mb_id}'/>">新增</a>
						</div>
						<table class="layui-table layui-form">
							<thead>
								<tr>
<!-- 									<th>保養明細</th> -->
									<th>承攬人員</th>
									<th>零件編號</th>
									<th>零件名稱</th>
									<th>零件數量</th>
									<th>維修工時</th>
									<th>建立日期</th>
									<th>備註</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='m_detail' items='${m_details}'>
									<%-- 								<form method="POST" action="${ctx}/m_detail_edit"> --%>
									<%--form:form  @ModelAttribute("md_Bean") --%>
									<form:form method="POST" modelAttribute="md_Bean">
										<tr>
											<!-- 										<td> -->
											<%--<input type='hidden' name='md_id' 	value="${m_detail.md_id}"> ${m_detail.md_id}--%>
											<%-- 						||				 --%>
											<%--form:form 			 path='md_id'--> MaintainDetailsBean.md_id  value="${m_detail.md_id}" --%>
											<form:input type='hidden' path='md_id'
												value='${m_detail.md_id}' readonly="true" />
											<!-- 										</td> -->
											<td>${m_detail.authinfoBean.a_account}</td>
											<!-- 											<option value="0" selected="selected">請選擇</option> -->
											<%-- 												<c:forEach var="allusercar" items='${AllUserCar}'> --%>
											<%-- 													<option value='${allusercar.uc_id}'>${allusercar.uc_number}</option> --%>
											<%-- 												</c:forEach> --%>
											<!-- 											<option value="-1">新增車籍資料</option> -->


											<%-- 											<td><form:select class="form-control form-control-lg rounded-0" --%>
											<%-- 												path="maintainPartsBean.mp_id" required="required"> --%>
											<%-- 												<form:options items="${AllPartsList}" /> --%>
											<%-- 											</form:select></td> --%>

											<td><form:input type='text'
													path="maintainPartsBean.mp_id"
													value="${m_detail.maintainPartsBean.mp_id}" /></td>
<!-- 											<td><input type='text' -->
<%-- 												value="${m_detail.maintainPartsBean.mp_id}" /></td> --%>
											<td>${m_detail.maintainPartsBean.mp_name}</td>



											<td><form:input type='text' path='md_pcs'
													value='${m_detail.md_pcs}' /></td>
											<%-- 									<td><input type='text' value="${m_detail.md_pcs}"/></td> --%>
											<td>${m_detail.md_hours}</td>
											<td>${m_detail.md_createdate}</td>
											<c:if test="${m_order.mb_id >=1}">
												<th>使用中</th>
											</c:if>
											<c:if test="${m_order.mb_id==0}">
												<th>註銷</th>
											</c:if>

											<td class="td-manage">
												<!-- 										<a title="編輯" --> <%-- 											href="<spring:url value='b_md_detail'/>"> --%>

												<!-- 												<i class="layui-icon">&#xe642;</i> --> <!-- 										</a>  -->
												<!-- 										<a title="刪除" --> <%-- 											href="<spring:url value='deleteuser?id=${users.u_id}'/>"><i --%>
												<!-- 												class="layui-icon">&#xe640;</i> </a> --> <input
												type="submit" value="修改">
											</td>
										</tr>
										<div style="display: none">
											<form:input path="maintainBookingBean.mb_id"
												value="${m_detail.maintainBookingBean.mb_id}" />
											<form:input path="authinfoBean.a_id"
												value="${m_detail.authinfoBean.a_id}" />
											<form:input path="md_hours" value="${m_detail.md_hours}" />
											<form:input path="md_createdate"
												value="${m_detail.md_createdate}" />
											<form:input path="md_modifieddate"
												value="${m_detail.md_modifieddate}" />
										</div>
									</form:form>
									<%-- 									</form> --%>
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