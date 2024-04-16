package kr.co.dingdong.domain;

public class RoomSelectDTO {

	private int studyroom;		//지점번호
	private String studyName;	//지점이름
	private int roomNumber;		//룸번호
	private String roomName;	//룸이름
	private String content;		//설명
	
	
	
	public RoomSelectDTO(){}


	public RoomSelectDTO(int studyroom, String studyName, int roomNumber, String roomName, String content) {
		super();
		this.studyroom = studyroom;
		this.studyName = studyName;
		this.roomNumber = roomNumber;
		this.roomName = roomName;
		this.content = content;
	}


	public int getStudyroom() {
		return studyroom;
	}


	public void setStudyroom(int studyroom) {
		this.studyroom = studyroom;
	}


	public String getstudyName() {
		return studyName;
	}


	public void setstudyName(String studyName) {
		this.studyName = studyName;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getRoomNumber() {
		return roomNumber;
	}


	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}


	@Override
	public String toString() {
		return "RoomListDTO [studyroom=" + studyroom + ", studyName=" + studyName + ", roomNumber=" + roomNumber
				+ ", roomName=" + roomName + ", content=" + content + "]";
	}

	
	
	
	
}
