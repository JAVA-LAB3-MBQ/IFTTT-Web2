package web.ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import service.impl.UserServiceImpl;
import web.formbean.UserTasksFormBean;
import web.formbean.*;
import service.impl.*;
import domain.*;
/**
 * Servlet implementation class UserTasksUIServlet
 */
@WebServlet("/UserTasksUIServlet")
public class UserTasksUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserTasksUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    // test
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	System.out.println("enter UserTasksUIServlet: userId: "+request.getParameter("UserId"));
//    	UserTasksFormBean formbean = new UserTasksFormBean();
//    	
//    	// tasks for test
//    	ArrayList<Task> tasks = new ArrayList<Task>();
//    	Task task1 = new Task();
//    	task1.setTaskName("t1");
//    	task1.setThisIconPath("imag/clock.png");
//    	task1.setThatIconPath("imag/weibo.jpg");
//    	task1.setThisInfo("timing");
//    	task1.setThatInfo("send weibo, content: i love nju cs 12345678910101010010101001010010101001");
//    	task1.setTaskId("1");
//    	tasks.add(task1);
//    	
//    	Task task2 = new Task();
//    	task2.setTaskName("t2");
//    	task2.setThisIconPath("imag/clock.png");
//    	task2.setThatIconPath("imag/weibo.jpg");
//    	task2.setThisInfo("timing");
//    	task2.setThatInfo("send weibo");
//    	task2.setTaskId("12");
//    	tasks.add(task2);
//    	
//    	Task task3 = new Task();
//    	task3.setTaskName("t3");
//    	task3.setThisIconPath("imag/clock.png");
//    	task3.setThatIconPath("imag/mail.png");
//    	task3.setThisInfo("Timing 2015-12-25");
//    	task3.setThatInfo("send weibo, content: i love you");
//    	task3.setTaskId("123");
//    	tasks.add(task3);
//    	
//    	Task task4 = new Task();
//    	task4.setTaskName("t4");
//    	task4.setThisIconPath("imag/weibo.jpg");
//    	task4.setThatIconPath("imag/weibo.jpg");
//    	task4.setThisInfo("timing");
//    	task4.setThatInfo("send weibo");
//    	task4.setTaskId("1234");
//    	tasks.add(task4);
//    	
//    	formbean.setUserTasks(tasks);
//    	formbean.setUserId("xbq");
//    	request.setAttribute("formbean", formbean);
//    	request.setAttribute("uT", tasks);
//    	request.getRequestDispatcher("/UserTasks.jsp").forward(request, response);
//    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId
		String userId = request.getParameter("userId");
		
		// get the user
		UserServiceImpl service = new UserServiceImpl();
		User user = service.getUserInfo(userId);
		
		// construct formbean
		UserTasksFormBean formbean = new UserTasksFormBean();
		formbean.setUserTasks((new UserServiceImpl()).getUserTasks(userId));
		formbean.setUserId(userId);
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
