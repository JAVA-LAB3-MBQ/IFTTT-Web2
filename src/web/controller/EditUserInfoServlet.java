package web.controller;
import domain.User;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.formbean.*;
import util.WebUtils;
import domain.User;
import service.impl.UserServiceImpl;

/**
 * Servlet implementation class EditUserInfoServlet
 */
@WebServlet("/EditUserInfoServlet")
public class EditUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get form
		UserInfoFormBean form = WebUtils.request2Bean(request, UserInfoFormBean.class);
		
		// change user's information
		UserServiceImpl service = new UserServiceImpl();
		User user = service.editUserInfo(form.getUserId(), form.getUserMail(), form.getUserMailPwd(), 
							form.getUserWeiboId(), form.getUserWeiboPwd());
		
		// construct formbean
		UserMainFormBean formbean = new UserMainFormBean();
		formbean.setUserId(user.getUserId());
		formbean.setUserLevel(String.format("%d", user.getUserLevel()));
		formbean.setUserName(user.getName());
		request.setAttribute("formbean", formbean);
						
		// jump to UserMain.jsp
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
