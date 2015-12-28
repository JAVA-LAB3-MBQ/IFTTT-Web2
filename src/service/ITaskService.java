package service;

import domain.IfThis;
import domain.Task;
import domain.ThenThat;

public interface ITaskService {

	public Task addTask(String userId, String tId, String tName, IfThis this_, ThenThat that_);
	
	public Task editTask(String userId, String tId, String tName, IfThis this_, ThenThat that_);
	
	public boolean removeTask(String taskId);
<<<<<<< HEAD
=======
	
	public Task getTask(String taskId);
>>>>>>> acaa7f1a0ffc3698bb627cb0d84f1d3fc8a0ab34

    public boolean startTask(String taskId);
    
    public boolean pauseTask(String taskId);
}
