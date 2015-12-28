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
	<link rel="stylesheet" type="text/css" href="main.css"/>
	<style>
	div#logo{
         position:absolute;
         left:6%;
         top:2%;
     }
     div#menus {position:absolute;
                left:66%;
                top:2%;
                }
        #menus ul {
            list-style: none;
        }
        #menus ul li {
                float: left;
            }
            #menus ul li a:link, #menus ul li a:visited {
                display: block;
                width: 120px;
                height:25px;
                font-weight: bold;
                color: black;
                background-color: white;
                text-align: center;
                padding: 4px;
                line-height:25px;
                font-size:18px;
                text-decoration: none;
                text-transform: none;
            }

            #menus ul li a:hover, #menus ul li a:active {
                background-color: white;
            }
            #menus ul li:hover ul {
                display: block;
                position: absolute;
                width: 100px;
                /*left:0;*/
                z-index: 10000;
                             
            }
          #menus ul li ul {
                display: none;
            }
            #menus ul li:hover ul li a {
                display: block;
                background-color: white;
                color: black;
                width: 100px;
                text-align: center;
                border-bottom: 1px solid #f2f2f2;
                border-right: none;
                border: #666 solid 1px;
            }
                #menus ul li:hover ul li a:hover {
                    background: #6dc7ec;
                    color: black;
                }
            
            #menus ul li ul li {
                float: none;
                width: 100%;
                line-height: 12px;
                display: block;
            }
        
        #menus ul li ul li a {
                font-size: 12px;
                width: 100%;
                padding: 3px 0;
                text-align: center;
                line-height: 18px;
            }
        .head_tips{
            font-size:21px;
        }
        </style>
</head>
<body>
	<div class ="logo" >
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="head_tips">| Information setting</span>
	</div>
	<div class ="line">
        <img src="${pageContext.request.contextPath}/imag/line.jpg" />
    </div>
    <div class = "title_info">
    	<span>Preference >> Setting</span>
    </div>
    <div id="menus">
            <ul>
                <li><a href="a.jsp">Task</a>
                <ul>
                    <li>
                        <a href="a1.jsp">View Task</a>
                    </li>
                    <li>
                        <a href="a1.jsp">Creat Task</a>
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
	<div class = "info-inner">
		<form accept-charset = "UTF-8" action = "${pageContext.request.contextPath}/servlet/
					EditUserInfoUIServlet" class = "edit_userinfo" id = "edit_user_info" method = "get">
				<p>
					<label>UserName</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "text" id = "userName" value = "${formbean.userName}">
					<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
				</p>
				<p>
					<label>UserMail</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          			<input type = "text" id = "userMail" value = "${formbean.userMail}" width = "59" height = "40">
					<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
				</p>
				<p>
					<label>UserWeibo</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeibo}" width = "59" height = "40">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserScore</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeibo}" width = "59" height = "40">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserLevel</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeibo}" width = "59" height = "40">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
            	<p>
					<label>UserMoney</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		<input type = "text" id = "userWeibo" value = "${formbean.userWeibo}" width = "59" height = "40">
            		<img src = "${pageContext.request.contextPath}/imag/line.jpg" class = "line">
            	</p>
				<p style="text-align:left">
					<input type="image" src="${pageContext.request.contextPath}/imag/commit.png" alt="Submit" />
				</p>	
		</form>
	</div>
</body>
	<div class="copyright">2015©MBQ</div>
</html>