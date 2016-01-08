package web.formbean;

import domain.User;
import java.util.ArrayList;
import domain.Message;

public class ManagerFormBean {
	ArrayList<User> users;
	ArrayList<Message> messages;
	
	public ArrayList<User> getUsers() {
		return users;
	}
	
	public void setUsers(ArrayList<User> u) {
		users = u;
	}
	
	public ArrayList<Message> getMessages() {
		return messages;
	}
	
	public void setMessages(ArrayList<Message> a) {
		messages = a;
	}
}
