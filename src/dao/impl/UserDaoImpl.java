package dao.impl;

import domain.User;
import domain.DatabaseInfo;
import dao.IUserDao;
import java.sql.*;
import java.lang.Integer;

public class UserDaoImpl implements IUserDao{
	String url = "jdbc:mysql://localhost:3306/java" ;   
    String username = DatabaseInfo.username ;    
    String password = DatabaseInfo.password ; 
   
	public User find(String userName, String userPwd){
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
	    	ResultSet res = 
	    			statement.executeQuery("select * from user where userName = \"" + userName + "\" && userPwd = \"" + userPwd + "\"");
	    	if(res.next()){
	    		User t = new User(res.getString("userId"),res.getString("userName"),res.getString("userPwd"),res.getString("registerTime"),
						Integer.parseInt(res.getString("userLevel")),Integer.parseInt(res.getString("userScore")),Integer.parseInt(res.getString("userRole")),Integer.parseInt(res.getString("userStatus")),Integer.parseInt(res.getString("userMoney")),
						res.getString("userEmailAddr"),res.getString("userEmailPwd"),res.getString("userWeiboId"),res.getString("userWeiboAccessToken"),res.getString("userWeiboPwd"));
				
	    		return t;
	    	}	
	    }
	    catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	    }  
	    return null;
	}
	
	public User find(String userId) {
		// todo : get the user 
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("Driver Class Not Fount, Loader Failure!");
		}
		try{
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url, domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			Statement statement = con.createStatement();
			String query = "select * from User where userId = \"" + userId + "\";";
			System.out.println(query);
			ResultSet res = statement.executeQuery(query);
			if(res.next()){
				domain.User user = new domain.User(res.getString("userId"),res.getString("userName"),res.getString("userPwd"),res.getString("registerTime"),
						Integer.parseInt(res.getString("userLevel")),Integer.parseInt(res.getString("userScore")),Integer.parseInt(res.getString("userRole")),Integer.parseInt(res.getString("userStatus")),Integer.parseInt(res.getString("userMoney")),
						res.getString("userEmailAddr"),res.getString("userEmailPwd"),res.getString("userWeiboId"),res.getString("userWeiboAccessToken"),res.getString("userWeiboPwd"));
				return user;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public void add(User user){
		try{
		    Class.forName("com.mysql.jdbc.Driver") ; 
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		    System.out.println("Driver Class Not Found, Loader Failure!");  //找不到驱动程序类 ，加载驱动失败
		}  
	    try{    
	    	Connection con =     
	    			DriverManager.getConnection(domain.DatabaseInfo.url , domain.DatabaseInfo.username , domain.DatabaseInfo.password ) ;    
	    	Statement statement = con.createStatement();
	    	
	    	String statementString1 = "select * from user where userName = \"" + user.getName() + "\"" ;
	    	ResultSet resultSet = 
	    			statement.executeQuery(statementString1);
	    	if(resultSet.next()){
	    		System.out.println("The user name has already exists!");
	    		return;
	    	}
	    	String statementString2 = "insert into user values(\"" + user.getUserId() + "\",\"" + user.getName() + "\",\"" + user.getPwd() + "\",\"" + user.getRegisterTime() + "\","
	    			+ user.getUserLevel() + "," + user.getUserScore() + "," + user.getUserRole() + "," + user.getUserStatus() + "," + user.getUserMoney() + ","
	    			+ "\"" + user.getUserEmailAddr() + "\",\"" + user.getUserEmailPwd() + "\",\"" + user.getUserWeiboId() + "\",\"" + user.getUserWeiboAccessToken() + "\",\"" + user.getUserWeiboPwd() + "\")";
	    	statement.executeUpdate(statementString2);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }   
	}
	public boolean remove(String userId){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("Driver Class Not Fount, Loader Failure!");
		}
		try{
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url, domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			Statement statement = con.createStatement();
			String update = "delete from User where userId = \"" + userId + "\";";
			statement.executeUpdate(update);
			return true;
		}
		catch(Exception e){
			
		}
		return false;
	}
	public boolean changeUserStatus(String userId,int newStatus){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("Driver Class Not Fount, Loader Failure!");
		}
		try{
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url, domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			Statement statement = con.createStatement();
			String update = "SET SQL_SAFE_UPDATES = 0; "
					+ "update User set userStatus = " + newStatus + " where userId = \"" + userId + "\";";
		
			statement.executeUpdate(update);
			return true;
		}
		catch(Exception e){
			
		}
		return false;
	}
}
