package dao;

import domain.Task;
import java.util.ArrayList;

public interface ITaskDao {
	public boolean addTask(Task t);
	public boolean removeTask(String tid);
	public ArrayList<Task> getTasks(String userId);
	public boolean startTask(String taskId);
	public boolean pauseTask(String taskId);
	public Task getATask(String tid);
}
