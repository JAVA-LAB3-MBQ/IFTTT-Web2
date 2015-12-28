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
 * Servlet implementation class EditUserInfoUIServlet
 */
@WebServlet("/EditUserInfoUIServlet")
public class EditUserInfoUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserInfoUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId
		String userId = request.getParameter("userId");
		
		// get the user
		UserServiceImpl service = new UserServiceImpl();
		User user = service.getUserInfo(userId);
		
		// construct the formbean
		UserInfoFormBean formbean = new UserInfoFormBean();
		formbean.setUserMail(user.getUserEmailAddr());
	    formbean.setUserMailPwd(user.getUserEmailPwd());
	    formbean.setUserWeiboId(user.getUserWeiboId());
	    formbean.setUserWriboPwd(user.getUserWeiboPwd());
	    formbean.setUserMoney(String.format("%d", user.getUserMoney()));
	    request.setAttribute("formbean", formbean);
	    
	    // jump to EditUserInfo.jsp
	    request.getRequestDispatcher("/EditUserInfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
