<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>UserInfo</title>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
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
     div#sign_in {
     	position: absolute;
     	left:70%;
     	top:6%;
     	font-size: 20px;
     	font-color:#ffffff;
     }
      div#sign_up {
     	position: absolute;
     	left:80%;
     	top:6%;
     	font-size: 20px;
     }
     #pics img{
         position:relative;
         top:0;
         left:0;
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
    <span class="head_tips">Do Some Services for You</span>
</div>
    <div id="sign_in"><a href="Login.jsp">Sign in</a></div>
    <div id = "sign_up"><a href="Register.jsp">Sign up</a></div>
    
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