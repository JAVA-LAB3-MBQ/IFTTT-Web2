<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <base href="<%=basePath%>">
    
    <title>UserMain</title>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="ifttt page">
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
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="head_tips">${formbean.userName} Level ${formbean.userLevel} Score ${formbean.userScore}</span>
</div>
    <div id="menus">
            <ul>
                <li><a href="" onclick="jump2Servlet('UserTasksUIServlet'); return false">
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
    <img src="${pageContext.request.contextPath}/imag/line.jpg" />
<div class="Wrapper">
    <div id="pre_pic"><img src="imag/icon_prve.jpg"></div>
    <div id="pics">
        <img src="${pageContext.request.contextPath}/imag/5.jpg" id="big_img" width="960px">
    </div>
    <div id="next_pic"><img src="${pageContext.request.contextPath}/imag/icon_next.jpg"></div>
    </div>
    <script type="text/javascript">
        setInterval(Change, 2000);
        function Change()
        {
            var number = Math.ceil(Math.random() * 6);
            document.getElementById("big_img").src = "${pageContext.request.contextPath}/imag/" + number + ".jpg";
        }
    </script>
    <div class="foot">2015©MBQ</div>
</body>
</html>