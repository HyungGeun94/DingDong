package kr.co.dingdong.domain;

public class Studyroom {

//	private int number;
	private int studyroom;
	private String name;
	private int del;
	private String fileName;
	private String content;

	public Studyroom() {
		super();
	}

	public Studyroom(int studyroom, String name, int del, String fileName, String content) {
		super();
		this.studyroom = studyroom;
		this.name = name;
		this.del = del;
		this.fileName = fileName;
		this.content = content;
	}

	public int getStudyroom() {
		return studyroom;
	}

	public void setStudyroom(int studyroom) {
		this.studyroom = studyroom;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Studyroom [studyroom=" + studyroom + ", name=" + name + ", del=" + del + ", fileName=" + fileName
				+ ", content=" + content + "]";
	}

	

	
	

}
