package kr.co.dingdong.domain;

public class ReservedTime {
	private String start;
	private String end;

	public String getStart() {
		return start;
	}

	public ReservedTime(String start, String end) {
		super();
		this.start = start;
		this.end = end;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "ReservedTime [start=" + start + ", end=" + end + "]";
	}

}
