<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div id="mainAdmin" class="mainAdmin">
		<table width="300">
				<tr>
					<td style="width: 300px;height: 300px;text-align: center;" colspan="2">
						<img style="width: expression(this.width>290&&this.width>this.height?290:this.width);height: expresion(this.height>290?290:this.height);" src="${requestScope.userInfo.url }"/>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;">用户帐号：${requestScope.userInfo.username }</td>				
				</tr>
				<tr>
					<td style="text-align: left;">用户昵称：${requestScope.userInfo.nickName }</td>
				</tr>
				<tr>
					<td style="text-align: left;">注册时间：${requestScope.userInfo.addTime }</td>
				</tr>
			</table>	
	</div>				
</div>
</body>
</html>