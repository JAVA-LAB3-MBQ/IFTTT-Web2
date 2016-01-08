package dao;

import domain.*;

public interface IUserDao {
	public User find(String userName, String userPwd);
	public User findByName(String userName);
	public void add(User user);
	public User find(String userId);
	public boolean remove(String userId);
	public boolean changeUserStatus(String userId, int status);
}
