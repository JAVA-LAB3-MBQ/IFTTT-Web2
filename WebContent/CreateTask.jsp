<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Create Task</title>
    <link rel="stylesheet" type="text/css" href="taskmain.css" />
    <script type="text/javascript" src="jquery-2.1.4.js"></script>
    <style type = "text/css">
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
	<div id="logo" >
    <img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="head_tips">Do Some Services for You</span>
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
    <div class="contentbody">
        <div class="title_pics">
            <img src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/imag/line.jpg">
            <div id="title_tips">
                &nbsp;&nbsp;&nbsp;&nbsp;Create a Recipe
            </div>
         </div>
        
        <form accept-charset="UTF-8" action="${pageContext.request.contextPath}/servlet/
					CreatTaskServlet" class="creat_task" id="creat_task_form" method="post">
            <div class="choose_trigger">
                <label>Choose trigger</label>
                <img src="${pageContext.request.contextPath}/imag/line.jpg">
            </div>
            <div class="pics">
                <a href="#"><img id="clock_pic" src="${pageContext.request.contextPath}/imag/clock.png" /></a>
            </div>
            <div class="pics">
                <a href="#"><img id="mail_pic" src="${pageContext.request.contextPath}/imag/mail.png" /></a>
            </div>
            <div class="pics">
                <a href="#"><img id="weibo_pic" src="${pageContext.request.contextPath}/imag/weibo.jpg" /></a>
            </div>
            <div id="show_window_time" style="display:none">
                <div class="window_form">
                    <form action="" method="post" id="editForm">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date：<input type="date" name="" id="input_day" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time：<input type="time" name="" id="input_min" class="ipt" /><br />
                        <!--&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" class="submitBtn" />-->
                         &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  id="submitBtn_time" value="commit">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button"  id="cancelBtn_time" value="cancle">
                                                     
                    </form>
                </div>
            </div>
            <div id="show_window_mail" style="display:none">
                <div class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mail：<input type="email" name="" id="input_email" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password：<input type="password" name="" id="input_mail_pwd" class="ipt" /><br />
                        <!--&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" class="submitBtn" />-->
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submitBtn_mail" value="commit">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" id="cancelBtn_mail" value="cancle">

                    </form>
                </div>
            </div>
            <div id="show_window_weibo" style="display:none">
                <div class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WeiboID：<input type="text" name="" id="input_weibo_id" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password：<input type="password" name="" id="input_weibo_pwd" class="ipt" /><br />
                        <!--&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" class="submitBtn" />-->
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submitBtn_weibo" value="commit">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" id="cancelBtn_weibo" value="cancle">

                    </form>
                </div>
            </div>
            <div id="show_window_mail_send" style="display:none">
                <div class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mail：<input type="email" name="" id="input_send_email" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Content：<input type="text" name="" id="input_send_context" class="ipt" /><br />
                        <!--&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" class="submitBtn" />-->
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submitBtn_send_mail" value="commit">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" id="cancelBtn_send_mail" value="cancle">

                    </form>
                </div>
            </div>
            <div id="show_window_weibo_send" style="display:none">
                <div class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WeiboID：<input type="text" name="" id="input_weibo_send_id" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password：<input type="password" name="" id="input_weibo_send_pwd" class="ipt" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contend：<input type="password" name="" id="input_weibo_send_pwd" class="ipt" /><br />
                        <!--&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" class="submitBtn" />-->
                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submitBtn_weibo_send" value="commit">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" id="cancelBtn_weibo_send" value="cancle">

                    </form>
                </div>
            </div>
            <div id="center_contatiner">
                <img src="${pageContext.request.contextPath}/imag/creat.jpg" id="bg_${pageContext.request.contextPath}/image" />
            </div>
            <div class="chooseTask">
                <label>Choose Task</label>
            </div>
            <div class="pics">
                <a href="#"><img id="mail_pic_task" src="${pageContext.request.contextPath}/imag/mail.png" /></a>
            </div>
            <div class="pics">
                <a href="#"><img id="weibo_pic_task" src="${pageContext.request.contextPath}/imag/weibo.jpg" /></a>
            </div>
        </form>
    </div>
    <br>
    <script type="text/javascript">
        document.getElementById("clock_pic").addEventListener("click", function () { $("#show_window_time").show(); });
        document.getElementById("cancelBtn_time").addEventListener("click", function () { $("#show_window_time").hide(); });
        document.getElementById("mail_pic").addEventListener("click", function () { $("#show_window_mail").show(); });
        document.getElementById("cancelBtn_mail").addEventListener("click", function () { $("#show_window_mail").hide(); });
        document.getElementById("weibo_pic").addEventListener("click", function () { $("#show_window_weibo").show(); });
        document.getElementById("cancelBtn_weibo").addEventListener("click", function () { $("#show_window_weibo").hide(); });
        document.getElementById("mail_pic_task").addEventListener("click", function () { $("#show_window_mail_send").show(); });
        document.getElementById("cancelBtn_send_mail").addEventListener("click", function () { $("#show_window_mail_send").hide(); });
        document.getElementById("weibo_pic_task").addEventListener("click", function () { $("#show_window_weibo_send").show(); });
        document.getElementById("cancelBtn_weibo_send").addEventListener("click", function () { $("#show_window_weibo_send").hide(); });
    </script>
</body>
</html>