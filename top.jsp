<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top</title>
</head>
<body>
	<div class="top">	
		<img width="778" height="130" src="images/top.gif">
		<div class="menu">
			<div style="margin: 1px 1px 1px 1px;text-align: left;">
				<c:choose>
					<c:when test="${sessionScope.userInfo==null }">
						<table border="0" style="border-style: none;" width="770"><tr><td align="left">
						<span>您还没有【<a href="login.jsp">登录</a>】，欢迎您【<a href="login.jsp">登录</a>】或者【<a href="addUser.jsp">注册</a>】|【<a href="index.jsp">首页</a>】</span>
						</td></tr>
						<tr>
				
						</tr>
						</table>
						
					</c:when>
					<c:otherwise>
					<table border="0" style="border-style: none;" width="770">
					<tr>
						<td align="left">
							欢迎您，${sessionScope.userInfo.nickName }!&nbsp;<span>【<a href="LogoutServlet">注销</a>】</span>
						</td>
						<td align="right">
							<span><a href="index.jsp">首页</a></span>
							<span><a href="GetDefaultInfo?userId=${sessionScope.userInfo.id }">我的主页</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GetUserInfoServlet?userId=${sessionScope.userInfo.id }">个人信息</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GotoAddCategory">添加分类</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GotoAddPhoto">添加商品</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GetCategoriesServlet">分类管理</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GetPhotosServlet?userId=${sessionScope.userInfo.id}">商品管理</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GetCommentAdminServlet">评论管理</a></span>&nbsp;&nbsp;&nbsp;
							<span><a href="GotoChangePasswordServlet">修改密码</a></span>	
						</td>
					</tr>
					<tr>
						<td colspan=2><font color=blue size=4>make by:<font color=red>黄俊智</font>   </td>
						</tr>
					</table>			
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
</body>
</html>