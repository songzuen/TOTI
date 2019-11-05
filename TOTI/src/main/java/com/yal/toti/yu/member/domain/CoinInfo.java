package com.yal.toti.yu.member.domain;

public class CoinInfo {

	private int idx;
	private String id;
	private String name;
	private int coin;
	
	public CoinInfo() {}
	

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}

	@Override
	public String toString() {
		return "coinInfo [idx=" + idx + ", id=" + id + ", name=" + name + ", coin=" + coin + "]";
	}

	public CoinInfo(int idx, String id, String name, int coin) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.coin = coin;
	}
	
	
	
}
