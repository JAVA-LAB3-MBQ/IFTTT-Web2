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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="ifttt page">
	<style type = "text/css">
	div#logo{
         position:absolute;
         left:12%;
         top:5%;
     }
     div#pics{
         position:absolute;
         left:12%;
         top:15%;
         width:80%;
         height:50%;
     }
     div#line{
         position:absolute;
         left:6%;
         top:11%;
     }
     div#pre_pic{
         position:absolute;
         left:7%;
         top:50%;
     }
        div#next_pic {
            position: absolute;
            left: 91%;
            top: 50%;
        }
     #pics img{
         position:relative;
         top:0;
         left:0;
     }
     div#menus {position:absolute;
                left:66%;
                top:3%;
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
        
        body {
            font-family: Verdana, Arial, '宋体';
            font-size: 14px;
        }
        .head_tips{
            font-size:21px;
        }
        </style>
</head>
<body>
<div id="logo" >
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="head_tips">${formbean.userName} Level ${formbean.userLevel} Score ${formbean.userScore}</span>
</div>
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
    <div id="pre_pic"><img src="${pageContext.request.contextPath}/imag/icon_prve.jpg"></div>
    <div id="line">
        <img src="${pageContext.request.contextPath}/imag/line.jpg" />
    </div>
    <div id="pics">
        <img src="${pageContext.request.contextPath}/imag/5.jpg" id="big_img">
    </div>
    <div id="next_pic"><img src="${pageContext.request.contextPath}/imag/icon_next.jpg"></div>
    <script type="text/javascript">
        setInterval(Change, 2000);
        function Change()
        {
            var number = Math.ceil(Math.random() * 6);
            document.getElementById("big_img").src = "${pageContext.request.contextPath}/imag/" + number + ".jpg";
        }
    </script>
</body>
</html>