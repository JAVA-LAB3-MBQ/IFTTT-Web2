<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="mainNew.css"/>
<style type = "text/css">
	#id  {width:200px;height:20px;}
	#pwd {width:200px;height:20px;}
	.button {font-size:125%;font-family:"Arial";background-color:#f0f8ff;}
	#login_in_btn {font-family:"Arial";background-color:#F8F8F8;}
	#tips {font-size:125%;}
	#sign_info {font-size:20px;}
	label {font-size:125%;}
	body {background-repeat: no-repeat;
		  background-attachment:fixed;
		  background-size:100% 100%;
		  font-family: "Arial";}
	div#login-inner {position:absolute;
	                 left:100px;
	                 top:160px;
	                 width:400px;}
	div#title_pic {position:absolute;
	                 left:8px;
	                 top:35px;
	                 width:400px;}
    div#copyright {position:absolute;
	                 left:50%;
	                 top:95%;
	                 text-align:center;}
	span#login_in_tip{position:absolute;
	                 left:60%;
	                 top:8%;
	                 font-size:75%;}
</style>
</head>
	<body style = "text-align: center">
		<div id="title_pic">
				<img src="${pageContext.request.contextPath}/imag/logo.jpg" alt="IFTTT">
				<img src = "${pageContext.request.contextPath}/imag/title_line.png">
				<label id = "sign_info">sign in</label>
				<img src="${pageContext.request.contextPath}/imag/line.jpg">
		</div>
		<span id="login_in_tip">
			<label id="tips">Don't have an account? </label>
			<a href = "Register.jsp">
			<button type="button" class="button" id="register">Sign up</button>
			</a>
		</span>
		<div id = "login-inner">
			<form action = "${pageContext.request.contextPath}/LoginServlet" method = "post">	
				<p>
					<label>Username：</label>
					<input type = "text" id = "id" >
				</p>
					<br>
				<p>
					<label>Password：</label>
					<input type = "password" id = "pwd"  >
				</p>
					<br>
				<p id = "login_btn">
					<span id = "button">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button"  class = "button" id = "reset" value = "reset" 
						onclick = "window.location.href = 'Login.jsp'">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type = "submit" class = "button" id = "login">sign in</button>
					</span>
				</p>	
		</form>
		</div>	
		<div id="copyright">2015©MBQ</div>
	</body>
</html>