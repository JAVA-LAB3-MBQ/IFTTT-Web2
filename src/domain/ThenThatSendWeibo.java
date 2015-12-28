package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ThenThatSendWeibo extends ThenThat{
	private String thatWeiboId;
	private String thatWeiboAccessToken;
	private String thatWeiboPwd;
	private String thatWeiboContent;

	public ThenThatSendWeibo() {
		this.setThatType(ThenThat.thatSendWeiboTypeValue);
		this.setThatInfo("Send Weibo");
	}
	
	public ThenThatSendWeibo(String userId, String weiboContent) {
		// todo: get user's weiboId and accessToken, weibopwd
		thatWeiboContent = weiboContent;
		
		this.setThatType(ThenThat.thatSendWeiboTypeValue);
		this.setThatInfo("Send Weibo: content-" + thatWeiboContent);
	}
	
	public boolean doIt() {
		// todo:
		return false;
	}
	
	public String getThatWeiboId(){
		return thatWeiboId;
	}
	public String getThatWeiboAccessToken(){
		return thatWeiboAccessToken;
	}
	public String getThatWeiboPwd(){
		return thatWeiboPwd;
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
	public void setThatWeiboPwd(String thatWeiboPwd){
		this.thatWeiboPwd = thatWeiboPwd;
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
