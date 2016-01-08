package web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Message;
import service.impl.MessageServiceImpl;
import service.impl.UserServiceImpl;
import web.formbean.ManagerFormBean;

/**
 * Servlet implementation class DeleteMessageServlet
 */
@WebServlet("/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get messageId
		String messageId = request.getParameter("messageId");
		
		// delete it
		MessageServiceImpl mservice = new MessageServiceImpl();
		ArrayList<Message> messages = mservice.deleteMessage(messageId);
		
		// formbean
		ManagerFormBean formbean = new ManagerFormBean();
		UserServiceImpl uservice = new UserServiceImpl();
		formbean.setUsers(uservice.getUserList());
		formbean.setMessages(messages);
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
