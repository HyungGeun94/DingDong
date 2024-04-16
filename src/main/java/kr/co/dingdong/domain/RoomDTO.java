/*
 * room_number int 
studyroom int 
name varchar(20) 
min int 
max int 
content longtext 
cost int 
del int 
file_name longtext
 * 
 */


package kr.co.dingdong.domain;

public class RoomDTO {

	private int roomNumber;		//룸번호
	private int studyroom;		//스터디룸 (FK)
	private String name;		//이름
	private int min;			//최소인원
	private int max;			//최대인원
	private String content;		//설명
	private int cost;			//비용(시간당)
	private int del;			//삭제 여부
	private String fileName;	//대표사진
	

	
	
	public RoomDTO() {}


	public RoomDTO(int roomNumber, int studyroom, String name, int min, int max, String content, int cost, int del,
			String fileName) {
		super();
		this.roomNumber = roomNumber;
		this.studyroom = studyroom;
		this.name = name;
		this.min = min;
		this.max = max;
		this.content = content;
		this.cost = cost;
		this.del = del;
		this.fileName = fileName;
	}


	public int getRoomNumber() {
		return roomNumber;
	}


	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
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


	public int getMin() {
		return min;
	}


	public void setMin(int min) {
		this.min = min;
	}


	public int getMax() {
		return max;
	}


	public void setMax(int max) {
		this.max = max;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
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

	
	

	@Override
	public String toString() {
		return "RoomDTO [roomNumber=" + roomNumber + ", studyroom=" + studyroom + ", name=" + name + ", min=" + min
				+ ", max=" + max + ", content=" + content + ", cost=" + cost + ", del=" + del + ", fileName=" + fileName
				+ "]";
	};
	
	
	
	
}
