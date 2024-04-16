package kr.co.dingdong.domain;

public class Alarm {

	private String idx;
	private String receiver;
	private String sender;
//	어디서 보냈는지
	private String info;
//	댓글인지, 구독 알림인지 질문에 대한 답변인지 등 
	private String category;
	private int read;
	private String etc;
	private String date;

	public Alarm() {
		super();
	}
	
	public Alarm(String receiver, String sender, String info, String category) {
		super();
		this.receiver = receiver;
		this.sender = sender;
		this.info = info;
		this.category = category;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
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
		return "Alarm [idx=" + idx + ", receiver=" + receiver + ", sender=" + sender + ", info=" + info + ", category="
				+ category + ", read=" + read + ", etc=" + etc + ", date=" + date + "]";
	}

}
