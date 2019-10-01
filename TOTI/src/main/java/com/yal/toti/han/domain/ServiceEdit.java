package com.yal.toti.han.domain;

public class ServiceEdit {
	
	private int mento_idx; // 고수 번호
	private int cate_idx; // 분야 번호
	private int service_idx; // 서비스 번호
	private String service_name; // 서비스 이름
	
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
	public int getService_idx() {
		return service_idx;
	}
	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	
	
}
