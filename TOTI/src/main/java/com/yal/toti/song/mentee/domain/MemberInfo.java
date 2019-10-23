package com.yal.toti.song.mentee.domain;

import java.util.Date;
import java.util.List;

public class MemberInfo {
	private int m_idx;
	private String m_id;
	private String m_pw;
	private String m_name;
	private Date m_date;
	private String m_email;
	private char m_ver;
	private char m_gender;
	private String m_photo;
	
	
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public char getM_ver() {
		return m_ver;
	}
	public void setM_ver(char m_ver) {
		this.m_ver = m_ver;
	}
	public char getM_gender() {
		return m_gender;
	}
	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	
	public MemberInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberInfo(int m_idx, String m_id, String m_pw, String m_name, Date m_date, String m_email, char m_ver,
			char m_gender, String m_photo) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_date = m_date;
		this.m_email = m_email;
		this.m_ver = m_ver;
		this.m_gender = m_gender;
		this.m_photo = m_photo;
	}
	
	
	
}
