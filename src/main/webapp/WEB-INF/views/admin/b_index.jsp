<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="x-admin-sm">
<head>
<meta charset="utf-8">
<title>MOBEVA後台登入系統</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${ctx}/admin/css/font.css">
<link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">
<link rel="stylesheet" href="${ctx}/admin/css/theme2508.min.css">
<script src="${ctx}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/admin/js/xadmin.js"></script>
<!-- 讓IE8/9支援媒體查詢，從而相容柵格 -->
<!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<script>
	// 是否開啟重新整理記憶tab功能
	var is_remember = false;
</script>
</head>
<body class="index">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<!-- 頂部開始 -->
	<div class="container">
		<div class="logo">
			<a href="./b_index">MOBEVA後台登入系統</a>
		</div>
		<div class="left_open">
			<a><i title="展開左側欄" class="iconfont">&#xe699;</i></a>
		</div>
		<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+新增</a>
				<dl class="layui-nav-child">
					<!-- 二級菜單 -->
					<dd>
						<a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
							<i class="iconfont">&#xe6a2;</i>彈出最大化
						</a>
					</dd>
					<dd>
						<a onclick="xadmin.open('彈出自動寬高','http://www.baidu.com')"> <i
							class="iconfont">&#xe6a8;</i>彈出自動寬高
						</a>
					</dd>
					<dd>
						<a onclick="xadmin.open('彈出指定寬高','http://www.baidu.com',500,300)">
							<i class="iconfont">&#xe6a8;</i>彈出指定寬高
						</a>
					</dd>
					<dd>
						<a onclick="xadmin.add_tab('在tab打開','member-list.html')"> <i
							class="iconfont">&#xe6b8;</i>在tab打開
						</a>
					</dd>
					<dd>
						<a onclick="xadmin.add_tab('在tab打開重新整理','member-del',true)"> <i
							class="iconfont">&#xe6b8;</i>在tab打開重新整理
						</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a>${b_loginuser.a_account}</a>
				<dl class="layui-nav-child">
					<!-- 二級菜單 -->
					<dd>
						<a href="<spring:url value='/admin/b_logout'/>">登出</a>
					</dd>
				</dl></li>
			<!-- 										<a -->
			<%-- 											onclick="javascript:location.href='<spring:url value='/logout' />'"><img --%>
			<!-- 											src="images/logout.png" class="img-fluid mx-1 mx-md-2" -->
			<!-- 											alt="logout Icon"></a> -->

		</ul>
	</div>
	<!-- 頂部結束 -->
	<!-- 中部開始 -->
	<!-- 左側菜單開始 -->
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<c:if test="${b_loginuser.ag_type == 2 || b_loginuser.ag_type == 0}">
					<li><a href="javascript:;"> <i
							class="iconfont left-nav-li" lay-tips="會員管理">&#xe6b8;</i> <cite>會員管理</cite>
							<i class="iconfont nav_right">&#xe697;</i></a>
						<ul class="sub-menu">
							<li><a
								onclick="xadmin.add_tab('會員列表','${ctx}/admin/b_user_list')">
									<i class="iconfont">&#xe6a7;</i> <cite>會員列表</cite>
							</a></li>
							<li><a
								onclick="xadmin.add_tab('登入資訊','${ctx}/admin/b_user_loginlist')">
									<i class="iconfont">&#xe6a7;</i> <cite>登入資訊</cite>
							</a></li>
						</ul></li>
				</c:if>
				<c:if test="${b_loginuser.ag_type == 3 || b_loginuser.ag_type == 0}">
					<li><a href="javascript:;"> <i
							class="iconfont left-nav-li" lay-tips="預約保修管理">&#xe6b8;</i> <cite>預約保修管理</cite>
							<i class="iconfont nav_right">&#xe697;</i></a>
						<ul class="sub-menu">
							<li><a
								onclick="xadmin.add_tab('預約列表','${ctx}/admin/b_booking_list')">
									<i class="iconfont">&#xe6a7;</i> <cite>預約列表</cite>
							</a></li>
							<li><a
								onclick="xadmin.add_tab('保養明細','${ctx}/admin/b_md_list')"> <i
									class="iconfont">&#xe6a7;</i> <cite>保修明細列表</cite></a></li>
							<li><a
								onclick="xadmin.add_tab('零件管理','${ctx}/admin/b_mp_list')"> <i
									class="iconfont">&#xe6a7;</i> <cite>零件管理</cite></a></li>
						</ul></li>
				</c:if>
				<c:if test="${b_loginuser.ag_type == 1 || b_loginuser.ag_type == 0}">
					<li><a href="javascript:;"> <i
							class="iconfont left-nav-li" lay-tips="商城管理">&#xe723;</i> <cite>商城管理</cite>
							<i class="iconfont nav_right">&#xe697;</i></a>
						<ul class="sub-menu">
							<li><a
								onclick="xadmin.add_tab('商品管理','${ctx}/admin/b_cate')"> <i
									class="iconfont">&#xe6a7;</i> <cite>商品管理</cite>
							</a></li>
							<li><a
								onclick="xadmin.add_tab('訂單管理','${ctx}/admin/b_order_list')">
									<i class="iconfont">&#xe6a7;</i> <cite>訂單管理</cite>
							</a></li>
						</ul></li>
				</c:if>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="管理員管理">&#xe726;</i> <cite>管理員管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<c:if test="${b_loginuser.ag_type == 0}">
							<li><a
								onclick="xadmin.add_tab('管理員列表','${ctx}/admin/b_authlist')">
									<i class="iconfont">&#xe6a7;</i> <cite>員工列表</cite>
							</a></li>
						</c:if>
						<c:if test="${b_loginuser.ag_type != 0}">
							<li><a
								onclick="xadmin.add_tab('管理員列表','${ctx}/admin/b_auth?id=${b_loginuser.a_id}')">
									<i class="iconfont">&#xe6a7;</i> <cite>帳號管理</cite>
							</a></li>
						</c:if>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- <div class="x-slide_left"></div> -->
	<!-- 左側菜單結束 -->
	<!-- 右側主體開始 -->
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
			</ul>
			<div class="layui-unselect layui-form-select layui-form-selected"
				id="tab_right">
				<dl>
					<dd data-type="this">關閉目前</dd>
					<dd data-type="other">關閉其它</dd>
					<dd data-type="all">關閉全部</dd>
				</dl>
			</div>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='./welcome' frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
			<div id="tab_show"></div>
		</div>
	</div>
	<div class="page-content-bg"></div>
	<style id="theme_style"></style>
	<!-- 右側主體結束 -->
	<!-- 中部結束 -->
	<script>
		//百度統計可去掉
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