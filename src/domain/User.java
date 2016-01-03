package domain;

import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable{
	public final static int superUserTypeValue = 0; // 管理员
	public final static int generalUserTypeValue = 1; // 普通用户
	public final static int loggedIn = 2; // 已登录
	public final static int loggedOut = 3; // 未登录
	
	private String userId;
	private String userName;
	private String userPwd;
	private String registerTime;
	
	private int userLevel;
	private int userScore;
	private int userRole;
	private int userStatus; // logged in or not logged in
	private int userMoney;
	private String userEmailAddr;
	private String userEmailPwd;
	private String userWeiboId;
	private String userWeiboAccessToken;
	private String userWeiboPwd;
	
	public User(String userId, String userName, String userPwd, String registerTime, 
			int userLevel, int userScore, int userRole, int userStatus, int userMoney, 
			String userEmailAddr, String userEmailPwd, String userWeiboId, String userWeiboAccessToken, String userWeiboPwd) 
	{ 
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.registerTime = registerTime;
		this.userLevel = userLevel;
		this.userScore = userScore;
		this.userRole = userRole;
		this.userStatus = userStatus;
		this.userMoney = userMoney;
		this.userEmailAddr = userEmailAddr;
		this.userEmailPwd = userEmailPwd;
		this.userWeiboId = userWeiboId;
		this.userWeiboAccessToken = userWeiboAccessToken;
		this.userWeiboPwd = userWeiboPwd;
	}
	
	public User(String name, String pwd){
		this.userName = name;
		this.userPwd = pwd;
	}

	public User(String id, String name, String pwd){
		this.userId = id;
		this.userName = name;
		this.userPwd = pwd;
	}
	
	public User(String id, String name, String pwd, String registerTime){
		this.userId = id;
		this.userName = name;
		this.userPwd = pwd;
		this.registerTime = registerTime;
	}
	public User(){
		
	}

	public void setId(String id){
		this.userId = id;
	}
	public String getUserId(){
		return userId;
	}
	
	public void setName(String name){
		this.userName = name;
	}
	public String getName(){
		return userName;
	}

	
	public void setPwd(String pwd){
		this.userPwd = pwd;
	}
	
	public String getPwd(){
		return userPwd;
	}
	
	public void setRegisterTime(String registerTime){
		this.registerTime = registerTime;
	}
	
	public String getRegisterTime(){
		return registerTime;
	}
	
	public void setUserLevel(int l) {
		userLevel = l;
	}
	public int getUserLevel() {
		return userLevel;
	}
	
	
	public void setUserScore(int s) {
		userScore = s;
	}
	public int getUserScore() {
		return userScore;
	}
	
	public void setUserRole(int r) {
		userRole = r;
	}
	public int getUserRole() {
		return userRole;
	}
	
	
	
	public void setUserStatus(int s) {
		userStatus = s;
	}
	public int getUserStatus() {
		return userStatus;
	}
	
	public void  setUserMoney(int m ) {
		userMoney = m;
	}
	public int getUserMoney() {
		return userMoney;
	}
	
	
	public void setUserEmailAddr(String addr) {
		userEmailAddr = addr;
	}
	public String getUserEmailAddr() {
		return userEmailAddr;
	}
	
	
	public void setUserEmailPwd(String p) {
		userEmailPwd = p;
	}
	public String getUserEmailPwd() {
		return userEmailPwd;
	}
	
	
	public void setUserWeiboId(String id) {
		userWeiboId = id;
	}
	public String getUserWeiboId() {
		return userWeiboId;
	}
	
	
	public void setUserWeiboAccessToken(String token) {
		userWeiboAccessToken = token;
	}
	public String getUserWeiboAccessToken() {
		return userWeiboAccessToken;
	}
	
	
	public String getUserWeiboPwd() {
		return userWeiboPwd;
	}
	public void setUserWeiboPwd(String pwd) {
		userWeiboPwd = pwd;
	}
	
	public ArrayList<Message> getUserMessages(){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		return t.getMessages(userId);
	}
}
