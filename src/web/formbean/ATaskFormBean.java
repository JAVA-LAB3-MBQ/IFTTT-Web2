package web.formbean;

import util.WebUtils;
public class ATaskFormBean {
	private String userId, taskName;
	private String thisIconPath, thatIconPath;
	private String listenWbId, listenWbText, listenTimeLen, listenWbPwd;
	private String destMailAddr, sendMailContent, sendWeiboContent;
    private String date, time;
    private String thisType, thatType;
    private String taskId;
    
    public void printAll() {
    	System.out.println("userId:" + this.getUserId());
    	System.out.println("thisIconPath:" + this.getThisIconPath());
    	System.out.println("thatIconPath:" + this.getThatIconPath());
    	System.out.println("listenWbId:" + this.getListenWbId());
    	System.out.println("listenWbText:" + this.getListenWbText());
    	System.out.println("listenTimeLen:" + this.getListenTimeLen());
    	System.out.println("listenWbPwd:" + this.getListenWbPwd());
    	System.out.println("goalTime:" + this.getGoalTime());
    	System.out.println("destMailAddr:" + this.getDestMailAddr());
    	System.out.println("sendMailContent:" + this.getSendMailContent());
    	System.out.println("sendWeiboContent:" + this.getSendWeiboContent());
    	System.out.println("thisType:" + this.getThisType());
    	System.out.println("thatType:" + this.getThatType());
    	System.out.println("taskId:" + this.getTaskId());
    }
    public String getGoalTime() {
    	return date + " " + time;
    }
    public String getListenWbPwd() {
    	return listenWbPwd;
    }
    
    public void setListenWbPwd(String p) {
    	listenWbPwd = p;
    }
    
    public String getSendMailContent() {
    	return sendMailContent;
    }
    public void setSendMailContent(String c) {
    	sendMailContent = c;
    }
    public String getSendWeiboContent() {
    	return sendWeiboContent;
    }
    public void setSendWeiboContent(String c) {
    	sendWeiboContent = c;
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

    public String getDate() {
    	return date;
    }
    
    public void setDate(String d) {
    	date = d;
    }
    
    public String getTime() {
    	return time;
    }
    
    public void setTime(String t) {
    	time = t;
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
