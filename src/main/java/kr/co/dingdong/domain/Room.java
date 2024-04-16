/*
 * 
 * room_number int AI PK
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

public class Room {

	private int roomNumber;
	private int studyroom;
	private String name;
	private int min;
	private int max;
	private String content;
	private int cost;
	private int del;
	private String fileName;

	public Room() {
	}
	
	

	public Room(int roomNumber, int studyroom) {
		super();
		this.roomNumber = roomNumber;
		this.studyroom = studyroom;
	}



	public Room(int roomNumber, int studyroom, String name, int min, int max, String content, int cost, int del,
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
		return "Room [roomNumber=" + roomNumber + ", studyroom=" + studyroom + ", name=" + name + ", min=" + min
				+ ", max=" + max + ", content=" + content + ", cost=" + cost + ", del=" + del + ", fileName=" + fileName
				+ "]";
	}

	

}
