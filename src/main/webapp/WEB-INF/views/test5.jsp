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
</head>
<body>
	<form:form modelAttribute="MaintainBookingBean">
	<fieldset>
		主鍵單號：<form:input type="text" path="mb_id"/> <br>
		預約狀態：<form:input type="text" path="mb_status"/><br>
		登入用戶名字：<form:input type="text" path="userInfoBean.u_name"/><br>
		登入用戶ID：<form:input type="text" path="userInfoBean.u_id"/><br>
		
		保養方案ID：<form:input type="text" path="maintainInfoBean.mi_id"/><br>
		保養車廠：<form:select path="maintainStationBean.ms_id">
			<form:options items="${StationList}"/>
		</form:select><br>
		車牌號碼：<form:input type="text" path="userCarBean.uc_number"/><br>
		車牌號碼ID：<form:input type="text" path="userCarBean.uc_id"/><br>
		保養時間：<form:input type="date" path="mb_date"/><br>
		預約時段：<form:input type="text" path="mb_stage"/><br>
		<input type="submit" value="submit" /><br>
	</fieldset>
	</form:form>
</body>
</html>
