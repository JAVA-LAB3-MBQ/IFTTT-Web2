package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.*;

import java.util.Date;

import service.impl.UserServiceImpl;
import service.IUserService;
import domain.User; 

import web.formbean.RegisterFormBean;
import util.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In RegistrServlet\n");
	
		RegisterFormBean formbean = WebUtils.request2Bean(request,RegisterFormBean.class);
		// check
		if (formbean.isRegiInfoValid() == false) {// failed, show errors (in formbean) in the register page 
			System.out.println("info false");
			request.setAttribute("formbean", formbean);
			request.getRequestDispatcher("/Register.jsp").forward(request, response);
			return;
		}

		try {
			System.out.println("info right");

		    User user = new User();
		    user.setName(formbean.getUserName());
		    user.setPwd(formbean.getUserPwd());
		    System.out.println("Register Servlet " + user.getName());
		    user.setId(IdGeneratorUtil.makeId()); // user's id
		    user.setRegisterTime(DateStringUtil.date2String(new Date())); // current time
		    user.setUserLevel(1);
		    user.setUserRole(User.generalUserTypeValue);
		    user.setUserScore(10);
		    user.setUserMoney(100);
		    user.setUserStatus(User.loggedOut);
		    
		    // registering an user	
		    IUserService service = new UserServiceImpl();
		    user = service.registerUser(user);
		    if( user == null ){ // failed
		    	// todo:
			
		    }
		    else { // successfully
		    	request.getRequestDispatcher("/Login.jsp").forward(request, response);
		    }
		}
		catch(Exception e) {
		    // todo:
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
