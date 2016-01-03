package thread;
import java.lang.Thread;
import java.util.Date;
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
						System.out.println(taskStatus);
						if(taskStatus == domain.Task.startedStatus){
							Statement statement1 = con.createStatement();
							Statement statement2 = con.createStatement();
							switch(thisType){
							case IfThis.thisReceiveMailTypeValue:{
								String queryThisMail = "select * from IfThisReceiveMail where thisId = \"" + thisId + "\"";
								ResultSet resThis = statement1.executeQuery(queryThisMail);
								if(!resThis.next())break;
								IfThisReceiveMail thisMail = new IfThisReceiveMail(resThis.getString("thisId"),resThis.getString("thisEmailId"),resThis.getString("thisEmailPwd"));		
								thisMail.setThisEmailCount(resThis.getInt("thisEmailCount"));
								if(thisMail.ifHappened()){
									System.out.println("receive a mail");
									if(thatType == ThenThat.thatSendMailTypeValue){
										String queryThat = "select * from ThenThatSendMail where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										if(!resThat.next())break;
										ThenThatSendMail thatMail = new ThenThatSendMail(resThat.getString("thatSrcEmailId"),resThat.getString("thatSrcEmailPwd"),resThat.getString("thatDestEmailId"),resThat.getString("thatEmailContent"));
										thatMail.doIt();
										
									}
									else{
										System.out.println("send a weibo");
										String queryThat = "select * from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										System.out.println(queryThat);
										if(!resThat.next())break;
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo();
										thatWeibo.setThatWeiboAccessToken(resThat.getString("thatWeiboAccessToken"));
										thatWeibo.setThatWeiboContent(resThat.getString("thatWeiboContent"));
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
										if(!resThat.next())break;
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo();
										thatWeibo.setThatWeiboAccessToken(resThat.getString("thatWeiboAccessToken"));
										thatWeibo.setThatWeiboContent(resThat.getString("thatWeiboContent"));
										thatWeibo.doIt();
									}
									Statement statement3 = con.createStatement();
									String endTask = "update task set taskStatus = " + domain.Task.pausedStatus + " where taskId = \"" + taskId + "\"";
									statement3.executeUpdate(endTask);
								}
								break;
							
							case IfThis.thisListenWeiboTypeValue:
								System.out.println("thisListenWeiboType");
								String queryThisWeibo = "select * from IfThisListenWeibo where thisId = \"" + thisId + "\"";
								ResultSet resThisWeibo = statement1.executeQuery(queryThisWeibo);
								if(!resThisWeibo.next())break;
								IfThisListenWeibo thisWeibo = new IfThisListenWeibo();
								thisWeibo.setThisId(resThisWeibo.getString("thisId"));
								thisWeibo.setThisWeiboId(resThisWeibo.getString("thisWeiboId"));
								thisWeibo.setThisWeiboAccessToken(resThisWeibo.getString("thisWeiboAccessToken"));
								thisWeibo.setThisWeiboContent(resThisWeibo.getString("thisWeiboContent"));
								thisWeibo.setThisTimeLen(resThisWeibo.getString("thisTimeLen"));
								thisWeibo.setThisWeiboCount(resThisWeibo.getLong("thisWeiboCount"));
								thisWeibo.setThisWeiboStartTime(resThisWeibo.getString("thisWeiboStartTime"));
								thisWeibo.setThisWeiboType(resThisWeibo.getInt("thisWeiboType"));
								if(thisWeibo.ifHappened()){
									if(thatType == ThenThat.thatSendMailTypeValue){
										String queryThat = "select * from ThenThatSendMail where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										if(!resThat.next()) break;
										ThenThatSendMail thatMail = new ThenThatSendMail(resThat.getString("thatSrcEmailId"),resThat.getString("thatSrcEmailPwd"),resThat.getString("thatDestEmailId"),resThat.getString("thatEmailContent"));
										thatMail.doIt();
									}
									else{
										String queryThat = "select * from ThenThatSendWeibo where thatId = \"" + thatId + "\"";
										ResultSet resThat = statement2.executeQuery(queryThat);
										if(!resThat.next())break;
										ThenThatSendWeibo thatWeibo = new ThenThatSendWeibo();
										thatWeibo.setThatWeiboAccessToken(resThat.getString("thatWeiboAccessToken"));
										thatWeibo.setThatWeiboContent(resThat.getString("thatWeiboContent"));
										thatWeibo.doIt();
									}
								}
								break;
							}
						}
						
						
					}
					//end of while(true)				
					try{		
						this.sleep(10000);
					}
					catch(Exception e){
						
					}
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
