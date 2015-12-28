package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.formbean.UserMainFormBean;
import service.impl.UserServiceImpl;
import domain.User;

/**
 * Servlet implementation class UserReturnServlet
 */
@WebServlet("/UserReturnServlet")
public class UserReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReturnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get userId
		String userId = request.getParameter("userId");
		
		// construct formbean
		UserServiceImpl service = new UserServiceImpl();
		User user = service.getUserInfo(userId);
		UserMainFormBean formbean = new UserMainFormBean();
		formbean.setUserId(userId);
		formbean.setUserLevel(String.format("%d", user.getUserLevel()));
		formbean.setUserName(user.getName());
		request.setAttribute("formbean", formbean);
		
		// jump to UserMain.jsp
		request.getRequestDispatcher("/UserMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
