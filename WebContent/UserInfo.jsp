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
<script>
function jump2Servlet(destServlet) {
	var ftemp = document.createElement("form");
    ftemp.action = "${pageContext.request.contextPath}/" + destServlet;
    ftemp.method = "post";        
    ftemp.style.display = "none";        
    
    // userId
    var uidParam = document.createElement("textarea");        
    uidParam.name = "userId";
    uidParam.value = '${formbean.userId}';
    ftemp.appendChild(uidParam);
    
    document.body.appendChild(ftemp);
    ftemp.submit(); // jump
}
</script>
</head>
<body>
	<div class="header" >
    <img src="imag/logo.jpg">
    <span>Do Some Services for You</span>
    <div id="menus">
            <ul>
                <li>
                	<a href="" onclick="jump2Servlet('UserTasksUIServlet'); return false">
                	Task
                	</a>
                </li>
                <li><a href="javascript: void(0)">Account</a>
                <ul>
                    <li>
                        <a href="" onclick="jump2Servlet('UserInfoUIServlet'); return false">
                        View
                        </a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('EditUserInfoUIServlet'); return false">
                        Edit
                        </a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('UserMessagesServlet'); return false">
                        Messages
                        </a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('SignOutServlet'); return false">
                        Sign out
                        </a>
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
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeiboId}"  style = "border-width:0;">
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