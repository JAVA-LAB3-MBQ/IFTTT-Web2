package service;

import domain.IfThis;
import domain.Task;
import domain.ThenThat;

public interface ITaskService {

	public Task addTask(String userId, String tId, String tName, IfThis this_, ThenThat that_);
	
	public Task editTask(String userId, String tId, String tName, IfThis this_, ThenThat that_);
	
	public boolean removeTask(String taskId);
	
	public Task getTask(String taskId);

    public boolean startTask(String taskId);
    
    public boolean pauseTask(String taskId);
}
