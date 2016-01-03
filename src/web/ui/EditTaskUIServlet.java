package web.ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.formbean.*;
import service.impl.*;
import domain.*;
/**
 * Servlet implementation class EditTaskUIServlet
 */
@WebServlet("/EditTaskUIServlet")
public class EditTaskUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTaskUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // test
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// get userId, selectedTask
    	String userId = request.getParameter("userId");
    	String taskId = request.getParameter("taskId");
    	System.out.println("editTaskUIS " + userId + " " + taskId);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId, selectedTask
		String userId = request.getParameter("userId");
		String taskId = request.getParameter("taskId");
		
		// construct formbean
		UserSelectTaskFormBean formbean = new UserSelectTaskFormBean();
		TaskServiceImpl tservice = new TaskServiceImpl();
		Task selectedTask = tservice.getTask(taskId);
		formbean.setUserId(userId);
		formbean.setSelectedTask(selectedTask);
		request.setAttribute("formbean", formbean);
		
		// jump to EditTask.jsp
		request.getRequestDispatcher("/EditTask.jsp").forward(request, response);
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
