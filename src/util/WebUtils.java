package util;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

import domain.IfThis;
import domain.ThenThat;
import domain.User;
public class WebUtils {
	/*
	 * convert the http request to an object
	 */
	public static <T> T request2Bean(HttpServletRequest request,Class<T> clazz){
		try{
			T bean = clazz.newInstance();
			Enumeration<String> e = request.getParameterNames(); 
			while(e.hasMoreElements()){
				String name = (String) e.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);
			}
			return bean;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * convert 'thisType' from jsp to integer in IfThis 
	 */
	public static int thisTypeString2Int(String t) {
		if(t.equals("RECEIVE_MAIL") == true) {
			return IfThis.thisReceiveMailTypeValue;
		}
		else if(t.equals("TIME") == true) {
			return IfThis.thisTimeTypeValue;
		}
		else if(t.equals("LISTEN_WEIBO") == true) {
			return IfThis.thisListenWeiboTypeValue;
		}
		else {
			System.out.println("WebUtil thisTypeString2Int 48, unknown thisType");
			return -1;
		}
	}
	
	/*
	 * convert 'thatType' from jsp to integer in ThenThat
	 */
	public static int thatTypeString2Int(String t) {
		if(t.equals("SEND_MAIL") == true) {
			return ThenThat.thatSendMailTypeValue;
		}
		else if(t.equals("SEND_WEIBO") == true) {
			return ThenThat.thatSendWeiboTypeValue;
		}
		else {
			System.out.println("WebUtil thisTypeString2Int 65, unknown thatType");
			return -1;
		}
	}
	
	/*
	 * convert 'thisType' from IfThis to String in jsp 
	 */
	public static String thisTypeInt2String(int t) {
		switch(t) {
		case IfThis.thisReceiveMailTypeValue: return "RECEIVE_MAIL";
		case IfThis.thisTimeTypeValue: return "TIME";
		case IfThis.thisListenWeiboTypeValue : return "LISTEN_WEIBO";
		default: System.out.println("WebUtil thisTypeString2Int 78, unknown thisType"); 
		         return null;
		}
	}
	
	/*
	 * convert 'thisType' from ThenThat to String in jsp 
	 */
	public static String thatTypeInt2String(int t) {
		switch(t) {
		case ThenThat.thatSendWeiboTypeValue: return "SEND_WEIBO";
		case ThenThat.thatSendMailTypeValue: return "SEND_MAIL";
		default: System.out.println("WebUtil thatTypeString2Int 90, unknown thatType"); 
		         return null;
		}
	}
 }
