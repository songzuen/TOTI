package com.yal.toti.baek.domain;

public class MentorProfile {

	private int mento_idx;
	private String m_id;
	private String m_name;
	private String m_gender;
	private String m_photo;
	private String m_date;
	private String p_shot;
	private String p_pay;
	private String p_edu;
	private String p_career;
	private String p_long;

	public int getMento_idx() {
		return mento_idx;
	}

	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getP_shot() {
		return p_shot;
	}

	public void setP_shot(String p_shot) {
		this.p_shot = p_shot;
	}

	public String getP_pay() {
		return p_pay;
	}

	public void setP_pay(String p_pay) {
		this.p_pay = p_pay;
	}

	public String getP_edu() {
		return p_edu;
	}

	public void setP_edu(String p_edu) {
		this.p_edu = p_edu;
	}

	public String getP_long() {
		return p_long;
	}

	public void setP_long(String p_long) {
		this.p_long = p_long;
	}

	public String getP_career() {
		return p_career;
	}

	public void setP_career(String p_career) {
		this.p_career = p_career;
	}

	@Override
	public String toString() {
		return "MentorProfile [mento_idx=" + mento_idx + ", m_id=" + m_id + ", m_name=" + m_name + ", m_gender="
				+ m_gender + ", m_photo=" + m_photo + ", m_date=" + m_date + ", p_shot=" + p_shot + ", p_pay=" + p_pay
				+ ", p_edu=" + p_edu + ", p_career=" + p_career + ", p_long=" + p_long + "]";
	}

}