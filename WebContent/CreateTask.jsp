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
var thisType_, thatType_;
var thisIconPath_, thatIconPath_;
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
function submitWholeForm(destServlet) {
	var ftemp = document.createElement("form");
    ftemp.action = "${pageContext.request.contextPath}/" + destServlet;
    ftemp.method = "post";        
    ftemp.style.display = "none";        
    
    // userId
    var uidParam = document.createElement("textarea");        
    uidParam.name = "userId";
    uidParam.value = '${formbean.userId}';
    ftemp.appendChild(uidParam);
    
    var thisIconPath = document.createElement("textarea");
    thisIconPath.name = "thisIconPath";
    thisIconPath.value = thisIconPath_; 
	ftemp.appendChild(thisIconPath);
    
    var thatIconPath = document.createElement("textarea");
    thatIconPath.name = "thatIconPath";
    thatIconPath.value = thatIconPath_;
    ftemp.appendChild(thatIconPath);
    
    var thisType = document.createElement("textarea");
	thisType.name = "thisType";
	thisType.value = thisType_;
    ftemp.appendChild(thisType);
	
	var thatType = document.createElement("textarea");
    thatType.name = "thatType";
    thatType.value = thatType_;
	ftemp.appendChild(thatType);
	
	var listenWbId = document.createElement("textarea");
	listenWbId.name = "listenWbId";
	listenWbId.value = document.getElementById("listenWbId_").value; 
	ftemp.appendChild(listenWbId);
	
	var listenWbText = document.createElement("textarea");
	listenWbText.name = "listenWbText";
	listenWbText.value = document.getElementById("listenWbText_").value; 
	ftemp.appendChild(listenWbText);
	
	var listenTimeLen = document.createElement("textarea");
	listenTimeLen.name = "listenTimeLen";
	listenTimeLen.value = document.getElementById("listenTimeLen_").value; 
	ftemp.appendChild(listenTimeLen);
	
	var listenWbPwd = document.createElement("textarea");
	listenWbPwd.name = "listenWbPwd";
	listenWbPwd.value = document.getElementById("listenWbPwd_").value;
	ftemp.appendChild(listenWbPwd);
	
	var destMailAddr = document.createElement("textarea");
	destMailAddr.name = "destMailAddr";
	destMailAddr.value = document.getElementById("destMailAddr_").value; 
	ftemp.appendChild(destMailAddr);
	
	var sendMailContent = document.createElement("textarea");
	sendMailContent.name = "sendMailContent";
	sendMailContent.value = document.getElementById("sendMailContent_").value;
	ftemp.appendChild(sendMailContent);
	
	var sendWeiboContent = document.createElement("textarea");
	sendWeiboContent.name = "sendWeiboContent";
	sendWeiboContent.value = document.getElementById("sendWeiboContent_").value;
	ftemp.appendChild(sendWeiboContent);
	
	var date = document.createElement("textarea");
	date.name = "date";
	date.value = document.getElementById("date_").value;
	ftemp.appendChild(date);
	
	var time = document.createElement("textarea");
	time.name = "time";
	time.value = document.getElementById("time_").value;
	ftemp.appendChild(time);
	
    document.body.appendChild(ftemp);
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
                        <a href="" onclick="jump2Servlet('EditUserInfoUIServlet'); return false">Edit</a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('UserMessagesServlet'); return false">Messages</a>
                    </li>
                    <li>
                        <a href="" onclick="jump2Servlet('SignOutServlet'); return false">Sign out</a>
                    </li>
                </ul>
                </li>
            </ul>
    </div>
    <img src="${pageContext.request.contextPath}/imag/line.jpg">
</div>
	<input type="button" onclick="submitWholeForm('CreateTaskServlet'); return false" value="submit test"/>
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
                    <form action="" method="post" id="thisTimeForm">
                        Date：<input type="date" name="date" id="date_" class="ipt" /><br />
                        Time：<input type="time" name="time" id="time_" class="ipt" /><br />
                        <input type="button" id="submitBtn_time" value="commit" style="margin-left:52px;">
                        <input type="button" id="cancelBtn_time" value="cancle" style="margin-left:58px;">                                    
                    </form>
            </div>
            <div id="show_window_mail" class="window_form">
                    <form action="" method="post" id="thisMailForm">
                        If receive a mail<br />
                        <input type="button" id="submitBtn_mail" value="commit" style="margin-left:82px;">
                        <input type="button" id="cancelBtn_mail" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_weibo" class="window_form">
                    <form action="" method="post" id="thisWeiboForm">
                        &nbsp;WeiboID：<input type="text" name="listenWbId" id="listenWbId_" class="ipt" /><br />
                        Password：<input type="password" name="listenWbPwd" id="listenWbPwd_" class="ipt" /><br />
                        &nbsp;Content：<input type="text" name="listenWbText" id="listenWbText_" class="ipt" /><br />
                        Time length：<input type="text" name="listenTimeLen" id="listenTimeLen_" class="ipt" /><br />
                        <input type="button" id="submitBtn_weibo" value="commit" style="margin-left:82px;">
                        <input type="button" id="cancelBtn_weibo" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_mail_send" class="window_form">
                    <form action="" method="post" id="thatMailForm">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To：<input type="text" name="" id="destMailAddr_" class="ipt" /><br />
                        Content：<input type="text" name="" id="sendMailContent_" class="ipt" /><br />
                        <input type="button" id="submitBtn_send_mail" value="commit" style="margin-left:76px;">
                        <input type="button" id="cancelBtn_send_mail" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_window_weibo_send" class="window_form">
                    <form action="" method="post" id="thatWeiboForm">
                        &nbsp;&nbsp;Content：<input type="text" name="sendWeiboContent" id="sendWeiboContent_" class="ipt" /><br />
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
		document.getElementById("submitBtn_time").addEventListener("click", function () { 
				thisType_="TIME";
				thisIconPath_="imag/clock.png";
				$("#show_window_time").hide(); 
		});
        document.getElementById("mail_pic").addEventListener("click", function () { $("#show_window_mail").show(); });
        document.getElementById("cancelBtn_mail").addEventListener("click", function () { $("#show_window_mail").hide(); });
		document.getElementById("submitBtn_mail").addEventListener("click", function () { 
				thisType_="RECEIVE_MAIL";
				thisIconPath_="imag/mail.png";
				$("#show_window_mail").hide(); 
		});
        document.getElementById("weibo_pic").addEventListener("click", function () { $("#show_window_weibo").show(); });
        document.getElementById("cancelBtn_weibo").addEventListener("click", function () { $("#show_window_weibo").hide(); });
		document.getElementById("submitBtn_weibo").addEventListener("click", function () { 
				thisType_="LISTEN_WEIBO"; 
				thisIconPath_="imag/weibo.jpg";
				$("#show_window_weibo").hide(); 
		});
        document.getElementById("mail_pic_task").addEventListener("click", function () { $("#show_window_mail_send").show(); });
        document.getElementById("cancelBtn_send_mail").addEventListener("click", function () { $("#show_window_mail_send").hide(); });
        document.getElementById("submitBtn_send_mail").addEventListener("click", function () { 
        		thatType_="SEND_MAIL";
        		thatIconPath_="imag/mail.png";
        		$("#show_window_mail_send").hide(); 
        });
		document.getElementById("weibo_pic_task").addEventListener("click", function () { $("#show_window_weibo_send").show(); });
        document.getElementById("cancelBtn_weibo_send").addEventListener("click", function () { $("#show_window_weibo_send").hide(); });
		document.getElementById("submitBtn_weibo_send").addEventListener("click", function () { 
			thatType_="SEND_WEIBO";
			thatIconPath_="imag/weibo.jpg";
			$("#show_window_weibo_send").hide(); 
		});
    </script>
</body>
</html>