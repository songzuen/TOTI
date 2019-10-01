package com.yal.toti.song.mentor.domain;

public class Coin {
	
	private int tor_coin;
	private int mento_idx;
	public int getTor_coin() {
		return tor_coin;
	}
	public void setTor_coin(int tor_coin) {
		this.tor_coin = tor_coin;
	}
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	public Coin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Coin(int tor_coin, int mento_idx) {
		super();
		this.tor_coin = tor_coin;
		this.mento_idx = mento_idx;
	}
	
	
}
