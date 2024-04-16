/*
 * 
 * idx int AI PK
id varchar(15) PK
password varchar(20)
nickname varchar(15)
email varchar(30)
access int
 * 
 * 
 */

package kr.co.dingdong.domain;

public class Admin {

	private String id;
	private String password;
	private String nickname;
	private String email;
	private int access;
	private String profile;

	public Admin() {
		super();
	}

	public Admin(String id, String password, String nickname, String email, int access, String profile) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.access = access;
		this.setProfile(profile);
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", password=" + password + ", nickname=" + nickname + ", email=" + email
				+ ", access=" + access + ", profile=" + profile + "]";
	}

}
