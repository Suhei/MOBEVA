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
	日期：
	<input type="text" id="datepicker" onchange="testAjax(this.value)">
	<br> 預約時段：
	<select id="selectedBox">
		<option selected disabled value="0">請選擇</option>
		<option value="1">10:00~12:00</option>
		<option value="2">12:00~14:00</option>
		<option value="3">14:00~16:00</option>
		<option value="4">16:00~18:00</option>
		<option value="5">18:00~20:00</option>
	</select>
</body>
<script>
	function testAjax(day) {
		$.ajax({
			type : "POST",
			url : "testStage",
			data : "mb_date=" + day,
			dataType : "text",
			error : function(xhr, status, error) {
				alert("進到error");
				alert(xhr.responseText);
			},
			success : function(data) {
				if (data == " ") {
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
				} else {
					var arr1 = new Array();
					arr1 = data.split(" ");
					//先移除目前選項的disabled
					$('#selectedBox option:disabled').removeAttr('disabled');
					//把選項請選擇加入disabled
					$('#selectedBox option[value="0"]').attr("disabled", true);
					//把被選到被時段，加上disabled
					for (let index = 0; index < arr1.length; index++) {
						$('#selectedBox option[value="' + arr1[index] + '"]').attr("disabled", true);
					}
				}
			}
		});
	};

	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});
</script>
</html>
