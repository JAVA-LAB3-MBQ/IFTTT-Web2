package weibo;

import weibo4j.Timeline;
import weibo4j.model.StatusWapper;
import weibo4j.model.WeiboException;
import weibo4j.examples.oauth2.Log;
import weibo4j.model.Status;

public class ForWeibo {
	static String access_token = "2.005a9yjB986STE65c5541eadH2CkfD";
	public ForWeibo(String a){
		access_token = a;
	}
//	public static void main(String[] args){
//		if(getWeibo("—’÷µ"))System.out.println(1);
//		System.out.println("lalala"+getCount());
//	}
	public boolean getWeibo(String args) {
//		String access_token = "2.00nQuStD0LGLGIc12d36cf698127OC";
		Timeline tm = new Timeline(access_token);
		boolean a=false;
		try {
			StatusWapper status = tm.getUserTimeline();
			String str=status.toString();
			int index1=str.indexOf("text");
			int index2=str.indexOf("source");
			//status.getStatuses().indexOf(0)
			//System.out.println(str.substring(index1+5, index2-2));
			//System.out.println(status.getTotalNumber());
			String str1=str.substring(index1+5, index2-2);
			a=str1.contains(args);
			System.out.println(str1+"e");
		} catch (WeiboException e) {
			e.printStackTrace();
		}
		
		return a;
	}
	public long getCount()
	{   long count=0;
		Timeline tm = new Timeline(access_token);
		try {
			StatusWapper status = tm.getUserTimeline();
			count=status.getTotalNumber();
		} 
		catch (WeiboException e) {
//			e.printStackTrace();
		}
		return count;
	}


	public void UpdateStatus (String arg){
			String statuses = arg;
			Timeline tm = new Timeline(access_token);
			try {
				Status status = tm.updateStatus(statuses);
				Log.logInfo(status.toString());
			} catch (WeiboException e) {
				e.printStackTrace();
			}	
		}
	
}

