package domain;
import java.util.Date;
import util.DateStringUtil;
public class Task {
	public final static int pausedStatus = 0;
	public final static int startedStatus = 1;
	
	private String userId;  //任务所属的用户的id
	private String taskId;  //任务id
	private String taskName;//任务名称
	
	private String thisId, thatId;
	private int thisType, thatType;
	private String thisIconPath;
	private String thatIconPath;
	private String thisInfo, thatInfo;
	
	private String createTime;
	private int taskStatus;
	
	public Task(){
		createTime = (DateStringUtil.date2String(new Date()));
		taskStatus = Task.pausedStatus;
	}
	public Task(String userId, String taskId, String taskName, String thisId, String thatId, int thisType, int thatType){
		this.userId = userId;
		this.taskId = taskId;
		this.taskName = taskName;
		this.thisId = thisId;
		this.thatId = thatId;
		this.thisType = thisType;
		this.thatType = thatType;
		createTime = DateStringUtil.date2String(new Date());
	}
	
	public Task(String userId, String taskId, String taskName, String thisId, String thatId, int thisType, int thatType, String thisIconPath, String thatIconPath, String createTime, int taskStatus){
		this.userId = userId;
		this.taskId = taskId;
		this.taskName = taskName;
		this.thisId = thisId;
		this.thatId = thatId;
		this.thisType = thisType;
		this.thatType = thatType;
		this.thisIconPath = thisIconPath;
		this.thatIconPath = thatIconPath;
		this.createTime = createTime;
		this.taskStatus = taskStatus;
		createTime = DateStringUtil.date2String(new Date());
	}
	public Task(String userId, String taskId, String taskName, String thisId, String thatId, int thisType, int thatType, String thisIconPath, String thatIconPath, String createTime, int taskStatus, String thisInfo, String thatInfo){
		this.userId = userId;
		this.taskId = taskId;
		this.taskName = taskName;
		this.thisId = thisId;
		this.thatId = thatId;
		this.thisType = thisType;
		this.thatType = thatType;
		this.thisIconPath = thisIconPath;
		this.thatIconPath = thatIconPath;
		this.createTime = createTime;
		this.taskStatus = taskStatus;
		this.thisInfo = thisInfo;
		this.thatInfo = thatInfo;
		createTime = DateStringUtil.date2String(new Date());
	}
	public Task(String userId, String tId, String tName, IfThis this_, ThenThat that_){
		this.userId = userId;
		this.taskId = tId;
		this.taskName = tName;
		this.thisId = this_.getThisId();
		this.thatId = that_.getThatId();
		this.thisType = this_.getThisType();
		this.thatType = that_.getThatType();
		this.thisIconPath = this_.getThisIconPath();
		this.thatIconPath = that_.getThatIconPath();
		this.thisInfo = this_.getThisInfo();
		this.thatInfo = that_.getThatInfo();
	}
	public Task(String userId, String taskId, String taskName, IfThis this_, ThenThat that_, String thisIconPath, String thatIconPath, String thisInfo, String thatInfo){
		this.userId = userId;
		this.taskId = taskId;
		this.taskName = taskName;
		this.thisId = this_.getThisId();
		this.thatId = that_.getThatId();
		this.thisType = this_.getThisType();
		this.thatType = that_.getThatType();
		this.thisIconPath = thisIconPath;
		this.thatIconPath = thatIconPath;
		this.thisInfo = thisInfo;
		this.thatInfo = thatInfo;
	}
	
	public String getUserId() {
		return userId;
	}
	public String getTaskId(){
		return taskId;
	}
	public String getTaskName(){
		return taskName;
	}
	public String getThisId(){
		return thisId;
	}
	public String getThatId(){
		return thatId;
	}
	public int getThisType(){
		return thisType;
	}
	public int getThatType(){
		return thatType;
	}
	public String getThisIconPath(){
		return thisIconPath;
	}
	public String getThatIconPath(){
		return thatIconPath;
	}
	public String getCreateTime(){
		return createTime;
	}
	public int getTaskStatus(){
		return taskStatus;
	}
	public String getThisInfo(){
		return thisInfo;
	}
	public void setThisInfo(String i) {
		thisInfo = i;
	}
	public String getThatInfo(){
		return thatInfo;
	}
	public void setThatInfo(String i) {
		thatInfo = i;
	}
	public void setThisIconPath(String i) {
		thisIconPath = i;
	}
	public void setUserId(String uid) {
		userId = uid;
	}
	public void setThatIconPath(String i) {
		thatIconPath = i;
	}
	public void setTaskStatus(int i) {
		taskStatus = i;
	}
	public void setTaskId(String tid){
		taskId = tid;
	}
	public void setTaskName(String t){
		taskName = t;
	}
	public void setThisId(String thisId){
		this.thisId = thisId;
	}
	public void setThatId(String thatId){
		this.thatId = thatId;
	}
	public void setThisType(int t){
		thisType = t;
	}
	public void setThatType(int t){
		thatType = t;
	}
}
