package thread;
import java.lang.Thread;
import java.sql.*;
import java.sql.SQLException;

import domain.DatabaseInfo;
import domain.IfThis;
import domain.IfThisTime;
import domain.IfThisReceiveMail;
import domain.IfThisListenWeibo;
import domain.ThenThat;
import domain.ThenThatSendMail;
import domain.ThenThatSendWeibo;

import java.sql.Connection;
public class TaskThread extends Thread{
	public void run(){
//		while(true){
			//System.out.println("hehe");
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = 
						DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.username, DatabaseInfo.password);	
				Statement statement = con.createStatement();
				while(true){
					String query = "select * from Task";
					ResultSet res = statement.executeQuery(query);
					while(res.next()){
						String taskId = res.getString("taskId");
						int taskStatus = res.getInt("taskStatus");
						int thisType = res.getInt("thisType");
						int thatType = res.getInt("thatType");
						String thisId = res.getString("ThisId");
						String thatId = res.getString("ThatId");
						String userId = res.getString("userId");
						//System.out.println(taskStatus);
						if(taskStatus == domain.Task.startedStatus){
							Statement statement1 = con.createStatement();
							Statement statement2 = con.createStatement();
						//	System.out.println("this: " + (thisType == IfThis.thisTimeTypeValue));
							switch(thisType){
							case IfThis.thisReceiveMailTypeValue:{
								String queryThisMail = "select * from IfThisReceiveMail where thisId = \"" + thisId + "\"";
								ResultSet resThis = statement1.executeQuery(queryThisMail);
								IfThisReceiveMail thisMail = new IfThisReceiveMail(resThis.getString("thisId"),resThis.getString("thisEmailId"),resThis.getString("thisEmailPwd"));
								
								if(thisMail.ifHappened()){
									if(thatType == ThenThat.thatSendMailTypeValue){
										String queryThat = "select * from ThenThatSendMail where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										ThenThatSendMail thatMail = new ThenThatSendMail(resThat.getString("thatSrcEmailId"),resThat.getString("thatSrcEmailPwd"),resThat.getString("thatDestEmailId"),resThat.getString("thatEmailContent"));
										thatMail.doIt();
										
									}
									else{
										String queryThat = "select * from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo(userId,resThat.getString("thatWeiboContent"));
										thatWeibo.doIt();
									}
								}
								break;
							}
							
							case IfThis.thisTimeTypeValue:
								String queryThisTime = "select * from IfThisTime where thisId = \"" + thisId + "\"";
								//System.out.println(queryThisTime);
								
								ResultSet resThisTime = statement1.executeQuery(queryThisTime);
								IfThisTime thisTime = new IfThisTime();
								if(resThisTime.next()){
									System.out.println("resThisTime has next");
									thisTime = new IfThisTime(resThisTime.getString("thisId"),resThisTime.getString("goalTime"));
									//System.out.println("---------------check time----------------");
								}
								else{
									break;
								}
								if(thisTime.ifHappened()){
									System.out.println("**************************timeHit*********************");
									if(thatType == ThenThat.thatSendMailTypeValue){
										String queryThat = "select * from ThenThatSendMail where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										if(!resThat.next())break;
										ThenThatSendMail thatMail = new ThenThatSendMail(resThat.getString("thatSrcEmailId"),resThat.getString("thatSrcEmailPwd"),resThat.getString("thatDestEmailId"),resThat.getString("thatEmailContent"));
										thatMail.doIt();
									}
									else{
										String queryThat = "select * from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo(userId,resThat.getString("thatWeiboContent"));
										thatWeibo.doIt();
									}
									Statement statement3 = con.createStatement();
									String endTask = "update task set taskStatus = " + domain.Task.pausedStatus + " where taskId = \"" + taskId + "\"";
									System.out.println(endTask);
									statement3.executeUpdate(endTask);
								}
								break;
							
							case IfThis.thisListenWeiboTypeValue:
								String queryThisWeibo = "select * from IfThisListenWeibo where thisId = \"" + thisId + "\"";
								ResultSet resThisWeibo = statement1.executeQuery(queryThisWeibo);
								IfThisListenWeibo thisWeibo = new IfThisListenWeibo(resThisWeibo.getString("thisId"),resThisWeibo.getString("thisWeiboId"),resThisWeibo.getString("thisWeiboContent"),resThisWeibo.getString("thisTimeLen"));
								if(thisWeibo.ifHappened()){
									if(thatType == ThenThat.thatSendMailTypeValue){
										String queryThat = "select * from ThenThatSendMail where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										ThenThatSendMail thatMail = new ThenThatSendMail(resThat.getString("thatSrcEmailId"),resThat.getString("thatSrcEmailPwd"),resThat.getString("thatDestEmailId"),resThat.getString("thatEmailContent"));
										thatMail.doIt();
									}
									else{
										String queryThat = "select * from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo(userId,resThat.getString("thatWeiboContent"));
										thatWeibo.doIt();
									}
								}
								break;
							}
						}
					}
//					break;
				}
			}
			catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			catch(SQLException ee){
				ee.printStackTrace();
			}
		
	}
}
