package com.yal.toti.yu.member.domain;


public class RequestMemberRegist {
	// 폼과 이름 맞춤
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private char m_ver;
	private char m_gender;	
	

	
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

	

	@Override
	public String toString() {
		return "RequestMemberRegist [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email=" + m_email
				+ ", m_ver=" + m_ver + ", m_gender=" + m_gender + "]";
	}

	public MemberInfo toMemberInfo() {
		MemberInfo info = new MemberInfo();
		info.setM_id(m_id);
		info.setM_name(m_name);
		info.setM_pw(m_pw);
		info.setM_email(m_email);
		info.setM_ver(m_ver);
		info.setM_gender(m_gender);
		
		return info;
	}
	
}
