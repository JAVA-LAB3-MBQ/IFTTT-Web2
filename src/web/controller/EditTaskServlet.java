package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.IfThis;
import domain.IfThisListenWeibo;
import domain.IfThisReceiveMail;
import domain.IfThisTime;
import domain.ThenThat;
import domain.ThenThatSendMail;
import domain.ThenThatSendWeibo;
import service.impl.TaskServiceImpl;
import service.impl.UserServiceImpl;
import util.IdGeneratorUtil;
import util.WebUtils;
import web.formbean.ATaskFormBean;
import web.formbean.UserTasksFormBean;

/**
 * Servlet implementation class EditTaskServlet
 */
@WebServlet("/EditTaskServlet")
public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ATaskFormBean form = WebUtils.request2Bean(request, ATaskFormBean.class);
		String userId = form.getUserId();
		
		int thisType = -1, thatType = -1;
		try {
			thisType = form.getThisTypeInt();
			thatType = form.getThatTypeInt();
		} catch( NumberFormatException e ) {
			
		}
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
             this_ = new IfThisListenWeibo(form.getListenWbId(), form.getListenWbPwd(), 
            		 form.getListenWbText(), form.getListenTimeLen());
             
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
	  
	    // this_ and that_ 's icon path
	    this_.setThisIconPath(form.getThisIconPath());
	    that_.setThatIconPath(form.getThatIconPath());
	    
	    // add a task
	    TaskServiceImpl tservice = new TaskServiceImpl();
	    tservice.editTask(userId, form.getTaskId(), form.getTaskName(), this_, that_);
		
	    // construct formbean
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
