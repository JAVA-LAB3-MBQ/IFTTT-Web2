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
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
    <script type="text/javascript" src="jquery-2.1.4.js"></script>
<script>
function jump2Servlet(destServlet) {
	var ftemp = document.createElement("form");
    ftemp.action = "${pageContext.request.contextPath}/" + destServlet;
    alert(ftemp.action);
    ftemp.method = "post";        
    ftemp.style.display = "none";        
    
    // userId
    var uidParam = document.createElement("textarea");        
    uidParam.name = "userId";
    uidParam.value = '${formbean.userId}';
    ftemp.appendChild(uidParam);
    
    document.body.appendChild(ftemp);
    alert("submit");
    ftemp.submit(); // jump
}
</script>
</head>
<body>
	<div class="header" >
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span class="header_info">Do Some Services for You</span>
    <div id="menus">
            <ul>
                <li><a href="" onclick="jump2Servlet('UserTasksUIServlet'); return false">Task</a>
                </li>
                <li><a href=#>Account</a>
                <ul>
                    <li>
                        <a href="" onclick="jump2Servlet('UserInfoUIServlet'); return false">View</a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('EditTaskUIServlet'); return false">Edit</a>
                    </li>
                    <li>
                        <a href="" onclick="sjump2Servlet('SignOutServlet'); return false">Sign out</a>
                    </li>
                </ul>
                </li>
            </ul>
    </div>
    <img src="${pageContext.request.contextPath}/imag/line.jpg">
</div>
	<div class="Wrapper">
            <div class="title_tips">
                Create a Recipe
         </div>
            <div class="choose_trigger">
                <label>Choose trigger</label>
            	<div id="triggerImgs">
                <a href="#"><img id="clock_pic" src="${pageContext.request.contextPath}/imag/clock.png" /></a>
            	<p><br></p>
                <a href="#"><img id="mail_pic" src="${pageContext.request.contextPath}/imag/mail.png" /></a>
 		<p><br></p>
	    	<a href="#"><img id="weibo_pic" src="${pageContext.request.contextPath}/imag/weibo.jpg" /></a>
		</div>
            </div>
            <div id="show_window_time" class="window_form">
                    <form action="" method="post" id="editForm">
                        Date：<input type="date" name="date" id="input_day" class="ipt" /><br />
                        Time：<input type="time" name="time" id="input_min" class="ipt" /><br />
                        <input type="hidden" name="userId" value="${formbean.userId}" />
                        <input type="hidden" name="thisType" value="TIME" />
                        <input type="button" id="submitBtn_time" value="commit" style="margin-left:52px;">
                        <input type="button" id="cancelBtn_time" value="cancle" style="margin-left:58px;">                                    
                    </form>
            </div>
            <div id="show_window_mail" class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mail：<input type="email" name="" id="input_email" class="ipt" /><br />
                        Password：<input type="password" name="" id="input_mail_pwd" class="ipt" /><br />
                        <input type="hidden" name="userId" value="${formbean.userId}" />
                        <input type="hidden" name="thisType" value="RECEIVE_MAIL" />
                        <input type="button" id="submitBtn_mail" value="commit" style="margin-left:82px;">
                        <input type="button" id="cancelBtn_mail" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_weibo" class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;WeiboID：<input type="text" name="listenWeiboId" id="input_weibo_id" class="ipt" /><br />
                        Password：<input type="password" name="listenWeiboPwd" id="input_weibo_pwd" class="ipt" /><br />
                        &nbsp;Content：<input type="text" name="listenWeiboText" id="input_weibo_pwd" class="ipt" /><br />
                        Time length：<input type="text" name="listenWeiboTimeLen" id="input_weibo_pwd" class="ipt" /><br />
                        <input type="hidden" name="userId" value="${formbean.userId}" />
                        <input type="hidden" name="thisType" value="LISTEN_WEIBO" />
                        <input type="button" id="submitBtn_weibo" value="commit" style="margin-left:82px;">
                        <input type="button" id="cancelBtn_weibo" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_mail_send" class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To：<input type="email" name="destMailAddr" id="input_send_email" class="ipt" /><br />
                        Content：<input type="text" name="sendContent" id="input_send_context" class="ipt" /><br />
                        <input type="hidden" name="userId" value="${formbean.userId}" />
                        <input type="hidden" name="thatType" value="SEND_MAIL" />
                        <input type="button" id="submitBtn_send_mail" value="commit" style="margin-left:76px;">
                        <input type="button" id="cancelBtn_send_mail" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_weibo_send" class="window_form">
                    <form action="" method="post" id="editForm_mail">
                        &nbsp;&nbsp;WeiboID：<input type="text" name="" id="input_weibo_send_id" class="ipt" /><br />
                        Password：<input type="password" name="" id="input_weibo_send_pwd" class="ipt" /><br />
                        &nbsp;&nbsp;Content：<input type="text" name="sendContent" id="input_weibo_send_pwd" class="ipt" /><br />
                        <input type="hidden" name="userId" value="${formbean.userId}" />
                        <input type="hidden" name="thatType" value="SEND_WEIBO" />
                        <input type="button" id="submitBtn_weibo_send" value="commit" style="margin-left:76px;">
                        <input type="button" id="cancelBtn_weibo_send" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="center_contatiner">
                <img src="${pageContext.request.contextPath}/imag/creat.jpg" id="bg_${pageContext.request.contextPath}/image" width="700px" />
            </div>
            <div class="chooseTask">
                <label>Choose Task</label>
            	<div id="taskImgs">
                <a href="#"><img id="mail_pic_task" src="${pageContext.request.contextPath}/imag/mail.png" /></a>
		<p><br></p>
                <p><br></p>
                <p><br></p>
                <p></p>
	 	<a href="#"><img id="weibo_pic_task" src="${pageContext.request.contextPath}/imag/weibo.jpg" /></a>
	    	</div>
            </div>
    </div>
    <br>
	<div class="foot">2015©MBQ</div>
    <script type="text/javascript">
        document.getElementById("clock_pic").addEventListener("click", function () { $("#show_window_time").show(); });
        document.getElementById("cancelBtn_time").addEventListener("click", function () { $("#show_window_time").hide(); });
		document.getElementById("submitBtn_time").addEventListener("click", function () { $("#show_window_time").hide(); });
        document.getElementById("mail_pic").addEventListener("click", function () { $("#show_window_mail").show(); });
        document.getElementById("cancelBtn_mail").addEventListener("click", function () { $("#show_window_mail").hide(); });
		document.getElementById("submitBtn_mail").addEventListener("click", function () { $("#show_window_mail").hide(); });
        document.getElementById("weibo_pic").addEventListener("click", function () { $("#show_window_weibo").show(); });
        document.getElementById("cancelBtn_weibo").addEventListener("click", function () { $("#show_window_weibo").hide(); });
		document.getElementById("submitBtn_weibo").addEventListener("click", function () { $("#show_window_weibo").hide(); });
        document.getElementById("mail_pic_task").addEventListener("click", function () { $("#show_window_mail_send").show(); });
        document.getElementById("cancelBtn_send_mail").addEventListener("click", function () { $("#show_window_mail_send").hide(); });
        document.getElementById("submitBtn_send_mail").addEventListener("click", function () { $("#show_window_mail_send").hide(); });
		document.getElementById("weibo_pic_task").addEventListener("click", function () { $("#show_window_weibo_send").show(); });
        document.getElementById("cancelBtn_weibo_send").addEventListener("click", function () { $("#show_window_weibo_send").hide(); });
		document.getElementById("submitBtn_weibo_send").addEventListener("click", function () { $("#show_window_weibo_send").hide(); });
    </script>
</body>
</html>