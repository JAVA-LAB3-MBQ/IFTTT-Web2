package dao;
import domain.Message;
public interface IMessageDao {
	public boolean addMessage(Message mess);
	public boolean removeMessage(Message mess);
}
