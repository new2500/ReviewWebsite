<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*,java.util.*,javax.servlet.http.Cookie,java.net.*"%>
<%@ page import="javax.swing.*"%>

<%!
	String user_default ="";//默认用户名
%>



<%
	String user = request.getParameter("user");
	String password = request.getParameter("password");
	String input = request.getParameter("input");
	String remeber = request.getParameter("rememberuser");

	if(user!=null && password!=null)
	{
		//String user = URLEncoder.encode(user);
		session.setAttribute("user",user);
		session.setAttribute("password",password);
		session.setAttribute("input",input);
		session.setAttribute("remeber",remeber);

		String rand = (String)session.getAttribute("rand");


		String[] remeber_user =request.getParameterValues("remeberuser");
		if(remeber_user!=null)
		{
			String a = URLEncoder.encode(user,"UTF-8");
			Cookie usercookie=new Cookie("user",a);	//第一个user是命名 第二个代表request.getParameter("user");
			usercookie.setMaxAge(7*24*60*60);
			response.addCookie(usercookie);
		}

		if(input.equals(rand))//验证码正确
			response.sendRedirect("product.jsp");
		else
			//若验证码错误，弹出javascript提示
			%>
		<script language=javascript>
					alert("验证码错误！！");
		</script>
<%
	}
%>

<script language=javascript>
function checklogin()
{
	if (loginform.user.value=="")
	{
		alert("请输入用户名");
		loginform.user.focus();
		return false;
	}
	if (loginform.password.value=="")
	{
		alert("密码不能为空");
		loginform.password.focus();
		return false;
	}
}
</script>		
		

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">
		<form name="adminloginform" onsubmit="return checklogin()" action="login.jsp"method="post">
			<div id="center">
		      <div id="center_left"></div>
			  <div id="center_middle">
			       <div id="user">用户名
			         <input type="text" name="user" maxlength="10" value="<%=user_default%>" >
			       </div>
				   <div id="password">密&nbsp;&nbsp;码
				     <input type="password" name="password" maxlength="10"/>
				   </div>
				   <div id="code">验证码
				     <input type="test" name="input" maxlength="4"/>
				   </div>
					<div id="code2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img border="1" src="image.jsp" alt="" onClick="this.src='image.jsp?'+Math.random()">
					</div>
				
					<div class="checkbox">
						<input type="checkbox" name="remeberuser" value="remeber">
						<span>记住用户名</span>
					</div><br>

					<div id="btn"><input type="button" value="登录" src= "css/images/login_logo.gif" onClick=adminloginform.onsubmit()> </div>
					
					<p align = "center"><a href = "INFO.html" target = "c">作者个人简介</a></p>
			  </div>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text"></span>
					   <span class="copyright"></span>
			      </div>
			  </div>
			  <div id="reg"><input type="button" value="注册" onclick="javascript:window.open('addUser.jsp','_parent','')"/></div>
			  <div id="down_center"></div>
		 </div>
				
			</table>
		</form>	
	</div>					
</div>
</body>
</html>