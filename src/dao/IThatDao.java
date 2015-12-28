package dao;

import domain.*;

public interface IThatDao {
	public boolean addThat(ThenThatSendWeibo that_);
	public boolean addThat(ThenThatSendMail that_);
	
	public boolean removeThat(ThenThatSendWeibo that_);
	public boolean removeThat(ThenThatSendMail that_);
}
