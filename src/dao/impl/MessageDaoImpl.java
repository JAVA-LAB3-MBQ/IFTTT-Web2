package dao.impl;

import domain.Message;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

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
}
