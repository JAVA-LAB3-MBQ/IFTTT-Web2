package domain;

public abstract class IfThis {
	public final static int thisReceiveMailTypeValue = 1;
	public final static int thisTimeTypeValue = 2;
	public final static int thisListenWeiboTypeValue = 3; 
	
	private String thisId;
	private int thisType;
	private String thisIconPath;
	private String thisInfo;
	
	public String getThisId() {
		return thisId;
	}
	
	public void setThisId(String id) {
		thisId = id;
	}
	
	public int getThisType() {
		return thisType;
	}
	
	public void setThisType(int ty) {
		thisType = ty;
	}
	
	public String getThisIconPath() {
		return thisIconPath;
	}
	
	public void setThisIconPath(String iconp) {
		thisIconPath = iconp;
	}
	public String getThisInfo(){
		return thisInfo;
	}
	public void setThisInfo(String i){
		thisInfo = i;
	}
	
	public String getThisInfo() {
		return thisInfo;
	}
	
	public void setThisInfo(String i) {
		thisInfo = i;
	}
	abstract public boolean ifHappened(); 
	abstract public boolean add2Db(); 
	abstract public boolean removeFromDb();
}
