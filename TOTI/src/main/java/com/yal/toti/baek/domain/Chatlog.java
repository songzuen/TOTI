package com.yal.toti.baek.domain;

public class Chatlog {
	private int message_num;
	private String message;
	private String message_date;
	private int room_num;
	private int msg_user;

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage_date() {
		return message_date;
	}

	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getMsg_user() {
		return msg_user;
	}

	public void setMsg_user(int msg_user) {
		this.msg_user = msg_user;
	}

	@Override
	public String toString() {
		return "Chatlog [message_num=" + message_num + ", message=" + message + ", message_date=" + message_date
				+ ", room_num=" + room_num + ", msg_user=" + msg_user + "]";
	}

}
