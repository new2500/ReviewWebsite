<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div id="mainAdmin" class="mainAdmin">
		<div style="float: left;">
		<c:forEach var="photo" items="${requestScope.photoList}">
			<table style="width: 750px">
			<tr height="30">
				<td rowspan="2" style="width: 60px;height: 60px;text-align: center;">
					<a href="GetPhotoServlet?photoId=${photo.id }"><img class="categoryImg" src="${photo.url }"></a>
				</td>
				<td style="width: 350px;text-align: left;">${photo.name }</td>
				<td style="text-align: right;">${photo.addTime }</td>
				<td style="width: 60px"><a href="GotoAddPhoto">添加商品</a></td>
			</tr>
			<tr height="30" style="width: 524px">
				<td style="width: 450px;text-align: left;">
				<span>所属类别：<a href="GetPhotosServlet?categoryId=${photo.categoryId }">${photo.category.name}</a></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td style="text-align: right; width: 157px"><a style="text-align: right;" href="javascript:sendMessageToServer('UpdateCategoryUrlServlet','categoryId=${photo.categoryId}&&id=${photo.id }')">将该商品设置为该类别代表</a></td>
				<td style="width: 60px"><a onclick="return isDelete();" href="javascript:sendMessageToServer('DeletePhotoServlet','photoId=${photo.id }')">删除商品</a><br/><a href="GotoUpdatePhotoServlet?photoId=${photo.id }">修改商品</a></td>
			</tr>
		</table>
		</c:forEach>		
		<!-- 分页代码 start -->
		
		<c:set var="currentPage" value="${requestScope.currentPage}"></c:set>
	
		<div class="page">
			<form action="GetCategoriesServlet" name="pageForm" method="post">
				<dl>
				<dd style="text-align: right;font-size: 12px;color: #666633;">
					
					当前有${requestScope.allNum }条记录，共${requestScope.pageNum}页，每页${requestScope.num }条记录

，当前为第${pageNum }页，有${requestScope.itemNum }条记录。
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- First Page -->
					<c:choose>
						<c:when test="${currentPage>0}">
							<a href="GetPhotosServlet?userId=${sessionScope.userInfo.id }">首页</a>&nbsp;
						</c:when>
						<c:otherwise>
							<a>首页</a>
						</c:otherwise>
					</c:choose>
					
					<!-- Prep Page -->
					<c:choose>
						<c:when test="${currentPage>0}">
							<a href="GetPhotosServlet?currentPage=${currentPage-1 }&&userId=${sessionScope.userInfo.id }">上一页</a>&nbsp;
						</c:when>
						<c:otherwise>
							<a>上一页</a>
						</c:otherwise>
					</c:choose>	
					<!-- Next Page -->
					<c:choose>					
						<c:when test="${(requestScope.pageNum)<=(currentPage+1)}">
							<a>下一页</a>	
						</c:when>
						<c:otherwise>
							<a href="GetPhotosServlet?currentPage=${currentPage+1 }&&userId=${sessionScope.userInfo.id }">下一页</a>&nbsp;
						</c:otherwise>
					</c:choose>
					<!-- Last Page -->
					<c:choose>
						<c:when test="${(requestScope.pageNum)<=(currentPage+1)}">
							<a>末页</a>	
						</c:when>
						<c:otherwise>
							<a href="GetPhotosServlet?currentPage=${requestScope.pageNum-1}&&userId=${sessionScope.userInfo.id }">末页</a>
						</c:otherwise>
					</c:choose>
				</dd>
				</dl>
			</form>	
		</div>	
		</div>
	<!-- 分页代码 end -->	
		
	</div>					
</div>
</body>
</html>