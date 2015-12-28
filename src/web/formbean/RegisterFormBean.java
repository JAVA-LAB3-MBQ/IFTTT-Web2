package web.formbean;

import java.util.HashMap;
import java.util.Map;

public class RegisterFormBean {
	// names in RegisterFormBean must be the same with 
	private String userName;
	
	private String userPwd;

	private String confirmPwd;
	
	/*
	 * error warnings appear in the page when inputing invalid information
	 */
	private Map<String, String> errors = new HashMap<String, String>();

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	/*
	 * cheak if the register information valid
	 */
	public boolean isRegiInfoValid() {

		boolean isValid = true;
        
		// userName
		if (this.userName == null || this.userName.trim().equals("")) {
			isValid = false;
			errors.put("userName", "cannot be empty");
		} else {
			if (!this.userName.matches("[0-9a-zA-Z]{1,20}")) {
				isValid = false;
				errors.put("userName", "only can contain numbers and letters");
			}
		}

		// userPwd
		if (this.userPwd == null || this.userPwd.trim().equals("")) {
			isValid = false;
			errors.put("userPwd", "cannot be empty");
		} else {
			if (!this.userPwd.matches("[\\d|a-zA-Z]{6,12}")) {
				isValid = false;
				errors.put("userPwd", "only can contain 3~12 numbers and letters");
			}
		}

		// confirmPwd must be the same with userPwd
		if (this.confirmPwd != null) {
			if (!this.confirmPwd.equals(this.userPwd)) {
				isValid = false;
				errors.put("confirmPwd", "different password");
			}
		}

		return isValid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
}
