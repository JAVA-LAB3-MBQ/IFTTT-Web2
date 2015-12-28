package domain;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import util.DateStringUtil;
public class IfThisTime extends IfThis{
	String goalTime;
	
	public IfThisTime() {
		this.setThisType(IfThis.thisTimeTypeValue);
<<<<<<< HEAD
		this.setThisInfo("if hit time: " + goalTime);
=======
		this.setThisInfo("Timing");
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
	}
	
	public IfThisTime(String time) {
		setGoalTime(time);	
		this.setThisType(IfThis.thisTimeTypeValue);
<<<<<<< HEAD
		this.setThisInfo("if hit time: " + goalTime);
	}
	public IfThisTime(String thisId,String time) {
		setThisId(thisId);
		setGoalTime(time);	
		this.setThisType(IfThis.thisTimeTypeValue);
		this.setThisInfo("if hit time: " + goalTime);
	}
	public void setGoalTime(String t) {
		goalTime = t;
	}
	
	public String getGoalTime() {
		return goalTime;
=======
		this.setThisInfo(t);
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
	}
	
	public boolean ifHappened() {
		// todo:
		String t = DateStringUtil.date2String(new Date());
		if(goalTime.equals(t))return true;
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
	
	
	
	public void setGoalTime(String t) {
		goalTime = t;
	}
	
	public String getGoalTime() {
		return goalTime;
	}
}
