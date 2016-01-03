<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="domain.Task"%>
<%@page language="java" import="web.formbean.UserTasksFormBean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script>
// eles about tasks in this Page
var taskNo = 0;
var tasksInCurPage = 0;
var tasksIdInCurPage = new Array(3);
var thisImgIds = new Array("task1ThisImg", "task2ThisImg", "task3ThisImg");
var thatImgIds = new Array("task1ThatImg", "task2ThatImg", "task3ThatImg");
var thisInfoIds = new Array("task1ThisInfo", "task2ThisInfo", "task3ThisInfo");
var thatInfoIds = new Array("task1ThatInfo", "task2ThatInfo", "task3ThatInfo");
var nameIds = new Array("task1Name", "task2Name", "task3Name");
var createTimeIds = new Array("task1CreateTime", "task2CreateTime", "task3CreateTime");
var tasksEdit = new Array("task1Edit", "task2Edit", "task3Edit");
var tasksDelete = new Array("task1Delete", "task2Delete", "task3Delete");
var tasksStart = new Array("task1Start", "task2Start", "task3Start");
var tasksStop = new Array("task1Stop", "task2Stop", "task3Stop");
var tasksIf = new Array("task1If", "task2If", "task3If");
var tasksThen = new Array("task1Then", "task2Then", "task3Then");
// tasks' information
var tasksLen;
var tasksName = new Array();
var tasksThisIconPath = new Array();
var tasksThatIconPath = new Array();
var tasksThisInfo = new Array();
var tasksThatInfo = new Array();
var tasksCreateTime = new Array();
var tasksId = new Array();
<%
ArrayList<Task> userTasks = ((UserTasksFormBean)(request.getAttribute("formbean"))).getUserTasks();
if(userTasks != null){
	for(int j = 0;j < userTasks.size(); j ++) {%>
    //alert("111");
    tasksName[<%=j%>] = '<%=userTasks.get(j).getTaskName()%>';
    tasksThisIconPath[<%=j%>] = '<%=userTasks.get(j).getThisIconPath()%>';
    tasksThatIconPath[<%=j%>] = '<%=userTasks.get(j).getThatIconPath()%>';
    tasksThisInfo[<%=j%>] = '<%=userTasks.get(j).getThisInfo()%>';
    tasksThatInfo[<%=j%>] = '<%=userTasks.get(j).getThatInfo()%>';
    tasksCreateTime[<%=j%>] = '<%=userTasks.get(j).getCreateTime()%>';
    tasksId[<%=j%>] = '<%=userTasks.get(j).getTaskId()%>';
<%}
}%>

function showTasks() {
	tasksLen = '${formbean.userTasks.size()}';
	if(taskNo >= tasksLen || taskNo < 0) return;
	
	var i;
	tasksInCurPage = 0;
	for(i = 0; i < 3; i ++) {
		var thisImgEle = document.getElementById(thisImgIds[i]);
		var thatImgEle = document.getElementById(thatImgIds[i]);
		var thisInfoEle = document.getElementById(thisInfoIds[i]);
		var thatInfoEle = document.getElementById(thatInfoIds[i]);
		var createTimeEle = document.getElementById(createTimeIds[i]);
		var nameEle = document.getElementById(nameIds[i]);
		
		if(taskNo < tasksLen) {
			tasksIdInCurPage[i] = tasksId[taskNo];
		
			// about task's information
			// thatImg src, and when put mouse on it, it will show the entire thisInfo
			thisImgEle.style.visibility = "visible";
			thisImgEle.src = tasksThisIconPath[i];
			thisImgEle.title = tasksThisInfo[i];

			// thatImg src, and when put mouse on it, it will show the entire thatInfo
			thatImgEle.style.visibility = "visible";
			thatImgEle.src = tasksThatIconPath[i];
			thatImgEle.title = tasksThatInfo[i];

			// thisInfo, under the this image
			thisInfoEle.style.visibility = "visible";
			if(tasksThisInfo[i].length < 20)
				thisInfoEle.innerHTML = tasksThisInfo[i];
			else
				thisInfoEle.innerHTML = (tasksThisInfo[i]).substr(0, 20) + "...";

			// thatInfo, under the that image
			thatInfoEle.style.visibility = "visible";
			if(tasksThatInfo[i].length < 20)
				thatInfoEle.innerHTML = tasksThatInfo[i];
			else
				thatInfoEle.innerHTML = (tasksThatInfo[i]).substr(0, 20) + "...";
			
			// task create time
			createTimeEle.style.visibility = "visible";
			createTimeEle.innerHTML = tasksCreateTime[i];

			// task's name, we user "taskNo."
			nameEle.style.visibility = "visible";
			nameEle.innerHTML = (taskNo+1) + ".";
			
			// operations about task
			document.getElementById(tasksEdit[i]).style.visibility = "visible";
			document.getElementById(tasksDelete[i]).style.visibility = "visible";
			document.getElementById(tasksStart[i]).style.visibility = "visible";
			document.getElementById(tasksStop[i]).style.visibility = "visible";
			document.getElementById(tasksIf[i]).style.visibility = "visible";
			document.getElementById(tasksThen[i]).style.visibility = "visible";
			
			// next task
			taskNo ++;
			tasksInCurPage ++;
		}
		else { // hide elements
			thisImgEle.style.visibility = "hidden";
		    thatImgEle.style.visibility = "hidden";
		    thisInfoEle.style.visibility = "hidden";
		    thatInfoEle.style.visibility = "hidden";
		    createTimeEle.style.visibility = "hidden";
		    nameEle.style.visibility = "hidden";
		    
			document.getElementById(tasksEdit[i]).style.visibility = "hidden";
			document.getElementById(tasksDelete[i]).style.visibility = "hidden";
			document.getElementById(tasksStart[i]).style.visibility = "hidden";
			document.getElementById(tasksStop[i]).style.visibility = "hidden";
			document.getElementById(tasksIf[i]).style.visibility = "hidden";
			document.getElementById(tasksThen[i]).style.visibility = "hidden";
		}
	}
	document.getElementById("taskNum").innerHTML = "Your tasks " + (taskNo) + "/" + tasksLen;
}

function lastPage() {
	var i = taskNo - tasksInCurPage - 3;
	if(i >= 0) { // if last page exists
		taskNo = i;
		showTasks();
	}
}

function nextPage() {
	showTasks();
}

function jump2TaskServlet(i, destServlet) {
	var ftemp = document.createElement("form");
    ftemp.action = "${pageContext.request.contextPath}/" + destServlet;        
    ftemp.method = "post";        
    ftemp.style.display = "none";        
    
    // userId
    var uidParam = document.createElement("textarea");        
    uidParam.name = "userId";
    uidParam.value = '${formbean.userId}';
    ftemp.appendChild(uidParam);
    // taskId
    var tidParam = document.createElement("textarea");        
    tidParam.name = "taskId";
    tidParam.value = tasksIdInCurPage[i-1];
    ftemp.appendChild(tidParam);
    
    document.body.appendChild(ftemp);
    ftemp.submit(); // jump
}        

function jump2UserServlet(destServlet) {
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
    <title>View Task</title>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
    <script type="text/javascript" src="jquery-2.1.4.js"></script>  
    <style type="text/css">
		a:link,a:visited{
 			text-decoration:none;  /*超链接无下划线*/
		}
		a:hover{
 			text-decoration:underline;  /*鼠标放上去有下划线*/
		}
	</style> 
</head>
<body>
    <div class="header">
        <img src="${pageContext.request.contextPath}/imag/logo.jpg">
        <span>Do Some Services for You</span>
    <div id="menus">
        <ul>
            <li>
                <a href=#>Account</a>
                <ul>
                    <li>
                        <a href="" onclick="jump2UserServlet('UserInfoUIServlet'); return false">View</a>
                    </li>
                    <li>
                        <a href="" onclick="jump2EditUserInfoUIServlet">Edit</a>
                    </li>
                    <li>
                        <a href="" onclick = "jump2UserServlet('SignOutServlet'); return false">
                        	Sign out
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <img src="${pageContext.request.contextPath}/imag/line.jpg" />
    </div> 
    <div class="Wrapper"> 
    	<div class="title_tips" id="taskNum">
	  	Your Tasks
	  	</div>
    <div class="TaskContatiner">
        <ul id="taskList">
            <li>
                <div id="Taskinfo" class="taskInner">
                    <div id="task1Name" class="infoLable">1.</div>
                    <div class="infoLable" id="task1If">if</div>
                    <div class="wrap" >
                        <div class="pic"><img src="${pageContext.request.contextPath}/imag/clock.png" id="task1ThisImg"/></div>
			    		<div class="taskTip" id="task1ThisInfo">every day 7:00 pm</div>
					</div>
                    <div class="infoLable" id="task1Then">then</div>
					<div class="wrap">
		    	    	<div class="pic"><img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task1ThatImg"/></div>
			    		<div class="taskTip" id="task1ThatInfo">MyDarlinghh send a weibo</div>
			    	</div>
                 	<div class="edit_icons">
                    	<a href="" onclick="jump2TaskServlet(1,'EditTaskUIServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task1Edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(1,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task1Delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(1,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task1Start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(1,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task1Stop" width="60" height="50" />
                    	</a>
		            	<div class="taskTip" id="task1CreateTime">created about 1 hours ago</div>
                    </div>
                </div>
            </li>
            <li>
                <div id="Taskinfo1" class="taskInner">
                    <div id="task2Name" class="infoLable">2.</div>
                    <div class="infoLable" id="task2If">if</div>
                    <div class="wrap" >
                        <div class="pic"><img src="${pageContext.request.contextPath}/imag/clock.png" id="task2ThisImg"/></div>
			    		<div class="taskTip" id="task2ThisInfo">every day 7:00 pm</div>
					</div>
                    <div class="infoLable" id="task2Then">then</div>
					<div class="wrap">
		    	    	<div class="pic"><img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task2ThatImg"/></div>
			    		<div class="taskTip" id="task2ThatInfo">MyDarlinghh send a weibo</div>
			    	</div>
                 	<div class="edit_icons">
                    	<a href="" onclick="jump2TaskServlet(2,'EditTaskUIServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task2Edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(2,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task2Delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(2,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task2Start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(2,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task2Stop" width="60" height="50" />
                    	</a>
		            	<div class="taskTip" id="task2CreateTime">created about 1 hours ago</div>
                    </div>
                </div>
            </li>
            <li>
                <div id="Taskinfo2" class="taskInner">
                    <div id="task3Name" class="infoLable">3.</div>
                    <div class="infoLable" id="task3If">if</div>
                    <div class="wrap" >
                        <div class="pic"><img src="${pageContext.request.contextPath}/imag/clock.png" id="task3ThisImg"/></div>
			    		<div class="taskTip" id="task3ThisInfo">every day 7:00 pm</div>
					</div>
                    <div class="infoLable" id="task3Then">then</div>
					<div class="wrap">
		    	    	<div class="pic"><img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task3ThatImg"/></div>
			    		<div class="taskTip" id="task3ThatInfo">MyDarlinghh send a weibo</div>
			    	</div>
                 	<div class="edit_icons">
                    	<a href="" onclick="jump2TaskServlet(3,'EditTaskUIServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task3Edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(3,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task3Delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(3,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task3Start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(3,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task3Stop" width="60" height="50" />
                    	</a>
		            	<div class="taskTip" id="task3CreateTime">created about 1 hours ago</div>
                    </div>
                 </div>
            </li>
        </ul>
        <script>showTasks();</script>
    <div id="page_tip">
        <button id="pre_page" onclick="lastPage()">上一页</button>
        <button id="next_page" onclick="nextPage()">下一页</button>
    </div>
    <div style="float:right;margin-top:100px;margin-right:50px;">
        <a href="#"><img src="${pageContext.request.contextPath}/imag/createTask.png" id="createTask_img"/></a>
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