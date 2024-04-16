package kr.co.dingdong.domain;

public class Note {

	private int idx;
	private String sender;
	private String receiver;
	private String content;
	private int read;
	private int del;
	private String etc;
	private String date;

	public Note() {
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Note [idx=" + idx + ", sender=" + sender + ", receiver=" + receiver + ", content=" + content + ", read="
				+ read + ", del=" + del + ", etc=" + etc + ", date=" + date + "]";
	}
	
	

}
