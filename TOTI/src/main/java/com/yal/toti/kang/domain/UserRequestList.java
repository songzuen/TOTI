package com.yal.toti.kang.domain;

public class UserRequestList {

	private int request_idx;
	private String cate_name;
	private String service_name;
	private String request_date;
	private int request_cnt;
	
	public int getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}
	public int getRequest_cnt() {
		return request_cnt;
	}
	public void setRequest_cnt(int request_cnt) {
		this.request_cnt = request_cnt;
	}
	
}
