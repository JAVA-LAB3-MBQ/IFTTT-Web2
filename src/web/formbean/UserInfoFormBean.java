package web.formbean;

public class UserInfoFormBean {
	String userId, userName, userMail, userMailPwd, userWeiboId, userWeiboPwd;
    String userScore, userLevel, userMoney;
    
    public void printAll() {
    	System.out.println("userId: " + getUserId());
    	System.out.println("userName: " + getUserName());
    	System.out.println("userMail: " + getUserMail());
    	System.out.println("userMailPwd: " + getUserMailPwd());
    	System.out.println("userWeiboId: " + getUserWeiboId());
    	System.out.println("userWeiboPwd: " + getUserWeiboPwd());
    	System.out.println("userScore: " + getUserScore());
    	System.out.println("userLevel: " + getUserLevel());
    	System.out.println("userMoney: " + getUserMoney());
    }
    public String getUserId() {
    	return userId;
    }
    
    public void setUserId(String ui) {
    	userId = ui;
    }
    
    public String getUserName() {
    	return userName;
    }
    
    public void setUserName(String un) {
    	userName = un;
    }
    
    public String getUserMail() {
    	return userMail;
    }
    
    public void setUserMail(String m) {
    	userMail = m;
    }
    
    public String getUserMailPwd() {
    	return userMailPwd;
    }
    
    public void setUserMailPwd(String mp) {
    	userMailPwd = mp;
    }
    
    public String getUserWeiboId() {
    	return userWeiboId;
    }
    
    public void setUserWeiboId(String wbi) {
    	userWeiboId = wbi;
    }
    
    public String getUserWeiboPwd() {
    	return userWeiboPwd;
    }
    
    public void setUserWeiboPwd(String w) {
    	userWeiboPwd = w;
    }
    
    public String getUserScore() {
    	return userScore;    
    }
    
    public void setUserScore(String i) {
    	userScore = i;
    }
    
    public String getUserLevel() {
    	return userLevel;
    }
    
    public void setUserLevel(String l ) {
    	userLevel = l;
    }
    
    public String getUserMoney() {
    	return userMoney;
    }
    
    public void setUserMoney(String i) {
    	userMoney = i;
    }
}
