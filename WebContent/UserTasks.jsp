<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="domain.Task"%>
<%@page language="java" import="web.formbean.UserTasksFormBean"%>
<%@page language="java" import="util.WebUtils"%>

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
var tasksThisTypeInCurPage = new Array(3);
var tasksThatTypeInCurPage = new Array(3);
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
var tasksThisType = new Array();
var tasksThatType = new Array();
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
    tasksThisType[<%=j%>] = '<%=WebUtils.thisTypeInt2String(userTasks.get(j).getThisType())%>';
    tasksThatType[<%=j%>] = '<%=WebUtils.thatTypeInt2String(userTasks.get(j).getThatType())%>';
<%}
}%>

function showTasks() {
	tasksLen = '${formbean.userTasks.size()}';
	//alert(tasksLen);
	if((tasksLen > 0 && taskNo >= tasksLen) || taskNo < 0) return;
	
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
			tasksThisTypeInCurPage[i] = tasksThisType[taskNo];
			tasksThatTypeInCurPage[i] = tasksThatType[taskNo];
			
			// about task's information
			// thatImg src, and when put mouse on it, it will show the entire thisInfo
			thisImgEle.style.visibility = "visible";
			thisImgEle.src = tasksThisIconPath[taskNo];
			thisImgEle.title = tasksThisInfo[taskNo];

			// thatImg src, and when put mouse on it, it will show the entire thatInfo
			thatImgEle.style.visibility = "visible";
			thatImgEle.src = tasksThatIconPath[taskNo];
			thatImgEle.title = tasksThatInfo[taskNo];

			// thisInfo, under the this image
			thisInfoEle.style.visibility = "visible";
			if(tasksThisInfo[i].length < 20)
				thisInfoEle.innerHTML = tasksThisInfo[taskNo];
			else
				thisInfoEle.innerHTML = (tasksThisInfo[taskNo]).substr(0, 20) + "...";

			// thatInfo, under the that image
			thatInfoEle.style.visibility = "visible";
			if(tasksThatInfo[i].length < 20)
				thatInfoEle.innerHTML = tasksThatInfo[taskNo];
			else
				thatInfoEle.innerHTML = (tasksThatInfo[taskNo]).substr(0, 20) + "...";
			
			// task create time
			createTimeEle.style.visibility = "visible";
			createTimeEle.innerHTML = tasksCreateTime[taskNo];

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
	var submit = document.getElementById("submitEdit");
	submit.style.visibility = "hidden";
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
	i = i - 1;
	
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
    tidParam.value = tasksIdInCurPage[i];
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

var editingTaskId;
function editTaskUI(i) {
	i = i - 1;
	editingTaskId = tasksIdInCurPage[i];
	
	var submit = document.getElementById("submitEdit");
	submit.style.visibility = "visible";
	
	if(tasksThisTypeInCurPage[i] == "TIME") {
		$("#Edit_time").show();
	}
	else if(tasksThisTypeInCurPage[i] == "RECEIVE_MAIL") {
		$("#Edit_mail").show();
	}
	else if(tasksThisTypeInCurPage[i] == "LISTEN_WEIBO") {
		$("#Edit_weibo").show();
	}
	
	// that
	if(tasksThatTypeInCurPage[i] == "SEND_MAIL") {
		$("#Edit_mail_send").show();
	}
	else if(tasksThatTypeInCurPage[i] == "SEND_WEIBO") {
		$("#Edit_weibo_send").show();
	}
}
var thisType_, thatType_;
var thisIconPath_, thatIconPath_;

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
                        <a href="" onclick="jump2UserServlet('EditUserInfoUIServlet'); return false">Edit</a>
                    </li>
                    <li>
                        <a href="" onclick="jump2UserServlet('UserMessagesServlet'); return false">
                        Messages
                        </a>
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
                    	<a href="" onclick="editTaskUI(1); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task1Edit" title="edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(1,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task1Delete" title="delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(1,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task1Start" title="start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(1,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task1Stop" title="pause" width="60" height="50" />
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
                    	<a href="" onclick="editTaskUI(2); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task2Edit" title="edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(2,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task2Delete" title="delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(2,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task2Start" title="start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(2,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task2Stop" title="pause" width="60" height="50" />
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
                    	<a href="" onclick="editTaskUI(3); return false">
                    		<img src="${pageContext.request.contextPath}/imag/edit_task_icon.png" id="task3Edit" title="edit" width="60" height="50" />
                    	</a>
                   	 	<a href="" onclick="jump2TaskServlet(3,'RemoveTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/delete_icon.png" id="task3Delete" title="delete" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(3,'StartTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/start_task_icon.png" id="task3Start" title="start" width="60" height="50" />
                    	</a>
                    	<a href="" onclick="jump2TaskServlet(3,'PauseTaskServlet'); return false">
                        	<img src="${pageContext.request.contextPath}/imag/stop_task_icon.png" id="task3Stop" title="pause" width="60" height="50" />
                    	</a>
		            	<div class="taskTip" id="task3CreateTime">created about 1 hours ago</div>
                    </div>
                 </div>
            </li>
        </ul>
        </div>
        <input type="button" onclick="submitWholeForm('EditTaskServlet'); return false" id="submitEdit" value="submit test"/>
        <script>showTasks();</script>
        <div id="Edit_time" class="window_form1">
               <form action="" method="post" id="editForm">
                     <span class="editTitle_2">Edit your Trigger:</span><br />
                      Date：&nbsp;&nbsp;<input type="date" name="date_" id="date_" class="ipt" /><br />
                  	  Time：&nbsp;&nbsp;<input type="time" name="time_" id="time_" class="ipt" /><br />
                      <input style="margin-left:62px;" type="button" id="submitBtn_edit_time" value="Ok">
                      <input style="margin-left:62px;" type="button" id="cancelBtn_edit_time" value="Cancel">
               </form>
        </div>
        <div id="Edit_mail" class="window_form1">
        		 <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        if receive mail <br />
        				<input style="margin-left:62px;" type="button" id="submitBtn_edit_mail" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_mail" value="Cancel">
        			</form>
        </div>
        <div id="Edit_weibo" class="window_form1">
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Trigger:</span><br />
                        WeiboID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" id="listenWbId_" class="ipt" value="" /><br />
                        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="" id="listenWbPwd_" class="ipt" value="" /><br />
                        Content:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" id="listenWbText_" class="ipt" value="" /><br />
                        Time length：<input type="text" name="" id="listenTimeLen_" class="ipt" /><br />
                        <input style="margin-left:62px;" type="button" id="submitBtn_edit_weibo" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_weibo" value="Cancel">
                    </form>
        </div>
        <div id="Edit_mail_send" class="window_form2">
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Task:</span><br />
                        To: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" id="destMailAddr_" class="ipt" value="" /><br />
                        Content:&nbsp;&nbsp;<input type="text" name="" id="sendMailContent_" class="ipt" value="" /><br />
                        <input style="margin-left:62px;" type="button" id="submitBtn_edit_mail_send" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_mail_send" value="Cancel">
                    </form>
        </div>
        <div id="Edit_weibo_send" class="window_form2">
                    <form action="" method="post" id="editForm">
                        <span class="editTitle_2">Edit your Task:</span><br />
                        Content:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="" id="sendWeiboContent_" class="ipt" value="" /><br />
                        <input style="margin-left:62px;" type="button" id="submitBtn_edit_weibo_send" value="Ok">
                        <input style="margin-left:62px;" type="button" id="cancelBtn_edit_weibo_send" value="Cancel">
                    </form>
        </div>
    </div>
	
    <div id="page_tip">
        <button id="pre_page" onclick="lastPage()">上一页</button>
        <button id="next_page" onclick="nextPage()">下一页</button>
    </div>
    <div style="position: fixed;float:right;margin-top:100px;margin-left:900px;">
        <a href="" onclick="jump2UserServlet('CreateTaskUIServlet'); return false"><img src="${pageContext.request.contextPath}/imag/createTask.png" id="createTask_img"/></a>
    </div>
    </div>
     <div class="foot">2015©MBQ</div>
     <script>
        document.getElementById("cancelBtn_edit_time").addEventListener("click", function () { 
        	$("#Edit_time").hide(); 
        	var submit = document.getElementById("submitEdit");
        	submit.style.visibility = "hidden";
        });
        document.getElementById("cancelBtn_edit_mail").addEventListener("click", function () { 
        	$("#Edit_mail").hide(); 
        	var submit = document.getElementById("submitEdit");
        	submit.style.visibility = "hidden";
        });
        document.getElementById("cancelBtn_edit_weibo").addEventListener("click", function () {
        	$("#Edit_weibo").hide(); 
        	var submit = document.getElementById("submitEdit");
        	submit.style.visibility = "hidden";
        });
        document.getElementById("cancelBtn_edit_weibo_send").addEventListener("click", function () {
			$("#Edit_weibo_send").hide(); 
			var submit = document.getElementById("submitEdit");
        	submit.style.visibility = "hidden";
		});
        document.getElementById("cancelBtn_edit_mail_send").addEventListener("click", function () { 
        	$("#Edit_mail_send").hide(); 
        	var submit = document.getElementById("submitEdit");
        	submit.style.visibility = "hidden";
        });
        document.getElementById("submitBtn_edit_time").addEventListener("click", function () { 
			thisType_="TIME";
			thisIconPath_="imag/clock.png";
			$("#Edit_time").hide(); 
		});
        document.getElementById("submitBtn_edit_mail").addEventListener("click", function () { 
			thisType_="RECEIVE_MAIL";
			thisIconPath_="imag/mail.png";
			$("#Edit_mail").hide(); 
	    });
        document.getElementById("submitBtn_edit_weibo").addEventListener("click", function () { 
			thisType_="LISTEN_WEIBO"; 
			thisIconPath_="imag/weibo.jpg";
			$("#Edit_weibo").hide();
	    });
        document.getElementById("submitBtn_edit_mail_send").addEventListener("click", function () { 
    		thatType_="SEND_MAIL";
    		thatIconPath_="imag/mail.png";
    		$("#Edit_mail_send").hide(); 
        });
        document.getElementById("submitBtn_edit_weibo_send").addEventListener("click", function () { 
			thatType_="SEND_WEIBO";
			thatIconPath_="imag/weibo.jpg";
			$("#Edit_weibo_send").hide(); 
		});
     </script>
</body>
</html>