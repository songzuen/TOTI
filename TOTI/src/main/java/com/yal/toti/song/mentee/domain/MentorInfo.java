package com.yal.toti.song.mentee.domain;

import java.util.List;

public class MentorInfo {
	private int mento_idx;
	private int cate_idx;
	private int tor_coin;
	private String tor_location;
	private List<MentorMoreInfo> mentorMoreInfo;
	
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public int getTor_coin() {
		return tor_coin;
	}
	public void setTor_coin(int tor_coin) {
		this.tor_coin = tor_coin;
	}
	
	public String getTor_location() {
		return tor_location;
	}
	public void setTor_location(String tor_location) {
		this.tor_location = tor_location;
	}
	
	public List<MentorMoreInfo> getMentorMoreInfo() {
		return mentorMoreInfo;
	}
	public void setMentorMoreInfo(List<MentorMoreInfo> mentorMoreInfo) {
		this.mentorMoreInfo = mentorMoreInfo;
	}
	@Override
	public String toString() {
		return "MemtorInfo [mento_idx=" + mento_idx + ", cate_idx=" + cate_idx + ", tor_coin=" + tor_coin
				+ ", tor_location=" + tor_location + "]";
	}
	public MentorInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MentorInfo(int mento_idx, int cate_idx, int tor_coin, String tor_location,
			List<MentorMoreInfo> mentorMoreInfo) {
		super();
		this.mento_idx = mento_idx;
		this.cate_idx = cate_idx;
		this.tor_coin = tor_coin;
		this.tor_location = tor_location;
		this.mentorMoreInfo = mentorMoreInfo;
	}
	
	
}
