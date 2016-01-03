package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import weibo.ForWeibo;
public class ThenThatSendWeibo extends ThenThat{
	private String thatWeiboId;
	private String thatWeiboAccessToken;
	private String thatWeiboContent;

	public ThenThatSendWeibo() {
		this.setThatType(ThenThat.thatSendWeiboTypeValue);
		this.setThatInfo("Send Weibo");
	}
	
	public ThenThatSendWeibo(String userId, String weiboContent) {
		// todo: get user's weiboId and accessToken, weibopwd
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
	    	String query1 = "select userWeiboAccessToken from User where userId = \"" + userId + "\"";
	    	System.out.println(query1);
	    	ResultSet res1 = statement1.executeQuery(query1);
	    	if(res1.next()){
		    	thatWeiboAccessToken = res1.getString("userWeiboAccessToken");
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
		thatWeiboContent = weiboContent;
		this.setThatType(ThenThat.thatSendWeiboTypeValue);
		this.setThatInfo("Send Weibo: content-" + thatWeiboContent);
	}
	
	public boolean doIt() {
		// todo:
		System.out.println(thatWeiboAccessToken + "\n" + thatWeiboContent);
		ForWeibo tmp = new ForWeibo(thatWeiboAccessToken);
		tmp.UpdateStatus(thatWeiboContent);
		return true;
	}
	
	public String getThatWeiboId(){
		return thatWeiboId;
	}
	public String getThatWeiboAccessToken(){
		return thatWeiboAccessToken;
	}
	public String getThatWeiboContent(){
		return thatWeiboContent;
	}
	
	public void setThatWeiboId(String thatWeiboId){
		this.thatWeiboId = thatWeiboId;
	}
	public void setThatWeiboAccessToken(String thatWeiboAccessToken){
		this.thatWeiboAccessToken = thatWeiboAccessToken;
	}
	public void setThatWeiboContent(String thatWeiboContent){
		this.thatWeiboContent = thatWeiboContent;
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
