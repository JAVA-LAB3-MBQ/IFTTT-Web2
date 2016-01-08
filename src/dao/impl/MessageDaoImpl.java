package dao.impl;

import domain.DatabaseInfo;
import domain.Message;
import domain.Task;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MessageDaoImpl {
	public boolean addMessage(Message mess){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url,domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			String update = "insert into Message values(\""
					+ mess.getMessageId() + "\",\"" + mess.getFromUserId() + "\",\"" + mess.getToUserId() + "\",\"" + mess.getMessageContent() + "\"," + mess.getMessageType() + ");";
			Statement statement = con.createStatement();
			statement.executeUpdate(update);
			con.close();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean removeMessage(Message mess){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url,domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			String update = "delete from Message where messageId = \"" + mess.getMessageId() + "\"";
			Statement statement = con.createStatement();
			statement.execute(update);
			con.close();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean removeMessage(String messageId){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = 
					DriverManager.getConnection(domain.DatabaseInfo.url,domain.DatabaseInfo.username,domain.DatabaseInfo.password);
			String update = "delete from Message where messageId = \"" + messageId + "\"";
			Statement statement = con.createStatement();
			statement.executeUpdate(update);
			con.close();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<Message> getMessages(String userId) {
		// todo : get the tasks of the user together
		ArrayList<Message> messages = new ArrayList<Message>();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			String query_public = "select * from Message where toUserId = \"ALL\"";
			ResultSet res_public = statement.executeQuery(query_public);
			while(res_public.next()){
				Message t = new Message();
				t.setMessageId(res_public.getString("MessageId"));
				t.setMessageFromUserId(res_public.getString("FromUserId"));
				t.setMessageToUserId(res_public.getString("ToUserId"));
				t.setMessageContent(res_public.getString("messageContent"));
				t.setMessageType(res_public.getInt("messageType"));
				messages.add(t);
			}
			String query_private = "select * from Message where toUserId = \"" + userId + "\"";
			ResultSet res_private = statement.executeQuery(query_private);
			while(res_private.next()){
				Message t = new Message();
				t.setMessageId(res_private.getString("MessageId"));
				t.setMessageFromUserId(res_private.getString("FromUserId"));
				t.setMessageToUserId(res_private.getString("ToUserId"));
				t.setMessageContent(res_private.getString("messageContent"));
				t.setMessageType(res_private.getInt("messageType"));
				messages.add(t);
			}
			return messages;
		}
		catch(ClassNotFoundException e){
			
		}
		catch(SQLException ee){
			
		}
		return null; 
	}
	public ArrayList<Message> getAllMessages() {
		// todo : get the tasks of the user together
		ArrayList<Message> messages = new ArrayList<Message>();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =
					DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);
			Statement statement = con.createStatement();
			String query = "select * from Message ";
			ResultSet res = statement.executeQuery(query);
			while(res.next()){
				Message t = new Message();
				t.setMessageId(res.getString("MessageId"));
				t.setMessageFromUserId(res.getString("FromUserId"));
				t.setMessageToUserId(res.getString("ToUserId"));
				t.setMessageContent(res.getString("messageContent"));
				t.setMessageType(res.getInt("messageType"));
				messages.add(t);
			}
			return messages;
		}
		catch(ClassNotFoundException e){
			
		}
		catch(SQLException ee){
			
		}
		return null; 
	}
}
