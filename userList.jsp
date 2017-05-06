<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>


<f:view><div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div><div id="main" class="main">
	<div class="mainAdmin">
		<c:forEach var="userInfo" items="${requestScope.userList}">
			<div class="category">					
				<div style="width: 115px;height: 125px; border-width: 0px;border-style: solid;border-color: #666633;"><a href="GetDefaultInfo?userId=${userInfo.id }"><img class="categoryPhoto" src="${userInfo.url }"></a></div>
				<hr>
				<div style="width: 115px;height: 20px; border-width: 0px;border-style: solid;border-color: #666633;font-size: 14px;color: #666633;"><a href="GetDefaultInfo?userId=${userInfo.id }">${userInfo.nickName }</a></div>
			</div>	
		</c:forEach>		
	</div>					
</div></f:view></body>
</html>