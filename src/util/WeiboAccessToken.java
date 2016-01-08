package util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;


import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import weibo4j.Oauth;
import weibo4j.http.AccessToken;
import weibo4j.util.WeiboConfig;

public class WeiboAccessToken {
	// test
	public static void main(String args[]) {
		try {
			System.out.println(getAccessToken("18789682380", "012389"));
		}
		catch(Exception e) {
			System.out.println("get access token failed");
		}
	}
	public static String getAccessToken(String username, String password)  throws HttpException, IOException{
        String location = null;
        
        int begin = location.indexOf("code=");  
        if (begin != -1) {  
            int end = location.indexOf("&", begin);  
            if (end == -1)  
                end = location.length();  
            String code = location.substring(begin + 5, end);  
            if (code != null) {  
                Oauth oauth = new Oauth();  
                try{  
                    AccessToken token = oauth.getAccessTokenByCode(code);  
                    return token.getAccessToken();  
                }catch(Exception e){  
                    e.printStackTrace();  
                }  
            }
        }
        
        return null;
    }  
	
	public static String refreshAccessToken(String wbId, String wbPwb) {
		// todo: 更新用户微博access_token
		return null;
	}
}
