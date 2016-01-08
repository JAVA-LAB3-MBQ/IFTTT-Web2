package web.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.impl.MessageServiceImpl;
import service.impl.UserServiceImpl;
import util.IdGeneratorUtil;
import util.WebUtils;
import web.formbean.ManagerFormBean;
import web.formbean.MessageFormBean;
import web.formbean.UserInfoFormBean;
import domain.Message;
/**
 * Servlet implementation class AddMessageServlet
 */
@WebServlet("/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get form
		MessageFormBean form = WebUtils.request2Bean(request, MessageFormBean.class);
		
		// toUserId
		String toUserName = form.getToUserName();
		String toUserId;
		UserServiceImpl uservice = new UserServiceImpl();
		int mType = form.getMessageIntType();
		if(mType == Message.messagePublicTypeValue) {
			toUserId = "ALL";
		}
		else {
			User user = uservice.getUserInfoByName(toUserName);
			toUserId = user.getUserId();
		}
		
		// generate a message
		Message m = new Message();
		m.setMessageContent(form.getMessageContent());
		m.setMessageFromUserId(form.getFromUserId());
		m.setMessageToUserId(toUserId);
		m.setMessageType(mType);
		m.setMessageId(IdGeneratorUtil.makeId());
		
	    // send it and get new messages' list
		MessageServiceImpl mservice = new MessageServiceImpl();
		ArrayList<Message> messages = mservice.sendMessage(m);
		
		// formbean
		ManagerFormBean formbean = new ManagerFormBean();
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
