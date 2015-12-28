package service.impl;

import domain.IfThis;
import domain.Task;
import domain.ThenThat;
import service.ITaskService;
import dao.impl.TaskDaoImpl;

public class TaskServiceImpl implements ITaskService {
	
	public Task addTask(String userId, String tId, String tName, IfThis this_, ThenThat that_) {
		// construct a task
		Task task = new Task(userId, tId, tName, this_.getThisId(), that_.getThatId(), this_.getThisType(), that_.getThatType());	
		task.setThisInfo(this_.getThisInfo());
		task.setThatInfo(that_.getThatInfo());
		task.setThisIconPath(this_.getThisIconPath());
		task.setThatIconPath(that_.getThatIconPath());
		task.setTaskStatus(Task.pausedStatus);
		
		// add this_ into database
		this_.add2Db();
		
	    // add that_ into database
        that_.add2Db();
		// add task into database
		TaskDaoImpl tdb = new TaskDaoImpl();
		tdb.addTask(task);
        
        return task;
	}
	
	public Task editTask(String userId, String tId, String tName, IfThis this_, ThenThat that_) {
		// remove old task
		this.removeTask(tId);
				
		// add new task
		this.addTask(userId, tId, tName, this_, that_);
				
		Task t = new Task(userId, tId, tName, this_, that_);
		return t;
	}

	public boolean removeTask(String taskId) {
		TaskDaoImpl tdb = new TaskDaoImpl();
		return tdb.removeTask(taskId);
	}

	public Task getTask(String taskId) {
		// get the Task from db
		TaskDaoImpl tdb = new TaskDaoImpl();
		Task t = tdb.getATask(taskId);
		
		return t;
	}
	public boolean startTask(String taskId) {
		TaskDaoImpl tdb = new TaskDaoImpl();
		return tdb.startTask(taskId);
	}
	
	public boolean pauseTask(String taskId) {
	    TaskDaoImpl tdb = new TaskDaoImpl();
		return tdb.pauseTask(taskId);
	}
}
