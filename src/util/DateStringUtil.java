package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateStringUtil {
	final static String pattern = "yyyy-MM-dd HH:mm";
	/* 
	 * convert a Date object to String
	 */
	public static String date2String(Date d) {
		return (new SimpleDateFormat(pattern)).format(d);
	}
	
	/*
	 * compare two "date"
	 */
	public static int compareDateString(String date1, String date2) {
		return date1.compareTo(date2);
	}
}
