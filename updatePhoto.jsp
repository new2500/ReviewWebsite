<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hbu.david.cmc.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">
		<form action="" name="updatePhotoForm" method="post">
			<table width="600">
				<tr>
					<td style="width: 600px;height: 600px;text-align: center;" colspan="2">
						<img class="photoBig" src="${requestScope.photo.url }"/>
					</td>
				</tr>
				<input type="hidden" name="photoId" value="${requestScope.photo.id }"/>
				<tr>
					<td style="text-align: left;">商品名字：<input name="photoName" title="商品名字" value="${requestScope.photo.name }"></td>
					<td style="text-align: right;">上传时间：${requestScope.photo.addTime }</td>
				</tr>
				<tr>
					<td style="text-align: left;">
						所属分类：<select name="categoryId" title="所属分类">
							<option value="${requestScope.photo.category.id }">${requestScope.photo.category.name }</option>
							<c:forEach var="category" items="${requestScope.categoryList}">					
							<option value="${category.id }">${category.name }</option>
							</c:forEach>
						</select>
					</td>
					<td style="text-align: right;">浏览次数：${requestScope.photo.skimNum }</td>
				</tr>	
				<tr><td colspan="2" align="right"><input onclick="javascript:sendFormToServer('updatePhotoForm','UpdatePhotoServlet')" type="button" value="修改"/></td></tr>		
			</table>
		</form>		
	</div>					
</div>
</body>
</html>