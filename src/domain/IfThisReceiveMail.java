package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.Properties;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Folder;
import javax.mail.Store;
import javax.mail.Message;
import javax.swing.JOptionPane;

import java.util.Date;

import java.sql.ResultSet;

public class IfThisReceiveMail extends IfThis{
	public String thisEmailId;
	public String thisEmailPwd;
	public int thisMailCount;
	public IfThisReceiveMail() {
			this.setThisType(IfThis.thisReceiveMailTypeValue);
			this.setThisInfo("if receive a mail: receiver-" + thisEmailId);

		}	
	public IfThisReceiveMail(String thisEmailId, String thisEmailPwd){
		this.thisEmailId = thisEmailId;
		this.thisEmailPwd = thisEmailPwd;
		this.setThisType(IfThis.thisReceiveMailTypeValue);
		this.setThisInfo("if receive a mail: receiver-" + thisEmailId);
	}
	public IfThisReceiveMail(String thisId,String thisEmailId, String thisEmailPwd){
		setThisId(thisId);
		this.thisEmailId = thisEmailId;
		this.thisEmailPwd = thisEmailPwd;
		this.setThisType(IfThis.thisReceiveMailTypeValue);
		this.setThisInfo("if receive a mail: receiver-" + thisEmailId);

	}
	
	public IfThisReceiveMail(String userId) {
		this.setThisType(IfThis.thisReceiveMailTypeValue);
		
		// todo: get user's email and emailpwd
		String email;
		String emailPwd;
		
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
	    
	    	Statement statement1 = con.createStatement();
	    	Statement statement2 = con.createStatement();
	    	String query1 = "select userEmailAddr from User where userId = \"" + userId + "\"";
	    	String query2 = "select userEmailPwd from User where userId = \"" + userId + "\"";

	    	ResultSet res1 = statement1.executeQuery(query1);
	    	ResultSet res2 = statement2.executeQuery(query2);
	    	if(res1.next()){
		    	email = res1.getString("userEmailAddr");
		    	thisEmailId = email;
	    	}
	    	if(res2.next()){
		    	emailPwd = res2.getString("userEmailPwd");
		    	thisEmailPwd = emailPwd;
	    	}
		   
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
		 this.setThisInfo("receive a mail");
	}
	
	public String getThisEmailId(){
		return thisEmailId;
	}
	public String getThisEmailPwd(){
		return thisEmailPwd;
	}
	public void setThisEmailId(String thisEmailId) {
		this.thisEmailId = thisEmailId;
	}
	
	public void setThisEmailPwd(String thisEmailPwd) {
		this.thisEmailPwd = thisEmailPwd;
	}
	
	public boolean ifHappened(){
		// todo:
		System.out.println("before-----------" + thisMailCount);
		if(this.getThisEmailCount() > thisMailCount){
			
			dao.impl.ThisDaoImpl t = new dao.impl.ThisDaoImpl();
			t.setEmailCount(this, this.getThisEmailCount());
			return true;
		}
		return false;
	}
	
	public boolean add2Db() {
		// todo: call method about Db(in dao) to insert this to Db
		dao.impl.ThisDaoImpl t = new dao.impl.ThisDaoImpl();
		return t.addThis(this);
	}
	public void setThisEmailCount(int count){
//		thisMailCount = getThisEmailCount();
		thisMailCount = count;
	}
	public int getThisEmailCount() {
		boolean flag = false;
		String username = thisEmailId;
		String password = thisEmailPwd;
		Date originTime = new Date();

		// get host
		String[] temp = username.split("@");
		String host = "pop." + temp[1];
		
		try {
		    // Create empty properties
			Properties props = System.getProperties();  
			// debug  
			//props.setProperty("mail.debug", "true");  
		    props.put("mail.pop3.ssl.enable", "true");
		    // setup mail server
		    props.put("mail.pop3.host", host);
		    //port
		    props.put("mail.pop3.port", "995");
		    // Authenticate
			props.setProperty("mail.pop3.auth", "true");  
			// protocol name  
			props.setProperty("mail.transport.protocol", "pop3");  
		
		   // Get session
		   Session session = Session.getDefaultInstance(props, null);
		   // Get the store
		   Store store = session.getStore("pop3");
		   store.connect(host, username, password);
		
		   // Get folder
		   Folder folder = store.getFolder("INBOX");
		   folder.open(Folder.READ_ONLY);
		
		   // Get the latest received mail
		   int messages_count = folder.getMessageCount();
//		   
//		   System.out.println("_______________________"+messages_count);
//		   System.out.println("_______________________"+folder.getNewMessageCount());
//		   System.out.println("_______________________"+folder.getUnreadMessageCount());
//		   System.out.println("_______________________"+folder.getMessageCount());
		   
		   Message message = folder.getMessage(messages_count);
		   // check
		   Date latestTime = message.getSentDate();
		   if( latestTime.compareTo(originTime) > 0) flag = true;
		   else flag = false;
		
		   //Close connection 
		   folder.close(false);
		   store.close();

		   return messages_count;
		}
		catch(NoSuchProviderException e) {
//			JOptionPane.showMessageDialog(null, "邮箱地址有误");
			e.printStackTrace();
			return -1;
		}
		catch(Exception e) {
//			JOptionPane.showMessageDialog(null, "接收邮件途中出现失败： 收件人 " + username);
			e.printStackTrace();
		    return -1;
		}
	}
	
	public boolean removeFromDb() {
		return false;
	}
}
