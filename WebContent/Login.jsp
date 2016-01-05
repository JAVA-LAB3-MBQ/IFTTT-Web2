<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="mainNew.css"/>
</head>
	<body>
		<div class="header">
				<img src="${pageContext.request.contextPath}/imag/logo.jpg" alt="IFTTT">
				<img src = "${pageContext.request.contextPath}/imag/title_line.png">
				<span>sign in</span>
				<span class="loginInTip">
		               <label>Don't have an account? </label>
			       <a href = "Register.jsp">
			       <button type="button" class="button">Sign up</button>
			       </a>
		</span>
			<img src="${pageContext.request.contextPath}/imag/line.jpg">
		</div>
		<div class="Wrapper">
		<div class = "infoInputSignIn">
			<form action = "${pageContext.request.contextPath}/LoginServlet" method = "post">	
			<label>Username：</label><input type = "text" name="username" id = "id" >
			<label>Password：</label>&nbsp;<input type = "password" name="password" id = "pwd" >
			<span >
				<input type = "button"  class = "button" id = "reset" value = "Reset" style="margin-left:50px;"
				onclick = "window.location.href = 'Login.jsp'">
				<button type = "submit" class = "button" id = "signInBtn" style="margin-left:70px;">Sign in</button>
			</span>	
			</form>
		</div>	
		</div>
		<div class="foot">2015©MBQ</div>
	</body>
</html>