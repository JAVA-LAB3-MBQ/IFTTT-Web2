package dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import dao.IThisDao;
import domain.IfThisListenWeibo;
import domain.IfThisReceiveMail;
import domain.IfThisTime;
import domain.*;
import domain.IfThisListenWeibo;
public class ThisDaoImpl implements IThisDao{
	public void setEmailCount(IfThisReceiveMail this_, int count){
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
	    	String statementString = "update IfThisReceiveMail set thisEmailCount = " + count + " where thisId = \"" + this_.getThisId() + "\"";
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
	}
	public void setWeiboCount(IfThisListenWeibo this_, long count){
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
	    	String statementString = "update IfThisListenWeibo set thisWeiboCount = " + count + " where thisId = \"" + this_.getThisId() + "\"";
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
	}
	public boolean addThis(IfThisListenWeibo this_) {
		// todo: add IfThisListWeibo condition to db
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
	    	
	    	String statementString = "insert into IfThisListenWeibo values(\"" + this_.getThisId() + "\"," + this_.getThisType() + ",\"" + this_.getThisWeiboId() + "\",\"" + this_.getThisWeiboAccessToken() + "\",\"" + this_.getThisWeiboContent() + "\",\""  + this_.getThisWeiboCount() + "\",\"" + this_.getThisTimeLen() + "\"," + this_.getThisWeiboType() + ",\"" + this_.getThisWeiboStartTime() +"\");" ;
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
		return true;
	}
	
	public boolean addThis(IfThisTime this_) {
		// todo: add IfThisTime condition to db
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
	    	
	    	String statementString = "insert into IfThisTime values(\"" + this_.getThisId() + "\","  + this_.getThisType() + ",\"" + this_.getGoalTime() + "\");" ;
	    	System.out.println("in ThisDaoImpl line96 add IfThisTime statement: " + statementString);
	    	statement.executeUpdate(statementString);
	    	con.close();
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
	    
	    
		return true;
	}
	
	public boolean addThis(IfThisReceiveMail this_) {
		// todo: add IfThisReceiveMail condition to db
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
	    	
	    	String statementString = "insert into IfThisReceiveMail values(\"" + this_.getThisId() + "\"," + this_.getThisType() + ",\"" + this_.thisEmailId + "\",\"" + this_.thisEmailPwd + "\",\"" + this_.getThisEmailCount() + "\");" ;
	    	//System.out.println(statementString);
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("SQL Exception!");    
	    	se.printStackTrace() ;    
	     }  
		return true;
	}
	
	public boolean removeThis(IfThisListenWeibo this_) {
		// todo: remove IfThisListenWeibo condition to db
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
	    	
	    	String statementString = "delete "
	    			+ "from IfThisListenWeibo "
	    			+ "where thisId = \"" + this_.getThisId() + "\"";
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
		return true;
	}
	
	public boolean removeThis(IfThisTime this_) {
		// todo: remove IfThisTime condition to db
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("Driver Class Not Found, Loader Failure! ");
		}
		try{
			Connection con =
					DriverManager.getConnection(domain.DatabaseInfo.url, domain.DatabaseInfo.username, domain.DatabaseInfo.password);
			Statement statement = con.createStatement();
			String statementString1 = "select * from IfThisTime where goalTime = " + "\"" + this_.getGoalTime() + "\"";
			if(statement.executeQuery(statementString1) == null ) return false;
			
			String statementString = "delete from IfThisTime where thisId = " + "\"" + this_.getThisId() + "\"";
			statement.executeUpdate(statementString);
		}
		catch(SQLException se){
			System.out.println("Connection to Database Failed!");
			se.printStackTrace();
		}
		return true;
	}
	
	public boolean removeThis(IfThisReceiveMail this_) {
		// todo: remove IfThisReveiveMail from db
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
	    	
	    	String statementString = "delete "
	    			+ "from IfthisReceiveMail "
	    			+ "where thisEmailId = \"" + this_.thisEmailId + "\"";
	    	statement.executeUpdate(statementString);
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     }  
		return true;
	}
}
