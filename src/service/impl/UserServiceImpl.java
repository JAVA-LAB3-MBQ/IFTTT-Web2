package service.impl;

import domain.IfThis;
import domain.IfThisReceiveMail;

import domain.Task;
import domain.ThenThat;
import domain.User;
import service.IUserService;
import util.WeiboAccessToken;
import dao.impl.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import domain.IfThisTime;
import domain.Message;
import domain.IfThisListenWeibo;
import domain.ThenThatSendMail;
import domain.ThenThatSendWeibo;
import thread.TaskThread;
public class UserServiceImpl implements IUserService {
    public static void main(String args[]){  
    	thread.TaskThread thread = new thread.TaskThread();
    	thread.start();
    }
    
    
	public User registerUser(User user)throws Exception{
		try{
		    Class.forName("com.mysql.jdbc.Driver") ; 
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		    System.out.println("Driver Class Not Found, Loader Failure！");  //找不到驱动程序类 ，加载驱动失败
		}  
	    try{ 
	    	Connection con =     
	    			DriverManager.getConnection(domain.DatabaseInfo.url , domain.DatabaseInfo.username , domain.DatabaseInfo.password ) ; 
	    
	    	Statement statement = con.createStatement();
	    	
	    	String statementString1 = "select * from user where userName = \"" + user.getName() + "\"" ;
	    	ResultSet resultSet = 
	    			statement.executeQuery(statementString1);
	    	if(resultSet.next()){
	    		System.out.println(" in register The user name has already exists!");
	    		return null;
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
	    UserDaoImpl m = new UserDaoImpl();
		m.add(user);
		return user;
		
	}
	
	public User getUserInfoByName(String userName) {
		UserDaoImpl udb = new UserDaoImpl();
		return udb.findByName(userName);
	}
	
	public User loginUser(String userName, String userPwd){
		UserDaoImpl t = new UserDaoImpl();
		User user = t.find(userName, userPwd);
		if(user != null) {
			t.changeUserStatus(user.getUserId(), User.loggedIn); // from User.loggedOut to User.loggedIn
		}
		
		return user;
	}	
	
	public User getUserInfo(String uId) {
		UserDaoImpl udb = new UserDaoImpl();
		User user = udb.find(uId);
		
		return user;
	}
	
	public ArrayList<Task> getUserTasks(String userId) {
		TaskDaoImpl tdb = new TaskDaoImpl();
		ArrayList<Task> tasks = tdb.getTasks(userId);
		return tasks;
	}
	public ArrayList<Message> getUserMessages(String userId){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		return t.getMessages(userId);
	}
	public ArrayList<User>  getUserList(){
		dao.impl.UserDaoImpl t = new dao.impl.UserDaoImpl();
		return t.getUsers();
	}
	public User editUserInfo(String uId, String mail, String mailPwd, String weiboId, String weiboPwd) {
		UserDaoImpl udb = new UserDaoImpl();
		User user = udb.find(uId);
		String new_access_token = null;
		
		// get a new weibo access_token ?
		if(weiboId.equals(user.getUserWeiboId()) ) {
			//new_access_token = WeiboAccessToken.refreshAccessToken(weiboId, weiboPwd);
			new_access_token = user.getUserWeiboAccessToken();
		}
		else { // a new weibo id
			System.out.println("in UserServiceImpl line 165 getAccessToken");
			try {
				new_access_token = WeiboAccessToken.getAccessToken(weiboId, weiboPwd);
			}
			catch(Exception e) {
				System.out.println("get access token failed");
			}
		}
		
		// don't change user's id, money, level score
		// change user's information, constructing a new user
		user.setUserEmailAddr(mail);
		user.setUserEmailPwd(mailPwd);
		user.setUserWeiboId(weiboId);
		user.setUserWeiboPwd(weiboPwd);
		user.setUserWeiboAccessToken(new_access_token);
		
		// remove old user
		udb.remove(uId);
		// add new user
		udb.add(user);
		
		return user;
	}
	
	public void signOut(String userId) {
		// change user's status from loggedIn to loggedOut in database
		UserDaoImpl udb = new UserDaoImpl();
		udb.changeUserStatus(userId, User.loggedOut);
	}
	
	public ArrayList<User> changeUser(String userId, User newUser){
		dao.impl.UserDaoImpl t = new dao.impl.UserDaoImpl();
		t.remove(userId);
		t.add(newUser);
		return getUserList();
	}	
}
