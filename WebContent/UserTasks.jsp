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
			tasksIdInCurPage[i] = tasksId[i];
		
			// about task's information
			thisImgEle.style.visibility = "visible";
			thisImgEle.src = tasksThisIconPath[i];
			//alert(thisImgEle.src);
			
			thatImgEle.style.visibility = "visible";
			thatImgEle.src = tasksThatIconPath[i];
			//alert(thatImgEle.src);
			
			thisInfoEle.style.visibility = "visible";
			thisInfoEle.innerHTML = tasksThisInfo[i];
			//alert(thisInfoEle.innerHTML);
			
			thatInfoEle.style.visibility = "visible";
			thatInfoEle.innerHTML = tasksThatInfo[i];
			//alert(thatInfoEle.innerHTML);
			
			createTimeEle.style.visibility = "visible";
			createTimeEle.innerHTML = tasksCreateTime[i];
			//alert(createTimeEle.innerHTML);
			
			nameEle.style.visibility = "visible";
			nameEle.innerHTML = tasksName[taskNo];
			//alert("88" + tasksName[taskNo]);
			
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
	document.getElementById("taskNum").innerHTML = (taskNo) + "/" + tasksLen;
}

function lastPage() {
	taskNo = taskNo - tasksInCurPage - 3;
	showTasks();
}

function nextPage() {
	showTasks();
}

function jump2Servlet(i, destServlet) {
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
    tidParam.value = tasksId[i-1];
    ftemp.appendChild(tidParam);
    
    document.body.appendChild(ftemp);
    ftemp.submit(); // jump
}        
	
</script>
    <title>View Task</title>
    <link rel="stylesheet" type="text/css" href="taskmain.css" />
    <script type="text/javascript" src="jquery-2.1.4.js"></script>   
</head>
<body>
    <div id="logo">
        <img src="${pageContext.request.contextPath}/imag/logo.jpg">
        <span class="head_tips" style="font-size:21px;">Do Some Services for You</span>
    </div>
    <div id="menus">
        <ul>
            <li>
                <a href="a.jsp">Task</a>
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
            <li>
                <a href="b.jsp">Account</a>
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
    <div class="title_pics">
        <img src="${pageContext.request.contextPath}/imag/line.jpg">
        <div id="title_tips">
            &nbsp;&nbsp;&nbsp;&nbsp;Your Tasks&nbsp;&nbsp;<label id="taskNum">3/3 enabled</label>
        </div>
    </div>
    <div id="TaskContatiner">
        <ul id="taskList">
            <li>
                    <div id="Taskinfo">
                        <span id="task1Name">1.</span>
                        <span>
                            &nbsp;<font id="task1If">if</font>&nbsp;
                            <!--<div id="primaryObj" style="position: absolute; left:15%;">-->
                            <img src="${pageContext.request.contextPath}/imag/clock.png" id="task1ThisImg" style="padding-top:6px;width:80px;height:70px;" />
                            &nbsp;<font id="task1Then">then</font>
                            <img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task1ThatImg" style="width:80px;height:70px;" />
                        </span>
                        <span id="task1ThisInfo" style="font-size:12px;position:absolute;top:100%;left:16%; text-align:center;width:80px;height:auto;">every day 7:00 pm</span>
                        <span id="task1ThatInfo" style="font-size:12px;position:absolute;top:100%;left:45%;text-align:center;width:80px;">MyDarlinghh send a weibo </span>
                        <div id="edit_icons">
                            <a href="" onclick="jump2Servlet(1,'EditTaskUIServlet'); return false">
                            	<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task1Edit" width="60" height="50" />
                            </a>
                            <a href="" onclick="jump2Servlet(1,'RemoveTaskServlet'); return false">
                            	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task1Delete" width="60" height="50" />
                            </a>
                            <a href="" onclick="jump2Servlet(1,'StartTaskServlet'); return false">
                            	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task1Start" width="60" height="50" />
                            </a>
                            <a href="" onclick="jump2Servlet(1,'PauseTaskServlet'); return false">
                            	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task1Stop" width="60" height="50" />
                            </a>
                        </div>
                        <span id="taskTimetip">
                        	<font id="task1CreateTime">created about 1 hours ago</font>
                        </span>
                    </div>
            </li>
            <li>
                <div id="Taskinfo_1">
                    <span id="task2Name">2.</span>
                    <span>
                        &nbsp;<font id="task2If">if</font>&nbsp;
                        <img src="${pageContext.request.contextPath}/imag/mail.png" id="task2ThisImg" style="padding-top:6px;width:80px;height:70px;" />
                        &nbsp;<font id="task2Then">then</font>
                        <img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task2ThatImg" style="width:80px;height:70px;" />
                    </span>
                    <span id="task2ThisInfo" style="font-size:12px;position:absolute;top:95%;left:16%; text-align:center;width:80px;">nj_txh@163.com recieved a mail</span>
                    <span id="task2ThatInfo" style="font-size:12px;position:absolute;top:95%;left:45%;text-align:center;width:80px;">MyDarlinghh send a weibo </span>
                    <div id="edit_icons">
                        <a href="" onclick="jump2Servlet(2,'EditTaskUIServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task2Edit" width="60" height="50" />
                        </a>
                        <a href="" onclick="jump2Servlet(2,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task2Delete" width="60" height="50" />
                        </a> 
                    	<a href="" onclick="jump2Servlet(2,'StartTaskServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task2Start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2Servlet(2,'PauseTaskServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task2Stop" width="60" height="50" />
                    	</a>
                    </div>
                    <span id="taskTimetip">
                    	<font id="task2CreateTime">created about 2 hours ago</font>
                    </span>
                </div>
            </li>
            <li>
                <div id="Taskinfo_2">
                    <span id="task3Name">3.</span>
                    <span>
                        &nbsp;<font id="task3If">if</font>&nbsp;
                        <img src="${pageContext.request.contextPath}/imag/weibo.jpg" id="task3ThisImg" style="padding-top:6px;width:80px;height:70px;" />
                        &nbsp;<font id="task3Then">then</font>
                        <img src="${pageContext.request.contextPath}/imag/mail.png" id="task3ThatImg" style="width:80px;height:70px;" />
                    </span>
                    <span id="task3ThisInfo" style="font-size:12px;position:absolute;top:95%;left:16%; text-align:center;width:80px;">MyDarlinghh send a weibo:"hello world"</span>
                    <span id="task3ThatInfo" style="font-size:12px;position:absolute;top:95%;left:45%;text-align:center;width:80px;">send a mail to nj_txh@163.com </span>
                    <div id="edit_icons">
                        <a href="" onclick="jump2Servlet(3,'EditTaskUIServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task3Edit" width="60" height="50" />
                        </a>
                        <a href="" onclick="jump2Servlet(3,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task3Delete" width="60" height="50" />
                        </a>
                      	<a href="" onclick="jump2Servlet(3,'StartTaskServlet'); return false">
                      		<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task3Start" width="60" height="50" />
                      	</a>
                    	<a href="" onclick="jump2Servlet(3,'PauseTaskServlet'); return false">
                    		<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task3Stop" width="60" height="50" />
                    	</a>
                    </div>
                      <span id="taskTimetip">
                      	<font id="task3CreateTime">created about 3 hours ago</font>
                      </span>
                </div>
            </li>
        </ul>
        <script>showTasks();</script>
    </div>
    <span id="page_tip">
        <button id="pre_page" onclick="lastPage()">上一页</button>
        <button id="next_page" onclick="nextPage()">下一页</button>
    </span>
    <div style="position:absolute;top:13%;right:4%;">
        <a href="#"><img src="${pageContext.request.contextPath}/imag/createTask.png" id="createTask_img"/></a>
    </div>
</body>
</html>