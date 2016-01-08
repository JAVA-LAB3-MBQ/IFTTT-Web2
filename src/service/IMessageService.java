package service;
import java.util.ArrayList;
import domain.Message;
public interface IMessageService {
	public ArrayList<Message> sendMessage(String messageId, int type, String fromUserId, String toUserId, String content);
	public ArrayList<Message> deleteMessage(String messageId);
}
