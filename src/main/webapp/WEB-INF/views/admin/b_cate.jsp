<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
<meta charset="utf-8">
<title>ShopProducts</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<!-- 讓IE8/9支援媒體查詢，從而相容柵格 -->
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>


<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i>
		</a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<!-- 						<form class="layui-form layui-col-space5"> -->
						<!-- 							<div class="layui-input-inline layui-show-xs-block"> -->
						<!-- 								<input class="layui-input" placeholder="分类名" name="cate_name"> -->
						<!-- 							</div> -->
						<!-- 							<div class="layui-input-inline layui-show-xs-block"> -->
						<!-- 								<button class="layui-btn" lay-submit="" lay-filter="sreach"> -->
						<!-- 									<i class="layui-icon"></i>增加 -->
						<!-- 								</button> -->
						<!-- 							</div> -->
						<!-- 						</form> -->
						<hr>
						<!-- 						<blockquote class="layui-elem-quote"> -->
						<!-- 							每个tr 上有两个属性 cate-id='1' 当前分类id fid='0' 父级id ,顶级分类为 0，有子分类的前面加收缩图标<i -->
						<!-- 								class="layui-icon x-show" status='true'>&#xe623;</i> -->
						<!-- 						</blockquote> -->
					</div>

					<div class="layui-card-header">
						<a href="${ctx}/admin/product/add_product"><button
								class="layui-btn layui-btn-danger">
								<i class="layui-icon"></i>新增商品
							</button></a>
					</div>

					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th width="70">商品ID</th>
									<th width="250">商品名稱</th>
									<th width="50">商品價格</th>
									<th width="50">庫存數量</th>
									<th width="80">推薦商品</th>
									<th width="80">上架狀態</th>
									<th width="250">操作</th>
							</thead>
							<tbody class="x-cate">
								<tr cate-id='1' fid='0'>
									<td><i class="layui-icon x-show" status='true'>&#xe623;</i>
										配件</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<c:forEach var="cate1" items="${produceBycate1}">
									<tr cate-id='100' fid='1'>
										<td>${cate1.sp_id}</td>
										<td>${cate1.sp_name}</td>
										<td><input type="text" class="layui-input x-sort"
											name="sp_price" value="${cate1.sp_price}" disabled></td>
										<td><input type="text" class="layui-input"
											name="sp_stock" value="${cate1.sp_stock}" disabled></td>

										<c:if test="${cate1.sp_recommend == 1}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate1.sp_recommend == 0}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" lay-skin="switch" disabled></td>
										</c:if>


										<c:if test="${cate1.sp_status == 1}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate1.sp_status == 0}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" lay-skin="switch" disabled></td>
										</c:if>



										<td class="td-manage"><a
											href="${ctx}/admin/product/update?id=${cate1.sp_id}">
												<button class="layui-btn layui-btn layui-btn-xs">
													<i class="layui-icon">&#xe642;</i>更新
												</button>
										</a>
											<button class="layui-btn-danger layui-btn layui-btn-xs"
												onclick="member_del(${cate1.sp_id})" href="javascript:;">
												<i class="layui-icon">&#xe640;</i>停售
											</button></td>
									</tr>
								</c:forEach>

								<tr cate-id='2' fid='0'>
									<td><i class="layui-icon x-show" status='true'>&#xe623;</i>精品
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<c:forEach var="cate2" items="${produceBycate2}">
									<tr cate-id='200' fid='2'>
										<td>${cate2.sp_id}</td>
										<td>${cate2.sp_name}</td>
										<td><input type="text" class="layui-input x-sort"
											name="sp_price" value="${cate2.sp_price}" disabled></td>
										<td><input type="text" class="layui-input"
											name="sp_stock" value="${cate2.sp_stock}" disabled></td>

										<c:if test="${cate2.sp_recommend == 1}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate2.sp_recommend == 0}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" lay-skin="switch" disabled></td>
										</c:if>


										<c:if test="${cate2.sp_status == 1}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate2.sp_status == 0}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" lay-skin="switch" disabled></td>
										</c:if>



										<td class="td-manage"><a
											href="${ctx}/admin/product/update?id=${cate2.sp_id}">
												<button class="layui-btn layui-btn layui-btn-xs">
													<i class="layui-icon">&#xe642;</i>更新
												</button>
										</a>
											<button class="layui-btn-danger layui-btn layui-btn-xs"
												onclick="member_del(${cate2.sp_id})" href="javascript:;">
												<i class="layui-icon">&#xe640;</i>停售
											</button></td>
									</tr>
								</c:forEach>


								<tr cate-id='3' fid='0'>
									<td><i class="layui-icon x-show" status='true'>&#xe623;</i>改裝品
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>

								<c:forEach var="cate3" items="${produceBycate3}">
									<tr cate-id='300' fid='3'>
										<td>${cate3.sp_id}</td>
										<td>${cate3.sp_name}</td>
										<td><input type="text" class="layui-input x-sort"
											name="sp_price" value="${cate3.sp_price}" disabled></td>
										<td><input type="text" class="layui-input"
											name="sp_stock" value="${cate3.sp_stock}" disabled></td>

										<c:if test="${cate3.sp_recommend == 1}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate3.sp_recommend == 0}">
											<td><input type="checkbox" name="sp_recommend"
												lay-text="推薦|正常" lay-skin="switch" disabled></td>
										</c:if>


										<c:if test="${cate3.sp_status == 1}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" checked="checked" lay-skin="switch"
												disabled></td>
										</c:if>
										<c:if test="${cate3.sp_status == 0}">
											<td><input type="checkbox" name="sp_status"
												lay-text="上架|停售" lay-skin="switch" disabled></td>
										</c:if>



										<td class="td-manage"><a
											href="${ctx}/admin/product/update?id=${cate3.sp_id}">
												<button class="layui-btn layui-btn layui-btn-xs">
													<i class="layui-icon">&#xe642;</i>更新
												</button>
										</a>
											<button class="layui-btn-danger layui-btn layui-btn-xs"
												onclick="member_del(${cate3.sp_id})" href="javascript:;">
												<i class="layui-icon">&#xe640;</i>停售
											</button></td>
									</tr>
								</c:forEach>



							</tbody>
						</table>
					</div>
					<!-- 					<div class="layui-card-body "> -->
					<!-- 						<div class="page"> -->
					<!-- 							<div> -->
					<!-- 								<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> -->
					<!-- 								<span class="current">2</span> <a class="num" href="">3</a> <a -->
					<!-- 									class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
	<script>
		//批量刪除
// 		function delAll() {
// 			//name="cboxSelected" class="testcbox"
// 			// console.log($("input:[name='cboxSelected']").val());
// 			// $("input:[name='cboxSelected']").val()
// 			// $('input:checkbox').each(function () {
// 			$("input:checkbox [class='testcbox']").each(function() {
// 				console.log($(this).val());
// 				if ($(this).attr('checked') == true) {
// 					alert($(this).val());
// 				}
// 			});
// 		}

		layui.use([ 'form' ], function() {
			form = layui.form;

		});

		/*用户-删除*/		
		function member_del(spid) {
			layer.confirm('確定要停售嗎？', function() {			
				$.ajax({
					type:"POST",
					url:"product/del_product",
					data:"sp_id=" + spid,
					dataType:"text",
					error:function(xhr, status, error){
						alert("進到error");
						alert(xhr.responseText);
					},
					success:function(data){
						alert("已停售");
						location.reload(true);
					}
				})
			})
		}

				//发异步删除数据
// 				$(obj).parents("tr").remove();
// 				layer.msg('已删除!', {
// 					icon : 1,
// 					time : 1000
				
// 				});

// 								layer.msg('已删除!', {
// 							icon : 1,
// 							time : 1000
// 						})

		// 分类展开收起的分类的逻辑
		// 
		$(function() {
			$("tbody.x-cate tr[fid!='0']").hide();
			// 栏目多级显示效果
			$('.x-show').click(
					function() {
						if ($(this).attr('status') == 'true') {
							$(this).html('&#xe625;');
							$(this).attr('status', 'false');
							cateId = $(this).parents('tr').attr('cate-id');
							$("tbody tr[fid=" + cateId + "]").show();
						} else {
							cateIds = [];
							$(this).html('&#xe623;');
							$(this).attr('status', 'true');
							cateId = $(this).parents('tr').attr('cate-id');
							getCateId(cateId);
							for ( var i in cateIds) {
								$("tbody tr[cate-id=" + cateIds[i] + "]")
										.hide().find('.x-show')
										.html('&#xe623;')
										.attr('status', 'true');
							}
						}
					})
		})

		var cateIds = [];
		function getCateId(cateId) {
			$("tbody tr[fid=" + cateId + "]").each(function(index, el) {
				id = $(el).attr('cate-id');
				cateIds.push(id);
				getCateId(id);
			});
		}
	</script>
</body>

</html>