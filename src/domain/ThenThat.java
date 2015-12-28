package domain;

public abstract class ThenThat {
	public final static int thatSendWeiboTypeValue = 1;
	public final static int thatSendMailTypeValue = 2; 
	private String thatId;
	private int thatType;
	private String thatIconPath;
	private String thatInfo;
	
	public String getThatId() {
		return thatId;
	}
	
	public void setThatId(String id) {
		thatId = id;
	}
	
	public int getThatType() {
		return thatType;
	}
	
	public void setThatType(int ty) {
		thatType = ty;
	}
	
	public String getThatIconPath() {
		return thatIconPath;
	}
	
	public void setThatIconPath(String iconp) {
		thatIconPath = iconp;
	}
	public String getThatInfo() {
		return thatInfo;
	}
	
	public void setThatInfo(String i) {
		thatInfo = i;
	}
	
	public String getThatInfo() {
		return thatInfo;
	}
	
	public void setThatInfo(String i) {
		thatInfo = i;
	}
	
	abstract public boolean doIt();
    abstract public boolean add2Db();
    abstract public boolean removeFromDb();
}
