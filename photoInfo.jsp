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
		<table width="600">
			<tr>
				<td style="width: 600px;height: 600px;text-align: center;" colspan="2">
					<img class="photoBig" src="${requestScope.photoInfo.url }"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;">商品名字：${requestScope.photoInfo.name }</td>
				<td style="text-align: right;">上传时间：${requestScope.photoInfo.addTime }</td>
			</tr>
			<tr>
				<td style="text-align: left;">所属分类：${requestScope.photoInfo.category.name }</td>
				<td style="text-align: right;">浏览次数：${requestScope.photoInfo.skimNum }</td>
			</tr>
			<tr>
				<td style="text-align: left;" colspan="2">
						关于该商品的评论，只显示最新的5条，点击此处【<a href="GetCommentsServlet?photoId=${requestScope.photoInfo.id }">查看更多</a>】
				</td>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.photoInfo.arrayComment}">
					<tr>
						<td style="text-align: left;" colspan="2">
							该商品还没有评论！
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="comment" items="${requestScope.photoInfo.arrayComment}">
						<tr>
							<td style="text-align: left;">作者大名：${comment.addUser}</td>
							<td style="text-align: right;">发表时间：${comment.addTime }</td>
						</tr>
						<tr>
							<td style="text-align: left;" colspan="2">
								${comment.content}
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="2">
					<form onsubmit="return checkFormByName('pubComment');" name="pubComment" action="AddCommentServlet" method="post">
						<table width="600">
							<tr>
								<input type="hidden" name="photoId" value="${requestScope.photoInfo.id }" title="商品编号"/>
								<td align="left" style="width: 123px">作者大名：</td>
								<td style="text-align: left;">
									<c:choose>
										<c:when test="${empty sessionScope.userInfo}">
											<input type="text" size="80" name="addUser" title="作者大名" value="游客" readonly="readonly">
										</c:when>
										<c:otherwise>
											<input type="text" size="80" name="addUser" title="作者大名" value="${sessionScope.userInfo.nickName }" readonly="readonly">
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea cols="73" rows="5" name="content" title="评论内容"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<input id="submit" type="button" onclick="sendFormToServer('pubComment','AddCommentServlet')" value="发布评论"/>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>		
	</div>					
</div>
</body>
</html>