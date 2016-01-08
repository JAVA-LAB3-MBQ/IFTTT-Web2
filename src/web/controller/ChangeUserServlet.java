package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.impl.MessageServiceImpl;
import service.impl.UserServiceImpl;
import util.WebUtils;
import web.formbean.ManagerFormBean;
import web.formbean.MessageFormBean;

/**
 * Servlet implementation class ChangeUserServlet
 */
@WebServlet("/ChangeUserServlet")
public class ChangeUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId
		String userId = request.getParameter("userId");
		// maybe changes
		String userLevel = request.getParameter("userLevel");
		String userMoney = request.getParameter("userMoney");
		
		// change user
		UserServiceImpl uservice = new UserServiceImpl();
		User user = uservice.getUserInfo(userId);
		user.setUserLevel(Integer.parseInt(userLevel));
		user.setUserMoney(Integer.parseInt(userMoney));
		uservice.changeUser(userId, user);
		
		// formbean
		ManagerFormBean formbean = new ManagerFormBean();
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
