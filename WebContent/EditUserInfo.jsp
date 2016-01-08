<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>UseInfo setting</title>
    
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
	<div class ="header" >
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="header_info">Do Some Services for You</span>
    <div id="menus">
            <ul>
                <li>
                	<a href="" onclick="jump2Servlet('UserTasksUIServlet'); return false">
                	Task
                	</a>
                </li>
                <li><a href=#>Account</a>
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
		   <div class="editUserinfo" style = "margin-left:100px; margin-top:80px;font-size:125%;">
		<form accept-charset = "UTF-8" action = "${pageContext.request.contextPath}/EditUserInfoServlet" 
			class = "edit_userinfo" id = "edit_user_info" method = "get">
				<p>
					<label>Name</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "text" id = "userName" name="userName" value = "${formbean.userName}" style = " width:180px ;height:28px;">
					<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
				</p>
				<p>
					<label>Mail</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<input type = "text" id = "userMail" name="userMail" value = "${formbean.userMail}" style = " width:180px ;height:28px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>Mail password</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "password" name="userMailPwd" id = "userMailPwd" value = "${formbean.userMailPwd}" style = " width:180px ;height:28px;">
					<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
				</p>
				<p>
					<label>Weibo</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" name="userWeiboId" value = "${formbean.userWeiboId}" style = " width:180px ;height:28px;">
            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<label>Access token</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" name="userWeiboAccessToken" value = "${formbean.userWeiboAccessToken}" style = " width:180px ;height:28px;">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
            	<p>

					<label>Money</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" name="userMoney" id = "userMoney" value = "${formbean.userMoney}" style = " width:180px ;height:28px;">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
            		<input type="hidden" name="userId" value="${formbean.userId}" />
				<p style="position:fixed; left: 200px; bottom: 50px ;" >
					<input type="image" src="${pageContext.request.contextPath}/imag/commit.png" alt="Submit" />
				</p>	
		</form>
	</div>
	</div>
</body>
	<div class="foot">2015©MBQ</div>
</html>