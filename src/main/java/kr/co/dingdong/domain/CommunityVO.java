package kr.co.dingdong.domain;

public class CommunityVO {

	private int boardNum;
	private String title;
	private String content;
	private String nickname;
	private String id;
	private String regDate;
	private int views;
	private int reply;
	private int good;
	private int bad;
	private int notice;
	private int edit;
	
	private int point;

	private String editDate;
	private int del;
	private String delDate;
	private int report;
	private int jjim;
	private String shareurl;
	private int membership;
	private int category;
	private String profile;

	private int memberIdx;
	
	

	public CommunityVO() {
		super();
	}



	public CommunityVO(int boardNum, String title, String content, String nickname, String id, String regDate,
			int views, int reply, int good, int bad, int notice, int edit, int point, String editDate, int del,
			String delDate, int report, int jjim, String shareurl, int membership, int category, String profile,
			int memberIdx) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.nickname = nickname;
		this.id = id;
		this.regDate = regDate;
		this.views = views;
		this.reply = reply;
		this.good = good;
		this.bad = bad;
		this.notice = notice;
		this.edit = edit;
		this.point = point;
		this.editDate = editDate;
		this.del = del;
		this.delDate = delDate;
		this.report = report;
		this.jjim = jjim;
		this.shareurl = shareurl;
		this.membership = membership;
		this.category = category;
		this.profile = profile;
		this.memberIdx = memberIdx;
	}



	public int getBoardNum() {
		return boardNum;
	}



	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	public int getReply() {
		return reply;
	}



	public void setReply(int reply) {
		this.reply = reply;
	}



	public int getGood() {
		return good;
	}



	public void setGood(int good) {
		this.good = good;
	}



	public int getBad() {
		return bad;
	}



	public void setBad(int bad) {
		this.bad = bad;
	}



	public int getNotice() {
		return notice;
	}



	public void setNotice(int notice) {
		this.notice = notice;
	}



	public int getEdit() {
		return edit;
	}



	public void setEdit(int edit) {
		this.edit = edit;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public String getEditDate() {
		return editDate;
	}



	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}



	public int getDel() {
		return del;
	}



	public void setDel(int del) {
		this.del = del;
	}



	public String getDelDate() {
		return delDate;
	}



	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}



	public int getReport() {
		return report;
	}



	public void setReport(int report) {
		this.report = report;
	}



	public int getJjim() {
		return jjim;
	}



	public void setJjim(int jjim) {
		this.jjim = jjim;
	}



	public String getShareurl() {
		return shareurl;
	}



	public void setShareurl(String shareurl) {
		this.shareurl = shareurl;
	}



	public int getMembership() {
		return membership;
	}



	public void setMembership(int membership) {
		this.membership = membership;
	}



	public int getCategory() {
		return category;
	}



	public void setCategory(int category) {
		this.category = category;
	}



	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	public int getMemberIdx() {
		return memberIdx;
	}



	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}



	@Override
	public String toString() {
		return "CommunityVO [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", nickname="
				+ nickname + ", id=" + id + ", regDate=" + regDate + ", views=" + views + ", reply=" + reply + ", good="
				+ good + ", bad=" + bad + ", notice=" + notice + ", edit=" + edit + ", point=" + point + ", editDate="
				+ editDate + ", del=" + del + ", delDate=" + delDate + ", report=" + report + ", jjim=" + jjim
				+ ", shareurl=" + shareurl + ", membership=" + membership + ", category=" + category + ", profile="
				+ profile + ", memberIdx=" + memberIdx + "]";
	}

	
	
}

