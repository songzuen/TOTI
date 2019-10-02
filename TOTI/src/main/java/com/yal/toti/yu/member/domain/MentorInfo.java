package com.yal.toti.yu.member.domain;

public class MentorInfo {

	private int m_idx;
	private int coin;
	private String location;
	
	//default
	
	public MentorInfo() {
	
	}
	
	
	
	public int getM_idx() {
		return m_idx;
	}



	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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



	
	

	@Override
	public String toString() {
		return "MentorInfo [m_idx=" + m_idx + ", coin=" + coin + ", location=" + location + "]";
	}



	public MentorInfo(int m_idx, int coin, String location) {
		super();
		this.m_idx = m_idx;
		this.coin = coin;
		this.location = location;

	}

	
}
