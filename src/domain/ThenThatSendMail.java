package domain;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Properties;


import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;
import javax.swing.JOptionPane;

public class ThenThatSendMail extends ThenThat{
	private String thatSrcEmailId;
	private String thatSrcEmailPwd;
	private String thatDestEmailId;
	private String thatEmailContent;

	public ThenThatSendMail() {
		this.setThatType(ThenThat.thatSendMailTypeValue);
		this.setThatInfo("Send a mail");
	}
	
	public ThenThatSendMail(String userId, String destEmailId, String mailContent) {
		// todo : get user's email and id
	
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
	    	
	    	String statementString1 = "select userEmailAddr,userEmailPwd from User where userId = \"" + userId + "\";" ;
	    	ResultSet res = 
	    			statement.executeQuery(statementString1);
    		
	    	if(res.next()){
	    		thatSrcEmailId = res.getString("userEmailAddr");
	    		thatSrcEmailPwd = res.getString("userEmailPwd");
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed！");    
	    	se.printStackTrace() ;    
	     } 
		thatDestEmailId = destEmailId;
		thatEmailContent = mailContent;
		
		this.setThatType(ThenThat.thatSendMailTypeValue);
		this.setThatInfo("Send a mail: receiver-" + thatDestEmailId + ";content-" + thatEmailContent);
<<<<<<< HEAD
		
=======
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
	}
	
	public ThenThatSendMail(String thatSrcEmailId, String thatSrcEmailPwd, String thatDestEmailId, String thatEmailContent){
		this.thatSrcEmailId = thatSrcEmailId;
		this.thatSrcEmailPwd = thatSrcEmailPwd;
		this.thatDestEmailId = thatDestEmailId;
		this.thatEmailContent = thatEmailContent;
		this.setThatType(ThenThat.thatSendMailTypeValue);
		this.setThatInfo("Send a mail: receiver-" + thatDestEmailId + ";content-" + thatEmailContent);
	}
	public ThenThatSendMail(String thatId, String thatSrcEmailId, String thatSrcEmailPwd, String thatDestEmailId, String thatEmailContent){
		setThatId(thatId);
		this.thatSrcEmailId = thatSrcEmailId;
		this.thatSrcEmailPwd = thatSrcEmailPwd;
		this.thatDestEmailId = thatDestEmailId;
		this.thatEmailContent = thatEmailContent;
		this.setThatType(ThenThat.thatSendMailTypeValue);
	}
	public String getThatSrcEmailId(){
		return thatSrcEmailId;
	}
	public String getThatSrcEmailPwd(){
		return thatSrcEmailPwd;
	}
	public String getThatDestEmailId(){
		return thatDestEmailId;
	}
	public String getThatEmailContent(){
		return thatEmailContent;
	}
	public void setThatSrcEmailId(String thatSrcEmailId) {
		this.thatSrcEmailId = thatSrcEmailId;
	}
	public void setThatSrcEmailPwd(String thatSrcEmailPwd) {
		this.thatSrcEmailPwd = thatSrcEmailPwd;
	}
	public void setThatDestEmailId(String thatDestEmailId){
		this.thatDestEmailId = thatDestEmailId;
	}
	public void setThatEmailContent(String thatEmailContent){
		this.thatEmailContent = thatEmailContent;
	}
	public boolean doIt(){
		// todo:
		// get host by separating the 'from'
		String[] temp = thatSrcEmailId.split("@");
		String host = "smtp." + temp[1];
		try {
			Properties props = new Properties();  
		    // debug  
		    //props.setProperty("mail.debug", "true");  
		    // Authenticate
		    props.setProperty("mail.smtp.auth", "true");  
		    // Setup mail server
		    props.setProperty("mail.host", host);  
		    // protocol name  
		    props.setProperty("mail.transport.protocol", "smtp");  
		    // port
		    props.setProperty("mail.smtp.port", "25");
		
		    // Get session
		    Session session = Session.getInstance(props); 
		
		    // Define message
		    MimeMessage message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(thatSrcEmailId));
		    message.addRecipient(Message.RecipientType.TO, new InternetAddress(thatDestEmailId));
		    message.setSubject("Java lab4");
		    message.setText(thatEmailContent);
		
	        // Send message
	        Transport transport = session.getTransport("smtp");
	        transport.connect(host, thatSrcEmailId, thatSrcEmailPwd);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
		}
	    catch(NoSuchProviderException e) {
			JOptionPane.showMessageDialog(null, "邮箱地址有误: 发件人 " + thatSrcEmailId + "收件人 " + thatDestEmailId);
		}
		catch(MessagingException e) {
			JOptionPane.showMessageDialog(null, "发送邮件失败: 发件人 " + thatSrcEmailId + "收件人 " + thatDestEmailId);
		}
		return false;
	}
	
	public boolean add2Db() {
		// todo: call method about Db(in dao) to insert this to Db
		dao.impl.ThatDaoImpl t = new dao.impl.ThatDaoImpl();
		return t.addThat(this);
	}
	
	public boolean removeFromDb() {
		// todo: call method about Db(in dao) to remove this from Db
		dao.impl.ThatDaoImpl t = new dao.impl.ThatDaoImpl();
		return t.removeThat(this);
	}
}
