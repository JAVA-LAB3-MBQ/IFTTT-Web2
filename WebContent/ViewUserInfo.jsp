<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>View UseInfo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="ifttt page">
	<link rel="stylesheet" type="text/css" href="mainNew.css"/>
</head>
<body>
	<div class="header" >
    <img src="imag/logo.jpg">
    <span>Do Some Services for You</span>
    <div id="menus">
            <ul>
                <li><a href="a.jsp">Task</a>
                <ul>
                    <li>
                        <a href="a1.jsp">View Task</a>
                    </li>
                    <li>
                        <a href="a1.jsp">Create Task</a>
                    </li>
                    <li>
                        <a href="a1.jsp">Edit Task</a>
                    </li>
                    <li>
                        <a href="a1.jsp">Delete Task</a>
                    </li>
                </ul>
                </li>
                <li><a href="b.jsp">Account</a>
                <ul>
                    <li>
                        <a href="a2.jsp">View</a>
                    </li>
                    <li>
                        <a href="a2.jsp">Edit</a>
                    </li>
                    <li>
                        <a href="a2.jsp">Sign out</a>
                    </li>
                </ul>
                </li>
            </ul>
    </div>
    <img src="imag/line.jpg" />
</div>
	<div class= "Wrapper">
		<div class="viewUserinfo" style = "margin-left:100px; margin-top:80px;font-size:125%;">
		<form accept-charset = "UTF-8" action = "${pageContext.request.contextPath}/servlet/
					EditUserInfoUIServlet"  id = "edit_user_info" method = "get">
				<p>
					<label>UserName</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "text" id = "userName" value = "${formbean.userName}" style = "border-width:0;">
					<img src = "imag/line.jpg" class = "line">
				</p>
				<p>
					<label>UserMail</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<input type = "text" id = "userMail" value = "${formbean.userMail}" style = "border-width:0;">
					<img src = "imag/line.jpg" class = "line">
				</p>
				<p>
					<label>UserWeibo</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeibo}"  style = "border-width:0;">
            		<img src = "imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserScore</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userScore" value = "${formbean.userScore}"  style = "border-width:0;">
            		<img src = "imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserLevel</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userLevel" value = "${formbean.userLevel}"  style = "border-width:0;">
            		<img src = "imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserMoney</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userMoney" value = "${formbean.userMoney}"  style = "border-width:0;">
            		<img src = "imag/line.jpg" class = "line">
            	</p>	
		</form>
		</div>
		</div>
</body>
	<div class="foot">2015©MBQ</div>
</html>