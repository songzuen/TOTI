package com.yal.toti.baek.domain;

import java.sql.Timestamp;

public class MemberInfo {
	private Integer m_idx;
	private String m_id;
	private String m_pw;
	private String m_name;

	private String m_ver;
	private String m_gender;
	private String m_photo;
	private String m_code;
	private String m_codeVer;
	private Timestamp m_date;

	public Integer getM_idx() {
		return m_idx;
	}

	public void setM_idx(Integer m_idx) {
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

	public String getM_ver() {
		return m_ver;
	}

	public void setM_ver(String m_ver) {
		this.m_ver = m_ver;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public String getM_codeVer() {
		return m_codeVer;
	}

	public void setM_codeVer(String m_codeVer) {
		this.m_codeVer = m_codeVer;
	}

	public Timestamp getM_date() {
		return m_date;
	}

	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}

	public MemberInfo(Integer m_idx, String m_id, String m_pw, String m_name, String m_ver,
			String m_gender, String m_photo, String m_code, String m_codeVer, Timestamp m_date) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_ver = m_ver;
		this.m_gender = m_gender;
		this.m_photo = m_photo;
		this.m_code = m_code;
		this.m_codeVer = m_codeVer;
		this.m_date = m_date;
	}

	@Override
	public String toString() {
		return "MemberInfo [m_idx=" + m_idx + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_ver=" + m_ver + ", m_gender=" + m_gender + ", m_photo=" + m_photo + ", m_code="
				+ m_code + ", m_codeVer=" + m_codeVer + ", m_date=" + m_date + "]";
	}

}