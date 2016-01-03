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
    	//添加user
//    	User user1 = new User();
//    	user1.setId("u1");
//    	user1.setName("userone");
//    	user1.setUserEmailAddr("547504175@qq.com");
//    	user1.setUserEmailPwd("cozzrzxvntiebcdh");
//    	user1.setUserWeiboAccessToken("2.005a9yjB986STE65c5541eadH2CkfD");
//    	UserDaoImpl utmp = new UserDaoImpl();
//    	utmp.add(user1);
//    	微博->邮件
//    	TaskServiceImpl t = new TaskServiceImpl();
//    	IfThis thisWeibo = new IfThisListenWeibo("u1","一年又一年");
//    	thisWeibo.setThisId("this1");
//    	thisWeibo.setThisType(IfThis.thisListenWeiboTypeValue);
//    	thisWeibo.setThisInfo("if send weibo 一年又一年");
//    	ThenThat thatSendMail = new ThenThatSendMail("u1","547504175@qq.com","微博->邮件");
//    	thatSendMail.setThatId("that1");
//    	thatSendMail.setThatType(ThenThat.thatSendMailTypeValue);
//    	t.addTask("u1","task1","thatone",thisWeibo,thatSendMail);
//    	t.startTask("task1");
//    	
//    	//邮件->微博
//    	TaskServiceImpl t = new TaskServiceImpl();
//    	IfThis thisMail = new IfThisReceiveMail("u1");
//    	thisMail.setThisId("this2");
//    	thisMail.setThisType(IfThis.thisReceiveMailTypeValue);
//    	thisMail.setThisInfo("if this receive mail");
//    	ThenThat thatWeibo = new ThenThatSendWeibo("u1","= =");
//    	thatWeibo.setThatId("that2");
//    	thatWeibo.setThatType(ThenThat.thatSendWeiboTypeValue);
//    	t.addTask("u1","task2","thattwo",thisMail,thatWeibo);
//    	t.startTask("task2");
    	
    	//未发微博->邮件
//    	TaskServiceImpl t = new TaskServiceImpl();
//    	IfThisListenWeibo thisWeibo = new IfThisListenWeibo("u1");
//    	thisWeibo.setThisId("this3");
//    	thisWeibo.setThisType(IfThis.thisListenWeiboTypeValue);
//    	thisWeibo.setThisInfo("not send weibo");
//    	thisWeibo.setThisWeiboType(IfThisListenWeibo.IfThisListenWeiboTypeTwo);
//    	thisWeibo.setThisTimeLen("1");
//    	
//    	ThenThat thatSendMail = new ThenThatSendMail("u1","547504175@qq.com","微博->邮件");
//    	thatSendMail.setThatId("that3");
//    	thatSendMail.setThatType(ThenThat.thatSendMailTypeValue);
//    	
//    	t.addTask("u1","task3","thatone",thisWeibo,thatSendMail);
//    	t.startTask("task3");
    	
    	thread.TaskThread thread = new thread.TaskThread();
    	thread.start();
    	
//    	IfThis thisTime = new IfThisTime("this7","2015-12-27 21:40");
//    	ThenThat thatMail = new ThenThatSendMail("61","547504175@qq.com","send a mail ");
//    	thatMail.setThatId("that7");
//    	t.addTask("61", "task-7", "task-six", thisTime, thatMail);
//    	t.startTask("task-7");
//      dao.impl.UserDaoImpl tt = new dao.impl.UserDaoImpl();
//		tt.add(new User("61","my4","b","c",6,7,8,9,10,"547504175@qq.com","cozzrzxvntiebcdh","k","l","m"));
//
//    	TaskServiceImpl t = new TaskServiceImpl();
//    	IfThis this_ = new IfThisTime("2015-12-26 23:37");
//    	ThenThat that_ = new ThenThatSendMail("61","547504175@qq.com","fighting");
     
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
		String new_access_token;
		
		// get a new weibo access_token ?
		if(weiboId.equals(user.getUserWeiboId()) ) {
			new_access_token = WeiboAccessToken.getAccessToken(weiboId, weiboPwd);
		}
		else {
			new_access_token = WeiboAccessToken.refreshAccessToken(weiboId, weiboPwd);
		}
		
		// don't change user's id, money, level score
		// change user's information, constructing a new user
		user.setUserEmailAddr(mail);
		user.setUserEmailPwd(mailPwd);
		user.setUserWeiboPwd(weiboId);
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
}
