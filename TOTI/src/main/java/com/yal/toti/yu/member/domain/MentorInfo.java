package com.yal.toti.yu.member.domain;

public class MentorInfo {

	private int m_idx;
	private int coin;
	private String location;
	private int cate_idx;
	
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



	
	

	public int getCate_idx() {
		return cate_idx;
	}



	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}



	



	@Override
	public String toString() {
		return "MentorInfo [m_idx=" + m_idx + ", coin=" + coin + ", location=" + location + ", cate_idx=" + cate_idx
				+ "]";
	}



	public MentorInfo(int m_idx, int coin, String location, int cate_idx) {
		super();
		this.m_idx = m_idx;
		this.coin = coin;
		this.location = location;
		this.cate_idx = cate_idx;

	}

	
}
