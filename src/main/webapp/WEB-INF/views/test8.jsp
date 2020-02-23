<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<h1>Json格式測試</h1>
	<c:forEach var="cate1" items="produceBycate1">
		<tr>
			<td><input type="text" value="${cate1.sp_id}"></td>
			<td>${cate1.sp_name}</td>
			<td><input type="text" class="layui-input x-sort"
				value="${cate1.sp_price}"></td>
			<td><input type="text" class="layui-input" name="order"
				value="${cate1.sp_stock}"></td>
			<td><input type="checkbox" name="switch" lay-text="推薦|正常"
				checked="" lay-skin="switch"></td>
			<td><input type="checkbox" name="switch" lay-text="开启|停用"
				checked="" lay-skin="switch"></td>
			<td class="td-manage">
				<button class="layui-btn layui-btn layui-btn-xs"
					onclick="xadmin.open('编辑','admin-edit.html')">
					<i class="layui-icon">&#xe642;</i>编辑
				</button>
				<button class="layui-btn-danger layui-btn layui-btn-xs"
					onclick="member_del(this,'要删除的id')" href="javascript:;">
					<i class="layui-icon">&#xe640;</i>删除
				</button>
			</td>
		</tr>
	</c:forEach>
</body>

</html>
