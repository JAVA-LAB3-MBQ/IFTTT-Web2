<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="domain.Message"%>
<%@page language="java" import="web.formbean.MessageFormBean"%>
<%@page language="java" import="util.WebUtils"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看消息</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script src="2.0.0jquery.min.js"></script>
<script src="bootstrap.min.js"></script>
<style>
body {
		  background-size:100% 100%;
		   font-family: Verdana, Arial;}
div.header {
	                margin-left:120px;
	                margin-top:30px;
	             	height:60px;
	                width:1080px;
			}
div.headerr span
{
	font-size:18px;
}
 div.foot         {
    				 float: none;
    				 position: fixed;
                     bottom: 0;
                     left:600px;
    				}
	                  div#menus {float:right;
                margin-top:-10px;
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
                font-size:12px;
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
</style>
<script>
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

var messagesNum;
var messagesType = new Array();
var messagesContent = new Array();
var messagesId = new Array();
<%
ArrayList<Message> messages = ((MessageFormBean)(request.getAttribute("formbean"))).getMessages();
if(messages != null){
	for(int j = 0;j < messages.size(); j ++) {%>
    //alert("111");
    messagesType[<%=j%>] = '<%=WebUtils.messageTypeInt2String(messages.get(j).getMessageType())%>';
    messagesContent[<%=j%>] = '<%=messages.get(j).getMessageContent()%>';
    messagesId[<%=j%>] = '<%=messages.get(j).getMessageId()%>';
<%}
}%>
function showUserMessages() {
	alert("showUserMessages");
	var list = 	"<thead>" +
    		    "<tr>" +
    			"<th class = \"table_th\">Message ID</th>" +
    			"<th class = \"table_th\">Message Type</th>" +
    			"<th class = \"table_th\">Content</th>" +
 				"</tr>" +
				"</thead>" +
				"<tbody>";
	var i;
	messagesNum = '${formbean.messages.size()}';
	for(i = 0; i < messagesNum; i ++) {
		list += "<tr>" +
        		"<td class = \"table_th\">" + messagesId[i] + "</td>" +
        		"<td class = \"table_th\">" + messagesType[i] + "</td>" +
        		"<td class = \"table_th\">" + messagesContent[i] + "</td>" +
     			"</tr>";
	}
	list +=  "</tbody>";
	alert(list);
	document.getElementById("userMessagesTable").innerHTML = list;
}
</script>
</head>
<body>
<div class="header" >
    <img src="imag/logo.jpg">
    <span class = "header_info">Do Some Services for You</span>
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
    <img src="imag/line.jpg" />
</div>
<div class="Wrapper">
<div id = "table_div" style = "width:500px;margin-left:120px;">
<table id = "userMessagesTable" class="table"> </table>
<script>showUserMessages();</script>
</div>
</div>
<div class="foot">2015©MBQ</div>
</body>
</html>