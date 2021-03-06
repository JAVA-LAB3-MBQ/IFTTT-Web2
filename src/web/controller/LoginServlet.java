package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.MessageServiceImpl;
import service.impl.UserServiceImpl;
import web.formbean.ManagerFormBean;
import web.formbean.UserMainFormBean;
import domain.User; 
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // test
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.getRequestDispatcher("/UserMain.jsp").forward(request, response);
//    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in LoginServlet doget");
		String username = request.getParameter("username");
				
		String password = request.getParameter("password");
		
		System.out.println("in LoginServlet, username and password: " + username + password);
		
		UserServiceImpl service = new UserServiceImpl();
				
		User user = service.loginUser(username, password);
		
		System.out.println("after service.loginUser");
		
		if(user != null){ // successed
			System.out.println("login successfully");
		    
			if(user.getUserRole() == user.generalUserTypeValue) {
				// construct formbean
				UserMainFormBean formbean = new UserMainFormBean();
				formbean.setUserId(user.getUserId());
				formbean.setUserLevel(String.format("%d", user.getUserLevel()));
				formbean.setUserScore(String.format("%d", user.getUserScore()));
				formbean.setUserName(user.getName());
				request.setAttribute("formbean", formbean);
			
				// jump to UserMain.jsp
				request.getRequestDispatcher("/UserMain.jsp").forward(request, response);
			}
			else if(user.getUserRole() == user.superUserTypeValue) { // manager
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
		}
		else { // failed
			// todo: 	
			System.out.println("in LoginServlet, user==null");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
