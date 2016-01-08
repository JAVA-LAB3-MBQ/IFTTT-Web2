package web.ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.MessageServiceImpl;
import service.impl.UserServiceImpl;
import web.formbean.ManagerFormBean;

/**
 * Servlet implementation class ManagerUIServlet
 */
@WebServlet("/ManagerUIServlet")
public class ManagerUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// formbean
		ManagerFormBean formbean = new ManagerFormBean();
		UserServiceImpl uservice = new UserServiceImpl();
		MessageServiceImpl mservice = new MessageServiceImpl();
		formbean.setUsers(uservice.getUserList());
		formbean.setMessages(mservice.getAllMessages());
		request.setAttribute("formbean", formbean);
				
		// jump 
		request.getRequestDispatcher("/Manager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
