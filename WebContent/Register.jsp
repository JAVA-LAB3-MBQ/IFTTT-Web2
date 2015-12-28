<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<style type = "text/css">
	#id  {width:300px;height:25px;}
	#pwd {width:300px;height:25px;}
	#mail {width:300px;height:25px;}
	.button {font-size:125%;font-family:"Arial";background-color:#f0f8ff;}
	#sign_in_btn {font-family:"Arial";background-color:#F8F8F8;}
	#tips {font-size:125%;}
	#signup_info {font-size:20px;}
	label {font-size:125%;}
	body {
		  background-repeat: no-repeat;
		  background-attachment:fixed;
		  background-size:100% 100%;
		   font-family: "Arial";}
	div#login-inner {position:absolute;
	                 left:12%;
	                 top:140px;
	                 width:400px;}
	div#title_pic {position:absolute;
	                 left:30px;
	                 top:35px;
	                 width:400px;}
    div#copyright {position:absolute;
	                 left:50%;
	                 top:95%;
	                 text-align:center;}
	span#sign_in_tip{position:absolute;
	                 left:60%;
	                 top:8%;
	                 font-size:75%;}
</style>
</head>
	<body style = "text-align: center">
		<div id="title_pic">
				<img src="${pageContext.request.contextPath}/imag/logo.jpg">
				<img src = "${pageContext.request.contextPath}/imag/title_line.png">
				<label id = "signup_info">sign up</label>
				<img src="${pageContext.request.contextPath}/imag/line.png">
		</div>
		<span id="sign_in_tip">
			<label id="tips">Already have an count?</label>
			<a href = "Login.jsp">
			<button type="button" class="button" id="sign_in_btn">Sign in</button>
			</a>
		</span>
		<div id = "login-inner">
		<form action = "${pageContext.request.contextPath}/servlet/
			RegisterServlet" method = "post">
			<p>
				<label>Username：&nbsp;&nbsp;&nbsp;</label>
				<input type = "text" name = "userName"  value = "${formbean.userName}" style = "height: 20px ;width: 200px">${formbean.errors.userName} 
			</p>
				<br>
			<p>
				<label>Password：&nbsp;&nbsp;&nbsp;</label>
				<input type = "password" name = "userPwd"  value = "${formbean.userPwd}" style = "height: 20px ;width: 200px">${formbean.errors.userPwd}
			</p>
				<br>
			<p>
				<label>&nbsp;&nbsp;Confirm：&nbsp;&nbsp;&nbsp;</label>
				<input type = "text" name = "confirmPwd"  value = "${formbean.confirmPwd}" style = "height: 20px ;width: 200px">${formbean.errors.confirmPwd}
			</p>
				<br>
			<p id = "login_btn">
				<span id = "button">
				<input type = "button"  class = "button" id = "reset" value = "reset" 
						onclick = "window.location.href = 'Register.jsp'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/servlet/RegisterUIServlet">
				<input type = "submit" class = "button" id = "register" value = "sign up">
				</a>
				</span>	
			</p>
		</form>
		</div>	
		<div id="copyright">2015©MBQ</div>
	</body>
</html>