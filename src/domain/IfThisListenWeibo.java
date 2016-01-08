package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import weibo.ForWeibo;
public class IfThisListenWeibo extends IfThis{
	private String thisWeiboId;
	private String thisWeiboContent;
	private String thisWeiboAccessToken;
	private long thisWeiboCount;
	private String thisTimeLen;
	private int thisWeiboType;
	private String thisWeiboStartTime;
	
	
	public static int IfThisListenWeiboTypeOne = 1;
	public static int IfThisListenWeiboTypeTwo = 2;
	public IfThisListenWeibo() {//use the next !
		
	}
	public IfThisListenWeibo(String userId){
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
	    	String query1 = "select * from User where userId = \"" + userId + "\"";
	    	System.out.println(query1);
	    	ResultSet res1 = statement1.executeQuery(query1);
	    	if(res1.next()){
		    	thisWeiboAccessToken = res1.getString("userWeiboAccessToken");
		    	thisWeiboId = res1.getString("userWeiboId");
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
		ForWeibo tmp = new ForWeibo(thisWeiboAccessToken);
		long newCount = tmp.getCount();
		thisWeiboCount = newCount;
	}
	public IfThisListenWeibo(String userId,String content){
		thisWeiboContent = content;
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
	    	String query1 = "select * from User where userId = \"" + userId + "\"";
	    	System.out.println(query1);
	    	ResultSet res1 = statement1.executeQuery(query1);
	    	if(res1.next()){
		    	thisWeiboAccessToken = res1.getString("userWeiboAccessToken");
		    	thisWeiboId = res1.getString("userWeiboId");
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
		ForWeibo tmp = new ForWeibo(thisWeiboAccessToken);
		long newCount = tmp.getCount();
		thisWeiboCount = newCount;
	}
	public IfThisListenWeibo(String userId, String weiboId, String weiboPwd, String content, String t) {
		thisWeiboContent = content;
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
	    	String query1 = "select * from User where userId = \"" + userId + "\"";
	    	System.out.println(query1);
	    	ResultSet res1 = statement1.executeQuery(query1);
	    	if(res1.next()){
		    	thisWeiboAccessToken = res1.getString("userWeiboAccessToken");
		    	thisWeiboId = res1.getString("userWeiboId");
	    	}
	     }
	     catch(SQLException se){    
	    	System.out.println("Connection to Database Failed!");    
	    	se.printStackTrace() ;    
	     }  
		ForWeibo tmp = new ForWeibo(thisWeiboAccessToken);
		long newCount = tmp.getCount();
		thisWeiboCount = newCount;
		this.setThisType(IfThis.thisListenWeiboTypeValue);
		if(content.length()!=0){
			this.setThisInfo("if send a weibo--" + thisWeiboId);
			thisWeiboType = IfThisListenWeiboTypeOne;
		}
		else{
			this.setThisInfo("if not send a weibo in " + t + " minutes ");
			thisWeiboType = IfThisListenWeiboTypeTwo;
		}
		setThisWeiboId(weiboId);
		setThisWeiboContent(content);
		setThisTimeLen(t);
	}
	
	public boolean ifHappened() {
		// todo:		
		ForWeibo tmp = new ForWeibo(thisWeiboAccessToken);
		long newCount = tmp.getCount();
		System.out.println("thisWeiboType--------------->" + thisWeiboType);
		if(thisWeiboType == 2){
			if(newCount > thisWeiboCount){
				dao.impl.TaskDaoImpl t = new dao.impl.TaskDaoImpl();
				t.pauseTaskOnThisId(getThisId());
				return false;
			}
			else{
				System.out.println("send a weibo ? -------> did not send a weibo");
				boolean tag = false;
				String actionTime;
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
				int minuteAdd = Integer.parseInt(thisTimeLen);
				try{
					Date dt=sdf.parse(thisWeiboStartTime);
					System.out.println(dt);
					Calendar rightNow = Calendar.getInstance();
					rightNow.setTime(dt);
					rightNow.add(Calendar.MINUTE, minuteAdd);
					Date dt1=rightNow.getTime();
					actionTime = sdf.format(dt1);
					System.out.println("action Time-------------" + actionTime);
					if(actionTime.equals( util.DateStringUtil.date2String(new java.util.Date()) )){
						tag = true;
					}
				}
				catch(Exception e){
					
				}
				if(tag == true){
					System.out.println("time to send a mail ?  ------> yes!");
					dao.impl.TaskDaoImpl t = new dao.impl.TaskDaoImpl();
					t.pauseTaskOnThisId(getThisId());
					return true;
				}
			}
		}
		if(!(newCount > thisWeiboCount)){
			return false;
		}
		dao.impl.ThisDaoImpl t = new dao.impl.ThisDaoImpl();
		t.setWeiboCount(this, newCount);
		return tmp.getWeibo(thisWeiboContent);
	}
	
	public boolean add2Db() {
		// todo: call method about Db(in dao) to insert this to Db
		dao.impl.ThisDaoImpl t = new dao.impl.ThisDaoImpl();
		return t.addThis(this);
	}
	
	public boolean removeFromDb() {
		// todo: call method about Db(in dao) to remove this from Db
		dao.impl.ThisDaoImpl t = new dao.impl.ThisDaoImpl();
		return t.removeThis(this);
	}
	
	public int getThisWeiboType(){
		return thisWeiboType;
	}
	public void setThisWeiboType(int type){
		thisWeiboType = type;
	}
	public String getThisWeiboId() {
		return thisWeiboId;
	}
	
	public void setThisWeiboId(String s) {
		thisWeiboId = s;
	}
	
	public String getThisWeiboContent() {
		return thisWeiboContent;
	}
	
	public void setThisWeiboContent(String c) {
		thisWeiboContent = c;
	}
	
	public long getThisWeiboCount(){
		return thisWeiboCount;
	}
	public void setThisWeiboCount(long count){
		thisWeiboCount = count;
	}
	public String getThisTimeLen() {
		return thisTimeLen;
	}
	
	public void setThisTimeLen(String l) {
		thisTimeLen = l;
	}
	public void setThisWeiboStartTime(String t){
		thisWeiboStartTime = t;
	}
	public String getThisWeiboStartTime(){
		return thisWeiboStartTime;
	}
	
	public String getThisWeiboAccessToken() {
		return thisWeiboAccessToken;
	}
	
	public void setThisWeiboAccessToken(String s) {
		thisWeiboAccessToken = s;
	}
}
