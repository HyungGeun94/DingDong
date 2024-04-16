/*
 * reservation_number varchar(15) PK
 * studyroom_number int
room_number int
member_id varchar(15)
date datetime
start int
end int
party int
pay_with varchar(15)
del int
state int

 * 
 * 
 */

package kr.co.dingdong.domain;

public class Reservation {

	private String reservationNumber;
	private String reservationDate;
	private int studyroomNumber;
	private int roomNumber;
	private String memberId;
	private String name;
	private String phone;
	private String email;
	private String date;
//	private int start;
//	private int end;

	private String start;
	private String end;

	private int party;
	private int cost;
	private String payWith;
	private int del;
	private String delDate;
	private int state;

	public Reservation() {
		super();
	}

	public Reservation(String reservationNumber, String reservationDate, int studyroomNumber, int roomNumber,
			String memberId, String name, String phone, String email, String date, String start, String end, int party,
			int cost, String payWith, int del, String delDate, int state) {
		super();
		this.reservationNumber = reservationNumber;
		this.reservationDate = reservationDate;
		this.studyroomNumber = studyroomNumber;
		this.roomNumber = roomNumber;
		this.memberId = memberId;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.date = date;
		this.start = start;
		this.end = end;
		this.party = party;
		this.cost = cost;
		this.payWith = payWith;
		this.del = del;
		this.delDate = delDate;
		this.state = state;
	}

	public String getReservationNumber() {
		return reservationNumber;
	}

	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStart() {
		return start;
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

	public int getParty() {
		return party;
	}

	public void setParty(int party) {
		this.party = party;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getPayWith() {
		return payWith;
	}

	public void setPayWith(String payWith) {
		this.payWith = payWith;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNumber=" + reservationNumber + ", reservationDate=" + reservationDate
				+ ", studyroomNumber=" + studyroomNumber + ", roomNumber=" + roomNumber + ", memberId=" + memberId
				+ ", name=" + name + ", phone=" + phone + ", email=" + email + ", date=" + date + ", start=" + start
				+ ", end=" + end + ", party=" + party + ", cost=" + cost + ", payWith=" + payWith + ", del=" + del
				+ ", delDate=" + delDate + ", state=" + state + "]";
	}

	

}
