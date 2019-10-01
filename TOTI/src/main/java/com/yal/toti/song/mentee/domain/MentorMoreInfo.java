package com.yal.toti.song.mentee.domain;

public class MentorMoreInfo {
	private int mento_idx;
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
	public String getP_career() {
		return p_career;
	}
	public void setP_career(String p_career) {
		this.p_career = p_career;
	}
	public String getP_long() {
		return p_long;
	}
	public void setP_long(String p_long) {
		this.p_long = p_long;
	}
	public MentorMoreInfo(int mento_idx, String p_shot, String p_pay, String p_edu, String p_career, String p_long) {
		super();
		this.mento_idx = mento_idx;
		this.p_shot = p_shot;
		this.p_pay = p_pay;
		this.p_edu = p_edu;
		this.p_career = p_career;
		this.p_long = p_long;
	}
	public MentorMoreInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
