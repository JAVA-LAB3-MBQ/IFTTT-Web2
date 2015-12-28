package web.formbean;

public class UserMainFormBean {
	String userId, userName;
	String userScore, userLevel;

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
	
	public String getUserScore() {
		return userScore;
	}
	
	public void serUserScore(String s) {
		userScore = s;
	}
	
	public String getUserLevel() {
		return userLevel;
	}
	
	public void setUserLevel(String l) {
		userLevel = l;
	}
}
