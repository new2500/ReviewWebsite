<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类列表</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">
		<c:forEach var="category" items="${requestScope.categoryList}">
			<table style="width: 750px">
			<tr height="30">
				<td rowspan="2" style="width: 80px;height: 80px;text-align: center;">
					<span><a href="GetPhotosServlet?categoryId=${category.id }"><img class="categoryImg" src="${category.url }"></a></span>
				</td>
				<td style="width: 400px;text-align: left;"><span><a href="GetPhotosServlet?categoryId=${category.id }">${category.name}【${category.photoNum }张商品】</a></span></td>
				<td style="text-align: right; width: 121px">${category.addTime }</td>
				<td style="width: 77px"><a href="GotoAddCategory">添加分类</a></td>
			</tr>
			<tr height="50" style="width: 524px">
				<td style="width: 500px;text-align: left;" colspan="2">${category.introduce}</td>
				<td style="width: 77px"><a onclick="return isDelete();" href="javascript:sendMessageToServer('DeleteCategoryServlet','id=${category.id }')">删除分类</a><br/><a href="GotoUpdateCategoryServlet?categoryId=${category.id }">修改分类</a></td>
			</tr>
		</table>
		</c:forEach>		
		<!-- 分页代码 start -->		
		<c:set var="currentPage" value="${requestScope.currentPage}"></c:set>
	
		<div class="page">
			<form action="GetCategoriesServlet" name="pageForm" method="post">
				<dl>
					<dd style="text-align: right;font-size: 12px;color: #666633;">
						
						当前有${allNum }条记录，共${requestScope.pageNum}页，每页${requestScope.num }条记录，当前为第${pageNum }页，有${requestScope.itemNum }条记录。
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- First Page -->
						<c:choose>
							<c:when test="${currentPage>0}">
								<a href="GetCategoriesServlet">首页</a>&nbsp;
							</c:when>
							<c:otherwise>
								<a>首页</a>
							</c:otherwise>
						</c:choose>
						
						<!-- Prep Page -->
						<c:choose>
							<c:when test="${currentPage>0}">
								<a href="GetCategoriesServlet?currentPage=${currentPage-1 }">上一页</a>&nbsp;
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
								<a href="GetCategoriesServlet?currentPage=${currentPage+1 }">下一页</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<!-- Last Page -->
						<c:choose>
							<c:when test="${(requestScope.pageNum)<=(currentPage+1)}">
								<a>末页</a>	
							</c:when>
							<c:otherwise>
								<a href="GetCategoriesServlet?currentPage=${requestScope.pageNum-1}">末页</a>
							</c:otherwise>
						</c:choose>
					</dd>
				</dl>
			</form>		
		</div>
	<!-- 分页代码 end -->		
	</div>					
</div>
</body>
</html>