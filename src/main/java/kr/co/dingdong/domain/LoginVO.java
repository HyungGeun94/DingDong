package kr.co.dingdong.domain;

public class LoginVO {
	
	private String id;
	private String password;
	
	public LoginVO() {
	}

	public LoginVO(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + "]";
	}
	

}
