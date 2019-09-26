package com.yal.toti.baek.domain;

public class ChatRoomInfo {

	private int room_num;
	private int room_cat;
	private int room_user;
	private int room_target;
	private String last_msg;

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRoom_cat() {
		return room_cat;
	}

	public void setRoom_cat(int room_cat) {
		this.room_cat = room_cat;
	}

	public int getRoom_user() {
		return room_user;
	}

	public void setRoom_user(int room_user) {
		this.room_user = room_user;
	}

	public int getRoom_target() {
		return room_target;
	}

	public void setRoom_target(int room_target) {
		this.room_target = room_target;
	}

	public String getLast_msg() {
		return last_msg;
	}

	public void setLast_msg(String last_msg) {
		this.last_msg = last_msg;
	}

	@Override
	public String toString() {
		return "ChatRoomInfo [room_num=" + room_num + ", room_cat=" + room_cat + ", room_user=" + room_user
				+ ", room_target=" + room_target + ", last_msg=" + last_msg + "]";
	}

}
