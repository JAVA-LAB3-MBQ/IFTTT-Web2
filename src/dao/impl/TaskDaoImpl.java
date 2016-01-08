package dao.impl;
import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import dao.ITaskDao;
import domain.DatabaseInfo;
import domain.IfThisListenWeibo;
import domain.Task;

public class TaskDaoImpl implements ITaskDao {
	public boolean addTask(Task t) {
		// todo : add A Task to db
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(domain.DatabaseInfo.url,domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			Statement statement = con.createStatement();
			String update = "insert into task values(\""+t.getUserId()+"\",\""+t.getTaskId()+"\",\""+t.getTaskName()+"\",\""+t.getThisId()+"\",\""+t.getThatId()
				+"\","+t.getThisType()+","+t.getThatType()+",\""
				+t.getThisIconPath()+"\",\"" + t.getThatIconPath() +"\",\""
				+ t.getCreateTime()+"\","+t.getTaskStatus() + ",\"" + t.getThisInfo() + "\",\"" + t.getThatInfo() + "\");";
			statement.executeUpdate(update);
			con.close();
			return true;
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException ee){
			ee.printStackTrace();
		}
		return false;
	}
	
	public boolean removeTask(String taskId) {
		// todo : remove the Task from db
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement q = con.createStatement();
			String query = "select thisId,thatId,thisType,thatType from task where taskId = \"" + taskId + "\"";
			ResultSet res = q.executeQuery(query);
			String thisId = null;
			String thatId = null;
			int thisType = 0;
			int thatType = 0;
			if(res.next()){
				thisId = res.getString("thisId");
				thatId = res.getString("thatId");
				thisType = res.getInt("thisType");
				thatType = res.getInt("thatType");
			}
			Statement statement = con.createStatement();
			String update = "delete from task where taskId = \"" + taskId + "\"";
			statement.executeUpdate(update);
			Statement statement2 = con.createStatement();
			String update2 = null;
			if(thisType == domain.IfThis.thisTimeTypeValue){
				update2 = "delete from IfThisTime where thisId = \"" + thisId + "\"";
			}
			else if(thisType == domain.IfThis.thisListenWeiboTypeValue){
				update2 = "delete from IfThisListenWeibo where thisId = \"" + thisId + "\"";
			}
			else if(thisType == domain.IfThis.thisReceiveMailTypeValue){
				update2 = "delete from IfThisReceiveMail where thisId = \"" + thisId + "\"";
			}
			statement2.executeUpdate(update2);
			
			Statement statement3 = con.createStatement();
			String update3 = null;
			if(thatType == domain.ThenThat.thatSendMailTypeValue){
				update3 = "delete from ThenThatSendMail where thatId = \"" + thatId + "\"";
			}
			else if(thatType == domain.ThenThat.thatSendWeiboTypeValue){
				update3 = "delete from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
			}
			statement3.executeUpdate(update3);
			con.close();
			return true;
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException ee){
			ee.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Task> getTasks(String userId) {
		// todo : get the tasks of the user together
		ArrayList<Task> tasks = new ArrayList<Task>();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			String query = "select * from task where userId = \"" + userId + "\"";
			ResultSet res = statement.executeQuery(query);
			while(res.next()){
				Task t = new Task(res.getString("userId"),res.getString("taskId"),res.getString("taskName"),
						res.getString("thisId"),res.getString("thatId"),
						res.getInt("thisType"),res.getInt("thatType"),
						res.getString("thisIconPath"),res.getString("thatIconPath"),
						res.getString("createTime"),res.getInt("taskStatus"),
						res.getString("thisInfo"),res.getString("thatInfo"));
				tasks.add(t);
			}
			return tasks;
		}
		catch(ClassNotFoundException e){
			
		}
		catch(SQLException ee){
			
		}
		return null; 
	}
	public Task getATask(String taskId) {
		// todo :
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			String query = "select * from task where taskId = \"" + taskId + "\";";
			ResultSet res = statement.executeQuery(query);
			if(res.next()){
				Task t = new Task(res.getString("userId"),res.getString("taskId"),res.getString("taskName"),
						res.getString("thisId"),res.getString("thatId"),
						res.getInt("thisType"),res.getInt("thatType"),
						res.getString("thisIconPath"),res.getString("thatIconPath"),
						res.getString("createTime"),res.getInt("taskStatus")
						,res.getString("thisInfo"),res.getString("thatInfo"));
				return t;
			}
			con.close();
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException ee){
			ee.printStackTrace();
		}
		return null;
	}
	
	public boolean startTask(String taskId) {
		// todo: change the task's status
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			statement.executeUpdate("SET SQL_SAFE_UPDATES = 0");
			String update = "update task set taskStatus = " + Task.startedStatus + " where taskId = \"" + taskId + "\"";
			System.out.println(update);
			statement.executeUpdate(update);
			
			Statement statement2 = con.createStatement();
			String query = "select thisId,thisType from task where taskId = \"" + taskId + "\"";
			ResultSet res = statement2.executeQuery(query);
			if(res.next()){
				int thisType = res.getInt("thisType");
				String thisId = res.getString("thisId");
				if(thisType == domain.IfThis.thisListenWeiboTypeValue){
					Statement statement3 = con.createStatement();
					String query2 = "select thisWeiboType,thisTimeLen from IfThisListenWeibo where thisId = \"" + thisId + "\"";
					ResultSet res2 = statement3.executeQuery(query2);
					if(res2.next()){
						if(res2.getInt("thisWeiboType") == IfThisListenWeibo.IfThisListenWeiboTypeTwo){
							String update2 = "update IfThisListenWeibo set thisWeiboStartTime = \"" + util.DateStringUtil.date2String(new java.util.Date()) + "\" where thisId = \"" + thisId + "\"";
							Statement statement4 = con.createStatement();
							statement4.executeUpdate(update2);
						}
					}
				}
			}
			con.close();
			return true;
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		catch(SQLException ee){
			ee.printStackTrace();
		}
		return false;
	}
	
	public boolean pauseTask(String taskId) {
		// todo: change the task's status
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			statement.executeUpdate("SET SQL_SAFE_UPDATES = 0");
			String update = "update task set taskStatus = " + Task.pausedStatus + " where taskId = \"" + taskId + "\"";
			statement.executeUpdate(update);
			con.close();
			return true;
		}
		catch(ClassNotFoundException e){
			return false;
		}
		catch(SQLException ee){
			return false;
			
		}
	}
	
	public boolean pauseTaskOnThisId(String thisId) {
		// todo: change the task's status
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			statement.executeUpdate("SET SQL_SAFE_UPDATES = 0");
			String update = "update task set taskStatus = " + Task.pausedStatus + " where thisId = \"" + thisId + "\"";
			statement.executeUpdate(update);
			con.close();
			return true;
		}
		catch(ClassNotFoundException e){
			return false;
		}
		catch(SQLException ee){
			return false;
			
		}
	}
}
