<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<table id="userInfoTable">
<tr>
<th>ID</th>
<th>Level</th>
<th>Money</th>
<th>Cost Record</th>
<th>Operate</th>
</tr>
<tr>
<td><input type="text" class="tableTd" value="Meimei" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="6" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="100" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="cost 20 last" disabled="disabled"></td>
<td>
<input type="button" class="usertableTdBtnEdit"  value="Edit">
<input type="button" class="usertableTdBtnSave"  value="Save" style="display:none;">
</td>
</tr>
<tr>
<td><input type="text" class="tableTd" value="Huihui" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="7" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="200" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="cost 30 last" disabled="disabled"></td>
<td>
<input type="button" class="usertableTdBtnEdit"  value="Edit">
<input type="button" class="usertableTdBtnSave"  value="Save" style="display:none;">
</td>
</tr>
<tr>
<td><input type="text" class="tableTd" value="Huihui" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="8" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="200" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="cost 30 last" disabled="disabled"></td>
<td>
<input type="button" class="usertableTdBtnEdit"  value="Edit">
<input type="button" class="usertableTdBtnSave"  value="Save" style="display:none;">
</td>
</tr>
<tr>
<td><input type="text" class="tableTd" value="Huihui" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="7" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="200" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="cost 30 last" disabled="disabled"></td>
<td>
<input type="button" class="usertableTdBtnEdit"  value="Edit">
<input type="button" class="usertableTdBtnSave"  value="Save" style="display:none;">
</td>
</tr>
</table>
<div id="table_page_tip" style="margin-top:10px;">
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
<table id="systemMessageInfoTable">
<tr>
<th>ID</th>
<th>Content</th>
<th>Operate</th>
</tr>
<tr>
<td><input type="text" class="tableTd" value="1" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="Happy New Year" disabled="disabled"></td>
<td><input type="button" class="messagetableTdBtnEdit"  value="Edit">
<input type="button" class="messagetableTdBtnSave"  value="Save" style="display:none;">
<input type="button" class="messagetableTdBtnDelete"  value="Delete">
</td>
</tr>  
<tr>
<td><input type="text" class="tableTd" value="1" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="Happy New Year" disabled="disabled"></td>
<td><input type="button" class="messagetableTdBtnEdit"  value="Edit">
<input type="button" class="messagetableTdBtnSave"  value="Save" style="display:none;">
<input type="button" class="messagetableTdBtnDelete"  value="Delete">
</td>
</tr>   
<tr>
<td><input type="text" class="tableTd" value="2" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="Happy New Year" disabled="disabled"></td>
<td><input type="button" class="messagetableTdBtnEdit"  value="Edit">
<input type="button" class="messagetableTdBtnSave"  value="Save" style="display:none;">
<input type="button" class="messagetableTdBtnDelete"  value="Delete">
</td>
</tr>   
</table> 
</div>
<div id="usersMessageInfo" style="display:none">
<span style="font-size:18px;">Table of UserMessages Info:</span>
<span><input type="button" value="New" id="newUsersMessage" style="margin-left:20px;"></span><br>
<table id="usersMessageInfoTable">
<tr>
<th>ID</th>
<th>UserId</th>
<th>Content</th>
<th>Operate</th>
</tr>
<tr>
<td><input type="text" class="tableTd" value="1" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="meimei" disabled="disabled"></td>
<td><input type="text" class="tableTd" value="Happy New Year" disabled="disabled"></td>
<td><input type="button" class="usermessagetableTdBtnEdit"  value="Edit">
<input type="button" class="usermessagetableTdBtnSave"  value="Save" style="display:none;">
<input type="button" class="usermessagetableTdBtnDelete"  value="Delete">
</td>
</tr>   
</table> 
</div>
<div id="table_page_tip" style="margin-top:10px;margin-bottom:10px;">
        <button id="pre_page" disabled="disabled">上一页</button>
        <button id="next_page" disabled="disabled">下一页</button>
    </div>
</div>
<div id="show_newSystemmessage" class="window_form" >
                    <span class="editTitle_1">New System Message:</span>
                    <form action="" method="post" id="editForm_mail">
                       <p></p>
                       Content：<textarea rows="5" cols="22"></textarea><br />
                       <input type="submit" id="submitBtn_send_systemMessage" value="commit" style="margin-left:76px;">
                       <input type="button" id="cancelBtn_send_systemMessage" value="cancle" style="margin-left:62px;">
                    </form>
            </div>
            <div id="show_newUsersmessage" class="window_form">
                    <span class="editTitle_1">New Users Message:</span>
                    <form action="" method="post" id="editForm_mail">
                       <p></p>
                       User：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name=""  class="ipt" /><br />
                       Content：<textarea rows="5" cols="22"></textarea><br />
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