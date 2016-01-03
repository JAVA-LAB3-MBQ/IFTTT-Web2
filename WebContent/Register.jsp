<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="mainNew.css"/>
<style type = "text/css">
	body {
		  background-repeat: no-repeat;
		  background-attachment:fixed;
		  background-size:100% 100%;
		   font-family: "Arial";}
</style>
</head>
	<body>
		<div class="header">
				<img src="${pageContext.request.contextPath}/imag/logo.jpg">
				<img src = "${pageContext.request.contextPath}/imag/title_line.png">
				<span>sign up</span>
		                <span class="loginInTip">
			    <label>Already have an count?</label>
			    <a href = "Login.jsp">
			    <button type="button" class="button" id="sign_in_btn">Sign in</button>
			    </a>
		        </span>
			        <img src="${pageContext.request.contextPath}/imag/line.jpg">
	        </div>
		<div class="Wrapper"> 
		<div class="infoInputSignUp">
		<form action = "${pageContext.request.contextPath}/RegisterServlet" method = "post">
				<label>Username：</label>				
				<input type = "text" name = "userName"  value = "${formbean.userName}" >${formbean.errors.userName} 
				<label>Password：</label>
				&nbsp;<input type = "password" name = "userPwd"  value = "${formbean.userPwd}" >${formbean.errors.userPwd}
				<label>&nbsp;&nbsp;Confirm：</label>
				&nbsp;&nbsp;<input type = "password" name = "confirmPwd"  value = "${formbean.confirmPwd}" >${formbean.errors.confirmPwd}
				<span>
				<input type = "button"  class = "button" id = "reset" value = "Reset" style="margin-left:40px"
						onclick = "window.location.href = 'Register.jsp'">
				<a href="${pageContext.request.contextPath}/servlet/RegisterUIServlet">
				<input type = "submit" class = "button" id = "register" value = "Sign up" style="margin-left:60px">
				</a>
				</span>	
		</form>
		</div>	
		</div>
		<div class="foot">2015©MBQ</div>
	</body>
</html>