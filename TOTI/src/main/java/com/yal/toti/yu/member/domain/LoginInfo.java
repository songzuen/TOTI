package com.yal.toti.yu.member.domain;

import java.util.Date;

public class LoginInfo {
	
	private String m_id;
	private String m_name;
	private String m_photo;
	private String m_email;
	private Date m_date;
	
	public LoginInfo(String m_id, String m_name, String m_photo, Date m_date, String m_email) {	
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_photo = m_photo;
		this.m_date = m_date;
		this.m_email = m_email;
	}


	public String getM_id() {
		return m_id;
	}


	public String getM_name() {
		return m_name;
	}


	public String getM_photo() {
		return m_photo;
	}


	public Date getM_date() {
		return m_date;
	}
	public String getM_email() {
		return m_email;
	}


	@Override
	public String toString() {
		return "LoginInfo [m_id=" + m_id + ", m_name=" + m_name + ", m_photo=" + m_photo + ", m_email=" + m_email
				+ ", m_date=" + m_date + "]";
	}


	
	

}
