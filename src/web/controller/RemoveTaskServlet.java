package web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Task;
import service.impl.TaskServiceImpl;
import service.impl.UserServiceImpl;
import web.formbean.UserTasksFormBean;

/**
 * Servlet implementation class RemoveTaskServlet
 */
@WebServlet("/RemoveTaskServlet")
public class RemoveTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveTaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // test
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// get userId, selectedTask
    	String userId = request.getParameter("userId");
    	String taskId = request.getParameter("taskId");
    	System.out.println("removeTaskS " + userId + " " + taskId);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId and taskId
		String userId = request.getParameter("useId");
		String taskId = request.getParameter("taskId");
				
		// pause it
		TaskServiceImpl tservice = new TaskServiceImpl();
		tservice.removeTask(taskId);
			    
		// construct formbean
		ArrayList<Task> tasks = (new UserServiceImpl()).getUserTasks(userId);
		UserTasksFormBean formbean = new UserTasksFormBean();
		formbean.setUserId(userId);
		formbean.setUserTasks(tasks);
		request.setAttribute("formbean", formbean);
			    
		// jump to UserTasks.jsp
		request.getRequestDispatcher("/UserTasks.jsp").forward(request, response);;
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
