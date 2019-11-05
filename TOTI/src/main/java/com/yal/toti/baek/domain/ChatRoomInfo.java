package com.yal.toti.baek.domain;

public class ChatRoomInfo {

	private int room_num;
	private int room_user;
	private String room_username;
	private String room_userphoto;
	private int room_target;
	private String room_targetname;
	private String room_targetphoto;
	private String room_lastmsg;
	private String room_lastmsgTime;
	private String cate_name;
	private String service_name;

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getRoom_user() {
		return room_user;
	}

	public void setRoom_user(int room_user) {
		this.room_user = room_user;
	}

	public String getRoom_username() {
		return room_username;
	}

	public void setRoom_username(String room_username) {
		this.room_username = room_username;
	}

	public String getRoom_userphoto() {
		return room_userphoto;
	}

	public void setRoom_userphoto(String room_userphoto) {
		this.room_userphoto = room_userphoto;
	}

	public int getRoom_target() {
		return room_target;
	}

	public void setRoom_target(int room_target) {
		this.room_target = room_target;
	}

	public String getRoom_targetname() {
		return room_targetname;
	}

	public void setRoom_targetname(String room_targetname) {
		this.room_targetname = room_targetname;
	}

	public String getRoom_targetphoto() {
		return room_targetphoto;
	}

	public void setRoom_targetphoto(String room_targetphoto) {
		this.room_targetphoto = room_targetphoto;
	}

	public String getRoom_lastmsg() {
		return room_lastmsg;
	}

	public void setRoom_lastmsg(String room_lastmsg) {
		this.room_lastmsg = room_lastmsg;
	}

	public String getRoom_lastmsgTime() {
		return room_lastmsgTime;
	}

	public void setRoom_lastmsgTime(String room_lastmsgTime) {
		this.room_lastmsgTime = room_lastmsgTime;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

}
