package service.impl;
import java.util.ArrayList;
import domain.Message;
public class MessageServiceImpl {
	public ArrayList<Message> sendMessage(String messageId, int type, String fromUserId, String toUserId, String content){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		Message mess = new Message();
		mess.setMessageId(messageId);
		mess.setMessageType(type);
		mess.setMessageFromUserId(fromUserId);
		mess.setMessageToUserId(toUserId);
		mess.setMessageContent(content);
		t.addMessage(mess);
		return t.getAllMessages();
	}
	
	public ArrayList<Message> sendMessage(Message m) {
		String messageId = m.getMessageId();
		String fromUserId = m.getFromUserId();
		String toUserId = m.getToUserId();
		String content = m.getMessageContent();
		int type = m.getType();
		return sendMessage(messageId, type, fromUserId, toUserId, content);
	}
	
	public ArrayList<Message> deleteMessage(String messageId){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		t.removeMessage(messageId);
		return t.getAllMessages();
	}
	
	public ArrayList<Message> getAllMessages() {
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		return t.getAllMessages();
	}
}
