package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IfThisListenWeibo extends IfThis{
	private String thisWeiboId;
	private String thisWeiboContent;
	private String thisTimeLen;
	private String thisWeiboPwd;
	private String thisInfo;
	
	public IfThisListenWeibo() {
		this.setThisType(IfThis.thisListenWeiboTypeValue);
		this.setThisInfo("Listen Weibo");
	}
	
	public IfThisListenWeibo(String weiboId, String weiboPwd, String content, String t) {
		setThisWeiboId(weiboId);
		setThisWeiboContent(content);
		setThisTimeLen(t);
		this.setThisType(IfThis.thisListenWeiboTypeValue);
		this.setThisInfo("if send a weibo: receiver-" + thisWeiboId);
	}
	public IfThisListenWeibo(String thisId, String weiboId, String pwd, String content, String t) {
		setThisId(thisId);
		setThisWeiboId(weiboId);
		setThisWeiboPwd(pwd);
		setThisWeiboContent(content);
		setThisTimeLen(t);
		this.setThisType(IfThis.thisListenWeiboTypeValue);
		this.setThisInfo("if send a weibo: receiver-" + thisWeiboId);
	}
	
	public boolean ifHappened() {
		// todo:
		return false;
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
	
	public String getThisInfo() {
		return thisInfo;
	}
	public void setThisInfo(String ts) {
		thisInfo = ts;
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
	
	public String getThisTimeLen() {
		return thisTimeLen;
	}
	
	public void setThisTimeLen(String l) {
		thisTimeLen = l;
	}
	
	public String getThisWeiboPwd() {
		return thisWeiboPwd;
	}
	
	public void setThisWeiboPwd(String s) {
		thisWeiboPwd = s;
	}
}
