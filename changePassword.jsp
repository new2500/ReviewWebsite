<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/david.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div id="mainAdmin" class="mainAdmin">
		<form onsubmit="return checkFormByName('changePassword');" method="post" action="ChangePasswordServlet" name="changePassword">
			<table class="categoryTable">
				<tr><td align="right">原密码：</td><td colspan="2" align="left"><input name="oncePassword" type="password" style="width: 150px" title="原密码"></td></tr>
				<tr><td align="right">新密码：</td><td colspan="2" align="left"><input name="password" type="password" style="width: 150px" title="新密码"></td></tr>
				<tr><td align="right">新密码确认：</td><td colspan="2" align="left"><input name="rePassword" type="password" style="width: 150px" title="确认新密码"></td></tr>
				<tr><td colspan="3" align="right"><input class="button" type="submit" value="修改"></td></tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>