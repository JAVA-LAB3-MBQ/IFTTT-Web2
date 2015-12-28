<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="main1.css" />
    <script type="text/javascript" src="jquery-2.1.4.js"></script>   
</head>
<body>
    <div id="logo">
        <img src="${pageContext.request.contextPath}/imag/7.jpg">
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
                        <span id="taskId">1.</span>
                        <span>
                            &nbsp;if&nbsp;
                            <!--<div id="primaryObj" style="position: absolute; left:15%;">-->
                            <img src="${pageContext.request.contextPath}/imag/clock.png" style="padding-top:6px;width:80px;height:70px;" />
                            &nbsp;then
                            <img src="${pageContext.request.contextPath}/imag/weibo.jpg" style="width:80px;height:70px;" />
                        </span>
                        <span style="font-size:12px;position:absolute;top:100%;left:18%; text-align:center;width:80px;height:auto;">every day 7:00 pm</span>
                        <span style="font-size:12px;position:absolute;top:100%;left:49%;text-align:center;width:80px;">MyDarlinghh send a weibo </span>
                        <div id="edit_icons">
                            <a href="#" id=""><img src="${pageContext.request.contextPath}/imag/Pause.png" width="60" height="50" /></a>
                            <a href="#"><img src="${pageContext.request.contextPath}/imag/Edit.png" width="60" height="50" /></a>
                            <a href="#"><img src="${pageContext.request.contextPath}/imag/Delete.png" width="60" height="50" /></a>
                            <span id="taskTimetip">created about 1 hours ago</span>
                        </div>
                    </div>
            </li>
            <li>
                <div id="Taskinfo_1">
                    <span id="taskId">2.</span>
                    <span>
                        &nbsp;if&nbsp;
                        <img src="${pageContext.request.contextPath}/imag/mail.png" style="padding-top:6px;width:80px;height:70px;" />
                        &nbsp;then
                        <img src="${pageContext.request.contextPath}/imag/weibo.jpg" style="width:80px;height:70px;" />
                    </span>
                    <span style="font-size:12px;position:absolute;top:95%;left:18%; text-align:center;width:80px;">nj_txh@163.com recieved a mail</span>
                    <span style="font-size:12px;position:absolute;top:95%;left:49%;text-align:center;width:80px;">MyDarlinghh send a weibo </span>
                    <div id="edit_icons">
                        <img src="${pageContext.request.contextPath}/imag/Pause.png" width="60" height="50" />
                        <a href="#"><img src="${pageContext.request.contextPath}/imag/Edit.png" width="60" height="50" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/imag/Delete.png" width="60" height="50" /></a>
                        <span id="taskTimetip">created about 2 hours ago</span>
                    </div>
                </div>
            </li>
            <li>
                <div id="Taskinfo_2">
                    <span id="taskId">3.</span>
                    <span>
                        &nbsp;if&nbsp;
                        <img src="${pageContext.request.contextPath}/imag/weibo.jpg" style="padding-top:6px;width:80px;height:70px;" />
                        &nbsp;then
                        <img src="${pageContext.request.contextPath}/imag/mail.png" style="width:80px;height:70px;" />
                    </span>
                    <span style="font-size:12px;position:absolute;top:95%;left:18%; text-align:center;width:80px;">MyDarlinghh send a weibo:"hello world"</span>
                    <span style="font-size:12px;position:absolute;top:95%;left:49%;text-align:center;width:80px;">send a mail to nj_txh@163.com </span>
                    <div id="edit_icons">
                        <a href="#" id=""><img src="${pageContext.request.contextPath}/imag/Pause.png" width="60" height="50" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/imag/Edit.png" width="60" height="50" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/imag/Delete.png" width="60" height="50" /></a>
                        <span id="taskTimetip">created about 3 hours ago</span>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <span id="page_tip">
        <button id="pre_page" disabled="disabled">上一页</button>
        <button id="next_page" disabled="disabled">下一页</button>
    </span>
    <div style="position:absolute;top:30%;right:3%;">
        <a><img src="${pageContext.request.contextPath}/imag/createTask.png" id="createTask_img"/></a>
    </div>
</body>
</html>