package web.formbean;

import java.util.ArrayList;
import domain.Message;

public class MessageFormBean {
	String fromUserId;
	String toUserName;
	String messageType;
	String messageContent;
	String messageId;
	String userId;
	ArrayList<Message> messages;
	
	public void setUserId(String uid) {
		userId = uid;
	}
	public String getUserId() {
		return userId;
	}
	public void setToUserName(String n) {
		toUserName = n;
	}
	public String getToUserName() {
		return toUserName;
	}
	
	public void setMessageId(String id) {
		messageId = id;
	}
	
	public String getMessageId() {
		return messageId;
	}
	
	public void setFromUserId(String fui) {
		fromUserId = fui;
	}
	
	public void setMessageType(String mt) {
		messageType = mt;
	}
	public void setMessageContent(String c) {
		messageContent = c;
	}
	public void setMessages(ArrayList<Message> a) {
		messages = a;
	}
	
	public String getFromUserId() {
		return fromUserId;
	}
	
	public String getMessageType() {
		return messageType;
	}
	
	public int getMessageIntType() {
		if(messageType.equals("PUBLIC")) {
			return Message.messagePublicTypeValue;
		}
		else if(messageType.equals("PRIVATE")) {
			return Message.messagePrivateTypeValue;
		}
		return -1;
	}
 	
	public String getMessageContent() {
		return messageContent;
	}
	public ArrayList<Message> getMessages() {
		return messages;
	}
 }
