<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/david.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
</head>
<body>
<div id="top"><jsp:include page="top.jsp"></jsp:include></div>
<div id="main" class="main">
<div class="mainAdmin">
<form onsubmit="return checkFormByName('addPhotoForm');" name="addPhotoForm" action="AddPhotoServlet" method="post"
	enctype="multipart/form-data">
<table>
	<tr>
		<td>上传商品：</td>
		<td align="left"><input type="file" name="photoUrl" title="上传商品"></td>
	</tr>
	<tr>
		<td>商品名字：</td>
		<td align="left"><input type="text" name="photoName" value="未命名" title="商品名字"></td>
	</tr>
	<tr>
		<td>所属分类：</td>
		<td align="left">
			<select name="categoryId" title="所属分类">
				<option value="">--所属分类--</option>
				<c:forEach var="category" items="${requestScope.categoryList}">					
					<option value="${category.id }">${category.name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input id="submit" type="submit" value="上传" />&nbsp;&nbsp;<input
			id="reset" type="reset" value="重置" /></td>
	</tr>
</table>
</form>
</div>
</div>
</body>
</html>