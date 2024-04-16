package kr.co.dingdong.domain;

public class CommunityReplyVO {
	private String content, id, date;
	private int replyNum, boardNum, edit, reReply, good, bad, step, replyOrderNum, memberIdx;

	private String profile;
	private String nickname;
	private int idx;
	private int del;
	
	
	public CommunityReplyVO() {
		super();
	}


	public CommunityReplyVO(String content, String id, String date, int replyNum, int boardNum, int edit, int reReply,
			int good, int bad, int step, int replyOrderNum, int memberIdx, String profile, String nickname, int idx,
			int del) {
		super();
		this.content = content;
		this.id = id;
		this.date = date;
		this.replyNum = replyNum;
		this.boardNum = boardNum;
		this.edit = edit;
		this.reReply = reReply;
		this.good = good;
		this.bad = bad;
		this.step = step;
		this.replyOrderNum = replyOrderNum;
		this.memberIdx = memberIdx;
		this.profile = profile;
		this.nickname = nickname;
		this.idx = idx;
		this.del = del;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getReplyNum() {
		return replyNum;
	}


	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}


	public int getBoardNum() {
		return boardNum;
	}


	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}


	public int getEdit() {
		return edit;
	}


	public void setEdit(int edit) {
		this.edit = edit;
	}


	public int getReReply() {
		return reReply;
	}


	public void setReReply(int reReply) {
		this.reReply = reReply;
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


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	public int getReplyOrderNum() {
		return replyOrderNum;
	}


	public void setReplyOrderNum(int replyOrderNum) {
		this.replyOrderNum = replyOrderNum;
	}


	public int getMemberIdx() {
		return memberIdx;
	}


	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "CommunityReplyVO [content=" + content + ", id=" + id + ", date=" + date + ", replyNum=" + replyNum
				+ ", boardNum=" + boardNum + ", edit=" + edit + ", reReply=" + reReply + ", good=" + good + ", bad="
				+ bad + ", step=" + step + ", replyOrderNum=" + replyOrderNum + ", memberIdx=" + memberIdx
				+ ", profile=" + profile + ", nickname=" + nickname + ", idx=" + idx + ", del=" + del + "]";
	}
	
	
	


}
