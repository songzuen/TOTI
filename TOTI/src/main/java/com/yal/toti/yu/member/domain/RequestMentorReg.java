package com.yal.toti.yu.member.domain;


public class RequestMentorReg {
	
	private int m_idx;
	private int coin;
	private String location;
	
	
	//default 생송자
	
	public RequestMentorReg() {}
	

	
	public int getIdx() {
		return m_idx;
	}



	public void setIdx(int idx) {
		this.m_idx = idx;
	}



	public int getCoin() {
		return coin;
	}



	public void setCoin(int coin) {
		this.coin = coin;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public RequestMentorReg(int idx, int coin, String location) {
		super();
		this.m_idx = idx;
		this.coin = coin;
		this.location = location;
		
	}


	@Override
	public String toString() {
		return "RequestMentorReg [idx=" + m_idx + ", coin=" + coin + ", location=" + location + "]";
	}



	public MentorInfo toMentorInfo() {
		MentorInfo mentorInfo = new MentorInfo();
		mentorInfo.setM_idx(m_idx);
		mentorInfo.setCoin(coin);
		mentorInfo.setLocation(location);
		
		
		return mentorInfo;
	
	}
	

}
