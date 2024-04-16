/*
*
id varchar(15) PK 
name varchar(25)
nickname varchar(15)
password varchar(20)
email varchar(15)
gender int
birth varchar(15)
phone varchar(15)
zone_code int
addr varchar(50)
detail_addr varchar(50)
point int
profile varchar(50)
grade int
report int
etc varchar(15)
signup_date datetime
del int
del_reason varchar(100)
del_date varchar(255)
change_date datetime
login_date datetime
rest int
 * 
 */

package kr.co.dingdong.domain;

public class Member {
	
	private int idx;
	private String id;
	private String name;
	private String nickname;
	private String password;
	private String email;
	private int gender;
	private String birth;
	private String phone;
	private int zoneCode;
	private String addr;
	private String detailAddr;
	private int point;
	private String profile;
	private int grade;
	private int report;
	private String signupDate;
	private int del;
	private String delReason;
	private String delDate;
	private String changeDate;
	private String loginDate;
	private int rest;
	private String etc;
	private int suspend;
	
	private int alarm;

	public Member() {
	}
	
	

	public Member(String id, String profile) {
		super();
		this.id = id;
		this.profile = profile;
	}



	public Member(int idx, String id, String name, String nickname, String password, String email, int gender,
			String birth, String phone, int zoneCode, String addr, String detailAddr, int point, String profile,
			int grade, int report, String signupDate, int del, String delReason, String delDate, String changeDate,
			String loginDate, int rest, String etc, int suspend, int alarm) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.zoneCode = zoneCode;
		this.addr = addr;
		this.detailAddr = detailAddr;
		this.point = point;
		this.profile = profile;
		this.grade = grade;
		this.report = report;
		this.signupDate = signupDate;
		this.del = del;
		this.delReason = delReason;
		this.delDate = delDate;
		this.changeDate = changeDate;
		this.loginDate = loginDate;
		this.rest = rest;
		this.etc = etc;
		this.suspend = suspend;
		this.alarm = alarm;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(int zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(String signupDate) {
		this.signupDate = signupDate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getDelReason() {
		return delReason;
	}

	public void setDelReason(String delReason) {
		this.delReason = delReason;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public String getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}

	public int getRest() {
		return rest;
	}

	public void setRest(int rest) {
		this.rest = rest;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getSuspend() {
		return suspend;
	}

	public void setSuspend(int suspend) {
		this.suspend = suspend;
	}

	public int getAlarm() {
		return alarm;
	}

	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}

	@Override
	public String toString() {
		return "Member [idx=" + idx + ", id=" + id + ", name=" + name + ", nickname=" + nickname + ", password="
				+ password + ", email=" + email + ", gender=" + gender + ", birth=" + birth + ", phone=" + phone
				+ ", zoneCode=" + zoneCode + ", addr=" + addr + ", detailAddr=" + detailAddr + ", point=" + point
				+ ", profile=" + profile + ", grade=" + grade + ", report=" + report + ", signupDate=" + signupDate
				+ ", del=" + del + ", delReason=" + delReason + ", delDate=" + delDate + ", changeDate=" + changeDate
				+ ", loginDate=" + loginDate + ", rest=" + rest + ", etc=" + etc + ", suspend=" + suspend + ", alarm="
				+ alarm + "]";
	}

	

}
