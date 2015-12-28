package dao.impl;
import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;

import dao.ITaskDao;
import domain.DatabaseInfo;
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
	
<<<<<<< HEAD
	public boolean removeTask(String taskId) {
=======
	public boolean removeTask(String tid) {
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
		// todo : remove the Task from db
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
<<<<<<< HEAD
			String update = "delete from task where taskId = \"" + taskId + "\"";
=======
			String update = "delete * from task where taskId = \"" + tid + "\"";
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
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
<<<<<<< HEAD
				Task t = new Task(res.getString("userId"),res.getString("taskId"),res.getString("taskName"),res.getString("thisId"),res.getString("thatId"),res.getInt("thisType"),res.getInt("thatType"),res.getString("thisIconPath"),res.getString("thatIconPath"),res.getString("createTime"),res.getInt("taskStatus")
						,res.getString("thisInfo"),res.getString("thatInfo"));
=======
				Task t = new Task(res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getInt(6),res.getInt(7),res.getString(8),res.getString(9),res.getString(10),res.getInt(11));
				// todo: about info
				//t.setThisInfo( );
				//t.setThatInfo( );
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34
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
				Task t = new Task(res.getString("userId"),res.getString("taskId"),res.getString("taskName"),res.getString("thisId"),res.getString("thatId"),res.getInt("thisType"),res.getInt("thatType"),res.getString("thisIconPath"),res.getString("thatIconPath"),res.getString("createTime"),res.getInt("taskStatus")
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
	
	public Task getATask(String taskId) {
		// todo :
		Task t = new Task();
		
		return t;
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
}
