/*
 * studyroom int AI PK 
name varchar(30) 
del int 
fileName longtext 
content longtext
 */


package kr.co.dingdong.domain;

public class StudyRoomDTO {

	private int studyroom;	//지점번호
	private String name;	//지점이름
	private int del;		//지점삭제여부
	private String fileName;//사진
	private String content;	//내용
	
	
	
	public StudyRoomDTO() {}
	
	public StudyRoomDTO(int studyroom, String name, int del, String fileName, String content) {
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
		return "StudyRoomDTO [studyroom=" + studyroom + ", name=" + name + ", del=" + del + ", fileName=" + fileName
				+ ", content=" + content + "]";
	}
	
	
	
}
