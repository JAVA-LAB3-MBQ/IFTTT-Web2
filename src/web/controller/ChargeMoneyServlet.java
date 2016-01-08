package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.impl.UserServiceImpl;
import web.formbean.UserInfoFormBean;

/**
 * Servlet implementation class ChargeMoneyServlet
 */
@WebServlet("/ChargeMoneyServlet")
public class ChargeMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChargeMoneyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId and addMoney
		int addMoney = Integer.parseInt(request.getParameter("addMoney"));
		String userId = request.getParameter("userId");
		
		// change user
		UserServiceImpl uservice = new UserServiceImpl();
		User user = uservice.getUserInfo(userId);
		user.setUserMoney(user.getUserMoney() + addMoney);
		uservice.changeUser(userId, user);
		
		// construct formbean
		UserInfoFormBean formbean = new UserInfoFormBean();
		formbean.setUserLevel(String.format("%d",user.getUserLevel()));
		formbean.setUserMail(user.getUserEmailAddr());
		formbean.setUserId(userId);
		formbean.setUserMailPwd(user.getUserEmailPwd());
		formbean.setUserName(user.getName());
		formbean.setUserMoney(String.format("%d", user.getUserMoney()));
		formbean.setUserScore(String.format("%d", user.getUserScore()));
		formbean.setUserWeiboId(user.getUserWeiboId());
		formbean.setUserWeiboPwd(user.getUserWeiboPwd());
		formbean.setUserWeiboAccessToken(user.getUserWeiboAccessToken());
		request.setAttribute("formbean", formbean);
				
		// jump to UserTasks.jsp
		request.getRequestDispatcher("/UserInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
