package web.formbean;

import domain.IfThis;
import domain.Task;
import util.WebUtils;
public class ATaskFormBean {
	private String userId, taskName;
	private String thisIconPath, thatIconPath;
	private String listenWbId, listenWbText, listenTimeLen, listenWbPwd;
	private String destMailAddr, sendContent;
    private String goalTime;
    private String thisType, thatType;
    private String taskId;
    
    public String getListenWbPwd() {
    	return listenWbPwd;
    }
    
    public void setListenWbPwd(String p) {
    	listenWbPwd = p;
    }
    
    public String getUserId() { 
    	return userId; 
    }
    
    public void setUserId(String uId) {
    	userId = uId;
    }
    
    public String getTaskName() {
    	return taskName;
    }
    
    public void setTaskName(String tn) {
    	taskName = tn;
    }
    
    public String getThisIconPath() { 
    	return thisIconPath;
    }
    
    public void setThisIconPath(String thisIP) {
    	thisIconPath = thisIP;
    }
    
    public String getThatIconPath() {
    	return thatIconPath;
    }
    
    public void setThatIconPath(String thatIP) {
    	thatIconPath = thatIP;
    }
    
    public String getListenWbId() {
    	return listenWbId;
    }
    
    public void setListenWbId(String wbid) {
    	listenWbId = wbid;
    }
    
    public String getListenWbText() {
    	return listenWbText;
    }
    
    public void setListenWbText(String wbt) {
    	listenWbText = wbt;
    }
    
    public String getDestMailAddr() {
    	return destMailAddr;
    }
    
    public void setDestMailAddr(String dma) {
    	destMailAddr = dma;
    }
    
    public String getSendContent() {
    	return sendContent;
    }
    
    public void setSendContent(String sc) {
    	sendContent = sc;
    }

    public String getGoalTime() {
    	return goalTime;
    }
    
    public void setGoalTime(String gt) {
    	goalTime = gt;
    }
    
    public String getThisType() {
    	return thisType;
    }
    
    public int getThisTypeInt() {
    	return WebUtils.thisTypeString2Int(thisType);
    }
    public void setThisType(String tt) {
    	thisType = tt;
    }
    
    public String getThatType() {
    	return thatType;
    }
    public int getThatTypeInt() {
    	return WebUtils.thatTypeString2Int(thatType);
    }
    
    public void setThatType(String tt) {
    	thatType = tt;
    }
    
    public String getListenTimeLen() {
    	return listenTimeLen;
    }
    
    public void setListenTimeLen(String ltl) {
    	listenTimeLen = ltl;
    }
    
    public String getTaskId() {
    	return taskId;
    }
    
    public void setTaskId(String t) {
    	taskId = t;
    }
}
