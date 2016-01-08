<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="domain.User"%>
<%@page language="java" import="domain.Message"%>
<%@page language="java" import="web.formbean.ManagerFormBean"%>
<%@page language="java" import="util.WebUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Manager page</title>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="ifttt page">
    <script type="text/javascript" src="jquery-2.1.4.js"></script>
    <link rel="stylesheet" type="text/css" href="mainNew.css"/>
<script>
var usersNum;
var usersId = new Array();
var usersName = new Array();
var usersLevel = new Array();
var usersMoney = new Array();
<%
ArrayList<User> users = ((ManagerFormBean)(request.getAttribute("formbean"))).getUsers();
if(users != null){
	for(int j = 0;j < users.size(); j ++) {%>
    //alert("111");
    usersName[<%=j%>] = '<%=users.get(j).getName()%>';
    usersLevel[<%=j%>] = '<%=users.get(j).getUserLevel()%>';
    usersMoney[<%=j%>] = '<%=users.get(j).getUserMoney()%>';
    usersId[<%=j%>] = '<%=users.get(j).getUserId()%>';
<%}
}%>
function showUserList() {
	usersNum = '${formbean.users.size()}';
	var list = "<tr>" +
	"<th class=\"tableTd\">User ID</th>" +
	"<th class=\"tableTd\">User Name</th>" +
	"<th class=\"tableTd\">User Level</th>" +
	"<th class=\"tableTd\">User Money</th>" +
	"<th class=\"tableTd\">Operate</th>" +
	"</tr>";
	var i;
	for(i = 0; i < usersNum; i ++) {
		if(usersId[i] != "0") {
			list += "<tr>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + usersId[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + usersName[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + usersLevel[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + usersMoney[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td>" +
			"<input type=\"button\" class=\"usertableTdBtnEdit\"  value=\"Edit\">" +
			"<input type=\"button\" class=\"usertableTdBtnSave\"  value=\"Save\" style=\"display:none;\">" +
			"</td>" +
			"</tr>";
		}
	}
	document.getElementById("userInfoTable").innerHTML = list;
}

var messagesNum;
var messagesType = new Array();
var messagesContent = new Array();
var messagesToUserId = new Array();
var messagesId = new Array();
<%
ArrayList<Message> messages = ((ManagerFormBean)(request.getAttribute("formbean"))).getMessages();
if(messages != null){
	for(int j = 0;j < messages.size(); j ++) {%>
    //alert("111");
    messagesType[<%=j%>] = '<%=WebUtils.messageTypeInt2String(messages.get(j).getMessageType())%>';
    messagesContent[<%=j%>] = '<%=messages.get(j).getMessageContent()%>';
    messagesToUserId[<%=j%>] = '<%=messages.get(j).getToUserId()%>';
    messagesId[<%=j%>] = '<%=messages.get(j).getMessageId()%>';
<%}
}%>
function showMessages() {
	var publicList = "<tr>" +
		"<th class=\"tableTd\">Message id</th>" +
		"<th class=\"tableTd\">Content</th>" +
		"<th class=\"tableTd\">Operate</th>" +
		"</tr>";		
	var privateList = "<tr>" +
		"<th class=\"tableTd\">Message id</th>" +
		"<th class=\"tableTd\">UserId</th>" +
		"<th class=\"tableTd\">Content</th>" +
		"<th class=\"tableTd\">Operate</th>" +
		"</tr>";
	
	var i;
	messagesNum = '${formbean.messages.size()}';
	for(i = 0; i < messagesNum; i ++) {
		if(messagesType[i] == "PUBLIC") {
		    publicList += "<tr>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + messagesId[i] +"\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + messagesContent[i] +"\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"button\" class=\"messagetableTdBtnEdit\"  value=\"Edit\">" +
			"<input type=\"button\" class=\"messagetableTdBtnSave\"  value=\"Save\" style=\"display:none;\">" +
			"<input type=\"button\" class=\"messagetableTdBtnDelete\"  value=\"Delete\">" +
			"</td>" +
			"</tr>";
		}
		else if(messagesType[i] == "PRIVATE") {
			privateList += "<tr>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + messagesId[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + messagesToUserId[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"text\" class=\"tableTd\" value=\"" + messagesContent[i] + "\"" + "disabled=\"disabled\"></td>" +
			"<td><input type=\"button\" class=\"usermessagetableTdBtnEdit\"  value=\"Edit\">" +
			"<input type=\"button\" class=\"usermessagetableTdBtnSave\"  value=\"Save\" style=\"display:none;\">" +
			"<input type=\"button\" class=\"usermessagetableTdBtnDelete\"  value=\"Delete\">" +
			"</td>" +
			"</tr>";
		}
	}
	document.getElementById("systemMessageInfoTable").innerHTML = publicList;
	document.getElementById("usersMessageInfoTable").innerHTML = privateList
}
</script>
</head>
<body>
	<div class="header" >
    <img src="${pageContext.request.contextPath}/imag/logo.jpg">
    <span>Do Some Services for You</span>
    <div id="menusManage">
            <ul>
                <li id="acountInfoView">Account Manage
                </li>
                <li id="MessageInfoView">Message Manage
                </li>
            </ul>
    </div>
    <img src="${pageContext.request.contextPath}/imag/line.jpg" />
</div>
<div class="Wrapper">
<div id="userInfo" class="InfoInner">
<span style="font-size:18px;">Table of Accounts Info:
<img id="userCloseBtn" class="closeIcon" src="${pageContext.request.contextPath}/imag/close.png"></span><br>

<table id="userInfoTable"> </table>
<script> showUserList(); </script>

<div  style="margin-top:10px;margin-bottom:10px;">
        <button id="pre_page" disabled="disabled">上一页</button>
        <button id="next_page" disabled="disabled">下一页</button>
    </div>
</div>
<div id="messageInfo" class="InfoInner">
<span><input type="radio" checked="checked" id="sysCheck" name="MessageInfo">System Message&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="usersCheck" name="MessageInfo">Users Message 
<img id="messageCloseBtn" class="closeIcon" src="imag/close.png"></span><br>
<div id="systemMessageInfo" >
<span style="font-size:18px;">Table of SystemMessages Info:</span>
<span><input type="button" value="New" id="newSystemMessage" style="margin-left:20px;"></span><br>

<table id="systemMessageInfoTable"> </table>

</div>

<div id="usersMessageInfo" style="display:none">
<span style="font-size:18px;">Table of UserMessages Info:</span>
<span><input type="button" value="New" id="newUsersMessage" style="margin-left:20px;"></span><br>

<table id="usersMessageInfoTable"> </table>
<script>showMessages();</script>

</div>
<div style="margin-top:10px;margin-bottom:10px;">
        <button id="pre_page" disabled="disabled">上一页</button>
        <button id="next_page" disabled="disabled">下一页</button>
    </div>
</div>
<div id="show_newSystemmessage" class="window_form" >
                    <span class="editTitle_1">New System Message:</span>
                    <form action="${pageContext.request.contextPath}/AddMessageServlet" method="post" id="editForm_mail">
                       <p></p>
                       Content：<textarea name="messageContent" rows="5" cols="22"></textarea><br />
                       <input type="hidden" name="fromUserId" value="0" />
                       <input type="hidden" name="toUserName" value="ALL" />
                       <input type="hidden" name="messageType" value="PUBLIC" />
                       <input type="submit" id="submitBtn_send_systemMessage" value="commit" style="margin-left:76px;">
                       <input type="button" id="cancelBtn_send_systemMessage" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_newUsersmessage" class="window_form">
                    <span class="editTitle_1">New Users Message:</span>
                    <form action="${pageContext.request.contextPath}/AddMessageServlet" method="post" id="editForm_mail">
                       <p></p>
                       To userName：&nbsp;&nbsp;&nbsp;<input type="text" name="toUserName"  class="ipt" /><br />
                       Content：<textarea name="messageContent" rows="5" cols="22"></textarea><br />
                       <input type="hidden" name="fromUserId" value="0" />
                       <input type="hidden" name="messageType" value="PRIVATE" />
                       <input type="submit" id="submitBtn_send_usersMessage" value="commit" style="margin-left:76px;">
                       <input type="button" id="cancelBtn_send_usersMessage" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
</div>
<script>
document.getElementById("acountInfoView").addEventListener("click", function () 
		{ 
			$("#userInfo").show();
			
			});
document.getElementById("userCloseBtn").addEventListener("click", function () 
		{ 
			$("#userInfo").hide();
			
			});
document.getElementById("MessageInfoView").addEventListener("click", function () 
		{ 
			$("#messageInfo").show();
			
			});
document.getElementById("messageCloseBtn").addEventListener("click", function () 
		{ 
			$("#messageInfo").hide();
			
			});
document.getElementById("sysCheck").addEventListener("change", function ()
		{
	var syscheckedObj=document.getElementById("sysCheck");
	if(syscheckedObj.checked)
		{
		$("#usersMessageInfo").hide();
	    $("#systemMessageInfo").show();
		}
		}
		);
document.getElementById("usersCheck").addEventListener("change", function ()
		{
	var userscheckedObj=document.getElementById("usersCheck");
	if(userscheckedObj.checked)
		{
		$("#systemMessageInfo").hide();
	    $("#usersMessageInfo").show();
		}
		}
		);
window.onload=function()
{
	var userbtnClassEdit=new Array();
    userbtnClassEdit=document.getElementsByClassName("usertableTdBtnEdit");
	var userbtnClassSave=new Array();
	userbtnClassSave=document.getElementsByClassName("usertableTdBtnSave");
	var messagebtnClassEdit=new Array();
	messagebtnClassEdit=document.getElementsByClassName("messagetableTdBtnEdit");
	var messagebtnClassSave=new Array();
	messagebtnClassSave=document.getElementsByClassName("messagetableTdBtnSave");
	var usermessagebtnClassEdit=new Array();
	usermessagebtnClassEdit=document.getElementsByClassName("usermessagetableTdBtnEdit");
	var usermessagebtnClassSave=new Array();
	usermessagebtnClassSave=document.getElementsByClassName("usermessagetableTdBtnSave");
	var messagebtnClassDelete=new Array();
	messagebtnClassDelete=document.getElementsByClassName("messagetableTdBtnDelete");
	var usermessagebtnClassDelete=new Array();
	usermessagebtnClassDelete=document.getElementsByClassName("usermessagetableTdBtnDelete");
	
	var objTable=new Array();
	var objRow=new Array();
	var objRowCells=new Array();
	var objRowCellsLevel;
	var a;
	for(var i=0;i<userbtnClassEdit.length;i++)
		{
		  userbtnClassEdit[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="";
				  objRowCellsLevel.select();
				  objRowCellsLevel.focus();
				  this.style.display="none";
				  userbtnClassSave[j].style.display="inline";
			  }
		  })(i);
		  userbtnClassSave[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="disabled";
				  this.style.display="none";
				  userbtnClassEdit[j].style.display="inline";
			  }
		  })(i);
		}
	for(var i=0;i<messagebtnClassEdit.length;i++)
		{
		  messagebtnClassEdit[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="";
				  objRowCellsLevel.select();
				  objRowCellsLevel.focus();
				  this.style.display="none";
				  messagebtnClassSave[j].style.display="inline";
			  }
		  })(i);
		  messagebtnClassSave[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="disabled";
				  this.style.display="none";
				  messagebtnClassEdit[j].style.display="inline";
			  }
		  })(i);
		}
	for(var i=0;i<usermessagebtnClassEdit.length;i++)
	{
		  usermessagebtnClassEdit[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="";
				  objRowCellsLevel=a[2].childNodes[0];
				  objRowCellsLevel.disabled="";
				  objRowCellsLevel.select();
				  objRowCellsLevel.focus();
				  this.style.display="none";
				  usermessagebtnClassSave[j].style.display="inline";
			  }
		  })(i);
		  usermessagebtnClassSave[i].onclick=(function(j){
			  return function() {
				  objRow[j]= this.parentNode.parentNode;
				  a=objRow[j].cells;
				  objRowCellsLevel=a[1].childNodes[0];
				  objRowCellsLevel.disabled="disabled";
				  objRowCellsLevel=a[2].childNodes[0];
				  objRowCellsLevel.disabled="disabled";
				  this.style.display="none";
				  usermessagebtnClassEdit[j].style.display="inline";
			  }
		  })(i);
		}
	for(var i=0;i<usermessagebtnClassDelete.length;i++)
	{
		usermessagebtnClassDelete[i].onclick=(function(j){
			  return function() {
				  objTable[j]=this.parentNode.parentNode.parentNode;
				  objRow[j]= this.parentNode.parentNode;
				  objTable[j].deleteRow(objRow[j].rowIndex);
			  }
		  })(i);
	}
	for(var i=0;i < messagebtnClassDelete.length;i++)
	{
		messagebtnClassDelete[i].onclick=(function(j){
			  return function() {
				  objTable[j]=this.parentNode.parentNode.parentNode;
				  objRow[j]= this.parentNode.parentNode;
				  objTable[j].deleteRow(objRow[j].rowIndex);
			  }
		  })(i);
	}
}
document.getElementById("newSystemMessage").addEventListener("click", function () 
		{ 
	$("#show_newSystemmessage").show();
	$("#show_newUsersmessage").hide();
			});
document.getElementById("newUsersMessage").addEventListener("click", function () 
		{ 
	$("#show_newUsersmessage").show();
	$("#show_newSystemmessage").hide();
			});
document.getElementById("cancelBtn_send_usersMessage").addEventListener("click", function () { $("#show_newUsersmessage").hide(); });
document.getElementById("cancelBtn_send_systemMessage").addEventListener("click", function () { $("#show_newSystemmessage").hide(); });
</script>
</body>
</html>