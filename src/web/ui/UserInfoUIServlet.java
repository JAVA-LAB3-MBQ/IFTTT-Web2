package web.ui;

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
 * Servlet implementation class UserInfoUIServlet
 */
@WebServlet("/UserInfoUIServlet")
public class UserInfoUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in UserInfoUIServlet");
		// get userId
		String userId = request.getParameter("userId");
		System.out.println("userId: " + userId);
		// get the user
		UserServiceImpl service = new UserServiceImpl();
		User user = service.getUserInfo(userId);
		
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
		request.setAttribute("formbean", formbean);
				
		// test
		formbean.printAll();
		
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
