package com.yal.toti.kang.domain;

import java.util.List;

public class UserRequestData {

	private int request_idx;
	private String request_date;
	private String cate_name;
	private String service_name;
	private RequestUser userInfo;
	private List<RequestAnswer> answer;
	
	public int getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}
	public String getRequest_date() {
		return request_date;
	}
	public void setRequest_date(String request_date) {
		this.request_date = request_date;
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
	public RequestUser getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(RequestUser userInfo) {
		this.userInfo = userInfo;
	}
	public List<RequestAnswer> getAnswer() {
		return answer;
	}
	public void setAnswer(List<RequestAnswer> answer) {
		this.answer = answer;
	}
	

	
}
