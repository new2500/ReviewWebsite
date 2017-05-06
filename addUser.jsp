<script language=javascript>
function checkregister()
{
	if (registerform.user.value=="")
	{
		alert("请输入用户名");
		registerform.user.focus();
		return false;
	}
	if (registerform.password.value=="")
	{
		alert("密码不能为空");
		registerform.password.focus();
		return false;
	}
	if (registerform.password.value!=registerform.password2.value)
	{
		alert("两次密码不相同");
		registerform.password.focus();
		return false;
	}
}
</script>

<%

	String user = request.getParameter("user");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String input = request.getParameter("input");

	if(user!=null && password!=null)
	{
		session.setAttribute("user",user);
		session.setAttribute("password",password);
		session.setAttribute("input",input);

		String rand = (String)session.getAttribute("rand");

		if(input.equals(rand))//验证码正确
			response.sendRedirect("registercheck.jsp");
		else
			//若验证码错误，弹出javascript提示
			%>
		<script language=javascript>
					alert("验证码错误！！");
		</script>
<%
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/david.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<form name="registerform" onsubmit="return checkregister()" action="register.jsp" method="post">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" bgColor=#FFFFF
border=0>
<body>
<div id="top">
		<jsp:include page="top.jsp"></jsp:include>	
</div>
<div id="main" class="main">
	<div class="mainAdmin">

			 <TABLE cellSpacing=0 cellPadding=0 width=230 border=0>
			 <FORM name=form1 action=? method=post>
              <TR height=5>
                <TD width=5></TD>
                <TD width=56></TD>
                <TD></TD></TR>
				
				<TR height=20>
                <TD></TD>
                <TD>用 户 名</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=20 size=20 type="text" name="user"></TD></TR>

              <TR height=20>
                <TD>&nbsp; </TD>
                <TD>用户密码</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=20 size=20 type="password" name="password"></TD></TR>

				<TR height=20>
				<TD>&nbsp; </TD>
				<TD>确认密码</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  type=password maxLength=20 size=20 name="password2"></TD></TR>
              <TR>
			  <TR height=24>
				<TD>&nbsp; </TD>
				<TD>验 证 码</TD>
                <TD><INPUT 
                  style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" 
                  maxLength=4 size=8  type="test" name="input">&nbsp;&nbsp;<img border="1" height=16  src="image.jsp"></TD></TR>
              <TR>
                <TD>&nbsp;&nbsp;&nbsp;</TD>
                <TD>&nbsp;&nbsp;<input type="image" value="注册"   onclick=registerform.onsubmit()></TD>
                <TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" onclick=registerform.reset() value="重置"></TD>
			</form>
		</table>
	</div>
</div>
</body>
</html>