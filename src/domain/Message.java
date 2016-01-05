package domain;
public class Message {
	String messageId;
	String fromUserId;
	String toUserId;
	String messageContent;
	int messageType;
	public static int messagePublicTypeValue = 1;
	public static int messagePrivateTypeValue = 2;
	public Message(){
	}
	public Message(String messageId,String fromUserId,String toUserId,String messageContent,int type){
		this.messageId = messageId;
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.messageContent = messageContent;
		this.messageType = type;	
	}
	public String getMessageId(){
		return messageId;
	}
	public String getFromUserId(){
		return fromUserId;
	}
	public String getToUserId(){
		return toUserId;
	}
	
	public String getMessageContent(){
		return messageContent;
	}
	public int getMessageType(){
		return messageType;
	}
	public void setMessageId(String mId){
		messageId = mId;
	}
	public void setMessageFromUserId(String fromUser){
		this.fromUserId = fromUser;
	}
	public void setMessageToUserId(String toUser){
		this.toUserId = toUser;
	}
	public void setMessageContent(String c){
		messageContent = c;
	}
	public void setMessageType(int type){
		messageType = type;
	}
	public boolean add2db(){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		return t.addMessage(this);
	}
	public boolean removeFromDb(){
		dao.impl.MessageDaoImpl t = new dao.impl.MessageDaoImpl();
		return t.removeMessage(this);
	}
	
}
