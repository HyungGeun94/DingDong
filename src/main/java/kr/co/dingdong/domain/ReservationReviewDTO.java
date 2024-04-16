/*
 * 
review_number bigint AI PK 
member_id varchar(15) 
content longtext 
score int 
del int 
blind int 
Field varchar(255) 
room_number int
 * 
 */

package kr.co.dingdong.domain;

public class ReservationReviewDTO {

	private int reviewNumber; 			//리뷰번호
	private String memberId;			//회원아이디
	private String content;				//내용
	private int score;					//별점
	private int del;					//삭제
	private int blind;					//블라인드여부
	private String reservationNumber;	//예약번호	
	private int studyroomNumber;		//스터디룸번호
	private int roomNumber;				//룸번호
	private int state;					//예약상태
	private String nickname;			//닉네임
	
	
	
	
	public ReservationReviewDTO() {
		super();
	}
	
	

	public ReservationReviewDTO(int reviewNumber, String memberId, String content, int score, int del, int blind,
			String reservationNumber, int studyroomNumber, int roomNumber, int state, String nickname) {
		super();
		this.reviewNumber = reviewNumber;
		this.memberId = memberId;
		this.content = content;
		this.score = score;
		this.del = del;
		this.blind = blind;
		this.reservationNumber = reservationNumber;
		this.studyroomNumber = studyroomNumber;
		this.roomNumber = roomNumber;
		this.state = state;
		this.nickname = nickname;
	}




	public int getReviewNumber() {
		return reviewNumber;
	}



	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getScore() {
		return score;
	}



	public void setScore(int score) {
		this.score = score;
	}



	public int getDel() {
		return del;
	}



	public void setDel(int del) {
		this.del = del;
	}



	public int getBlind() {
		return blind;
	}



	public void setBlind(int blind) {
		this.blind = blind;
	}



	public String getReservationNumber() {
		return reservationNumber;
	}



	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}



	public int getStudyroomNumber() {
		return studyroomNumber;
	}



	public void setStudyroomNumber(int studyroomNumber) {
		this.studyroomNumber = studyroomNumber;
	}



	public int getRoomNumber() {
		return roomNumber;
	}



	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}





	public int getState() {
		return state;
	}




	public void setState(int state) {
		this.state = state;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	
	

	@Override
	public String toString() {
		return "ReservationReviewDTO [reviewNumber=" + reviewNumber + ", memberId=" + memberId + ", content=" + content
				+ ", score=" + score + ", del=" + del + ", blind=" + blind + ", reservationNumber=" + reservationNumber
				+ ", studyroomNumber=" + studyroomNumber + ", roomNumber=" + roomNumber + ", state=" + state
				+ ", nickname=" + nickname + "]";
	}





	


	
	
	
	
	
	
}

