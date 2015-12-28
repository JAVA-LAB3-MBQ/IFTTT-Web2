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
}
