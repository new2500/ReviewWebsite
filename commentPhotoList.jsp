<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论列表</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">
		<table width="750">			
			<c:choose>
				<c:when test="${empty requestScope.commentList}">
					<tr>
						<td style="text-align: left;" colspan="2">
							该照片还没有评论！
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="comment" items="${requestScope.commentList}">
						<tr>
							<td style="text-align: left;">作者大名：${comment.addUser}</td>
							<td style="text-align: right;width: 180px;">发表时间：${comment.addTime }</td>
						</tr>
						<tr>
							<td style="text-align: left;" colspan="2">
								${comment.content}
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>		
		</table>
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
								<a href="GetCommentsServlet?photoId=${requestScope.photoId }">首页</a>&nbsp;
							</c:when>
							<c:otherwise>
								<a>首页</a>
							</c:otherwise>
						</c:choose>
						
						<!-- Prep Page -->
						<c:choose>
							<c:when test="${currentPage>0}">
								<a href="GetCommentsServlet?currentPage=${currentPage-1 }&&photoId=${requestScope.photoId }">上一页</a>&nbsp;
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
								<a href="GetCommentsServlet?currentPage=${currentPage+1 }&&photoId=${requestScope.photoId }">下一页</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<!-- Last Page -->
						<c:choose>
							<c:when test="${(requestScope.pageNum)<=(currentPage+1)}">
								<a>末页</a>	
							</c:when>
							<c:otherwise>
								<a href="GetCommentsServlet?currentPage=${requestScope.pageNum-1}&&photoId=${requestScope.photoId }">末页</a>
							</c:otherwise>
						</c:choose>
					</dd>
				</dl>
			</form>		
		</div>
	<!-- 分页代码 end -->		
			<form onsubmit="return checkFormByName('pubComment');" name="pubComment" action="AddCommentServlet" method="post">
				<table width="730">
					<tr>
						<input type="hidden" name="photoId" value="${requestScope.photoId }" title="照片编号"/>
						<td align="left" style="width: 232px">作者大名：</td>
						<td style="text-align: left;">
							<c:choose>
								<c:when test="${empty sessionScope.userInfo}">
									<input type="text" size="100" name="addUser" title="作者大名" value="游客" readonly="readonly">
								</c:when>
								<c:otherwise>
									<input type="text" size="100" name="addUser" title="作者大名" value="${sessionScope.userInfo.nickName }" readonly="readonly">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea cols="90" rows="5" name="content" title="评论内容"></textarea>
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<input id="submit" type="button" onclick="sendFormToServer('pubComment','AddCommentServlet')" value="发布评论"/>
						</td>
					</tr>
				</table>
			</form>
	</div>					
</</div>
</body>
</html>