<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/david.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加分类</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">
		<form onsubmit="return checkFormByName('addCategoryForm');" name="addCategoryForm" action="AddCategoryServlet" method="post">
			<table>
				<tr>
					<td>分类名字：</td><td style="text-align: left;"><input width="40" type="text" name="categoryName" title="分类名字"></td>
				</tr>
				<tr>
					<td>分类介绍：</td><td><textarea cols="40" rows="5" name="categoryIntroduce" title="分类介绍"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input id="submit" onclick="setButtonDisable()" type="submit" value="添加"/>&nbsp;&nbsp;<input id="reset" type="reset" value="重置"/></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>