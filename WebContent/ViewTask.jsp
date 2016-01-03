<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>View Task</title>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
    <script type="text/javascript" src="jquery-2.1.4.js"></script>   
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
       <div class="Wrapper">
            <div class="title_tips">
                Your Tasks 
           </div>
      <div class="TaskContatiner">
        <ul id="taskList">
            <li>
                    <div id="Taskinfo" class="taskInner">
                        <div id="taskId" class="infoLable">1.</div>
                        <div class="infoLable">if</div>
                        <div class="wrap" >
                          <div class="pic"><img src="imag/clock.png" /></div>
                          <div class="taskTip">every day 7:00 pm</div>
                        </div>
                        <div class="infoLable">then</div>
                        <div class="wrap">
                          <div class="pic"><img src="imag/weibo.jpg"  /></div>
                          <div class="taskTip" >MyDarlinghh send a weibo</div>
                        </div>
                        <div class="edit_icons">
                            <a href="#" id="time_weibo_edit"><img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="time_weibo_delete"><img src="${pageContext.request.contextPath}/imag/delete_icon.png" width="60" height="50" /></a>
                            <a href="#" id="time_weibo_start"><img src="${pageContext.request.contextPath}/imag/start_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="time_weibo_pause"><img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" width="60" height="50" /></a>
                            <div class="taskTip">created about 1 hours ago</div>
                        </div>
                    </div>
            </li>
            <li>
                <div id="Taskinfo1" class="taskInner">
                        <div id="taskId" class="infoLable">2.</div>
                        <div class="infoLable">if</div>
                        <div class="wrap">
                          <div class="pic"><img src="imag/mail.png" /></div>
                          <div class="taskTip">every day 7:00 pm</div>
                        </div>
                        <div class="infoLable">then</div>
                        <div class="wrap">
                          <div class="pic"><img src="imag/weibo.jpg" /></div>
                          <div class="taskTip">MyDarlinghh send a weibo</div>
                        </div>
                        <div class="edit_icons">
                            <a href="#" id="mail_weibo_edit"><img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="mail_weibo_delete"><img src="${pageContext.request.contextPath}/imag/delete_icon.png" width="60" height="50" /></a>
                            <a href="#" id="mail_weibo_start"><img src="${pageContext.request.contextPath}/imag/start_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="mail_weibo_pause"><img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" width="60" height="50" /></a>
                            <div class="taskTip">created about 2 hours ago</div>
                        </div>
                    </div>
            </li>
            <li>
                <div id="Taskinfo2" class="taskInner">
                        <div id="taskId" class="infoLable">3.</div>
                        <div class="infoLable">if</div>
                        <div class="wrap">
                          <div class="pic"><img src="imag/weibo.jpg" /></div>
                          <div class="taskTip" style="text-align:center">every day 7:00 pm</div>
                        </div>
                        <div class="infoLable">then</div>
                        <div class="wrap">
                          <div class="pic"><img src="imag/mail.png" /></div>
                          <div class="taskTip" >MyDarlinghh send a weibo</div>
                        </div>
                        <div class="edit_icons">
                            <a href="#" id="weibo_mail_edit"><img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="weibo_mail_delete"><img src="${pageContext.request.contextPath}/imag/delete_icon.png" width="60" height="50" /></a>
                            <a href="#" id="weibo_mail_start"><img src="${pageContext.request.contextPath}/imag/start_task_icon.png" width="60" height="50" /></a>
                            <a href="#" id="weibo_mail_pause"><img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" width="60" height="50" /></a>
                            <div class="taskTip" style="text-align:center">created about 3 hours ago</div>
                        </div>
                    </div>
            </li>
        </ul>
         <div id="Edit_time_mail" class="window_form"> 
                <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Time:<input type="text" name="" id="input_time" class="ipt" value="7:00am" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Mail:<input type="text" name="" id="input_mail" class="ipt" value="2216366704@qq.com"/><br />
                        Subject:<input type="text" name="" id="input_subject" class="ipt" value="hello" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_time_mail" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_time_mail" value="Cancel">
                    </form>
        </div>
        <div id="Edit_time_weibo" class="window_form">
                <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Time:<input type="text" name="" id="input_time" class="ipt" value="7:00am" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Weibo:<input type="text" name="" id="input_weibo" class="ipt" value="MyDarlinghh" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_time_weibo" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_time_weibo" value="Cancel">
                    </form>
        </div>
        <div id="Edit_mail_mail" class="window_form">
                   <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Mail:<input type="text" name="" id="input_mail" class="ipt" value="7:00am" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Mail:<input type="text" name="" id="input_mail_task" class="ipt" value="MyDarlinghh" /><br />
                        Subject:<input type="text" name="" id="input_sub" class="ipt" value="hello" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_mail_mail" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_mail_mail" value="Cancel">
                    </form>
        </div>
        <div id="Edit_mail_weibo" class="window_form">
                   <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Mail:<input type="text" name="" id="input_mail" class="ipt" value="nj_txh@163.com" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Weibo:<input type="text" name="" id="input_weibo" class="ipt" value="MyDarlinghh" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_mail_weibo" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_mail_weibo" value="Cancel">
                    </form>
        </div>
        <div id="Edit_weibo_weibo" class="window_form">
                <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Weibo:<input type="text" name="" id="input_weibo" class="ipt" value="MyDarlinghh" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="hello world" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Weibo:<input type="text" name="" id="input_weibo_task" class="ipt" value="MyDarlinghh" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_weibo_weibo" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_weibo_weibo" value="Cancel">
                    </form>
        </div>
        <div id="Edit_weibo_mail" class="window_form">
                <span class="editTitle_1">Edit your Recipe:</span>
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        Weibo:<input type="text" name="" id="input_weibo" class="ipt" value="MyDarlinghh" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="hello world" /><br />
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Mail:<input type="text" name="" id="input_mail" class="ipt" value="2216366704@qq.com" /><br />
                        Subject:<input type="text" name="" id="input_sub" class="ipt" value="hello" /><br />
                        Content:<input type="text" name="" id="input_content" class="ipt" value="Merry Chirstmas!" /><br />
                        <input style="margin-left:62px;" type="submit" id="submitBtn_edit_weibo_mail" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_weibo_mail" value="Cancel">
                    </form>
        </div>
    </div>
    <div id="page_tip">
        <button id="pre_page" disabled="disabled">上一页</button>
        <button id="next_page" disabled="disabled">下一页</button>
    </div>
    	<div style = "float:right;margin-top:100px;margin-right:50px;">
        <a><img src="${pageContext.request.contextPath}/imag/createTask.png" id="createTask_img" /></a>
    </div>
    </div>
     <div class="foot">2015©MBQ</div>
     <script>
        document.getElementById("time_weibo_edit").addEventListener("click", function () { $("#Edit_time_weibo").show(); });
        document.getElementById("cancelBtn_edit_time_weibo").addEventListener("click", function () { $("#Edit_time_weibo").hide(); });
        document.getElementById("mail_weibo_edit").addEventListener("click", function () { $("#Edit_mail_weibo").show(); });
        document.getElementById("cancelBtn_edit_mail_weibo").addEventListener("click", function () { $("#Edit_mail_weibo").hide(); });
        document.getElementById("weibo_mail_edit").addEventListener("click", function () { $("#Edit_weibo_mail").show(); });
        document.getElementById("cancelBtn_edit_weibo_mail").addEventListener("click", function () { $("#Edit_weibo_mail").hide(); });
    </script>
</body>
</html>