package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.formbean.*;
import service.impl.*;
import domain.*;
import util.*;
/**
 * Servlet implementation class CreateTaskServlet
 */
@WebServlet("/CreateTaskServlet")
public class CreateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // test 
    /*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("enter CreateTaskServlet, line 32");
    	ATaskFormBean form = WebUtils.request2Bean(request, ATaskFormBean.class);
		String userId = form.getUserId();
		form.printAll();
    }*/
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ATaskFormBean form = WebUtils.request2Bean(request, ATaskFormBean.class);
		String userId = form.getUserId();
		
		int	thisType = form.getThisTypeInt();
		int	thatType = form.getThatTypeInt();
		
 		IfThis this_ = null;
		ThenThat that_ = null;
		
		// this
		switch(thisType) {
		case IfThis.thisReceiveMailTypeValue : { 
			this_ = new IfThisReceiveMail(userId); 
			break;
		}
		case IfThis.thisTimeTypeValue : {
            this_ = new IfThisTime(form.getGoalTime()); 
			break;
		}
		case IfThis.thisListenWeiboTypeValue : {
             this_ = new IfThisListenWeibo(userId,form.getListenWbId(), form.getListenWbPwd(), 
            		 form.getListenWbText(), form.getListenTimeLen());
             
             System.out.println(form.getListenWbText()==null);
             System.out.println(form.getListenTimeLen()==null);
             System.out.println(form.getListenWbText().length());
             System.out.println(form.getListenTimeLen().length());
             System.out.println(form.getListenWbText());
             System.out.println(form.getListenTimeLen());
			 break;
		}
		 default: System.out.println("Unknown ThisType");
		}
		
	 // that
	  switch(thatType) {
	  case ThenThat.thatSendMailTypeValue: {
		  that_ = new ThenThatSendMail(userId, form.getDestMailAddr(), form.getSendMailContent());
		  break;
	  }
	  case ThenThat.thatSendWeiboTypeValue: {
		  that_ = new ThenThatSendWeibo(userId, form.getSendWeiboContent());
		  break;
	  }
	  default: System.out.println("Unknown ThatType");
	  }
	  
	  // this_ and that_ 's id
	  this_.setThisId(IdGeneratorUtil.makeId());
	  that_.setThatId(IdGeneratorUtil.makeId());
	  
	  // this_ and that_'s icon path
	  this_.setThisIconPath(form.getThisIconPath());
	  that_.setThatIconPath(form.getThatIconPath());
	  
	  // add a task
	  TaskServiceImpl tservice = new TaskServiceImpl();
	  tservice.addTask(userId, IdGeneratorUtil.makeId(), form.getTaskName(), this_, that_);
		
	  // construct form
	  UserTasksFormBean formbean = new UserTasksFormBean();
	  formbean.setUserId(userId);
	  formbean.setUserTasks((new UserServiceImpl()).getUserTasks(userId));
	  request.setAttribute("formbean", formbean);
		
	  // jump to UserTasks.jsp
	  request.getRequestDispatcher("/UserTasks.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
