package com.yal.toti.kang.domain;

import java.util.List;

public class UserRequestData {

	private int request_idx;
	private List<String> quest_name;
	private List<String> answer_cont;
	private String m_name;
	private String m_photo;
	private String cate_name;
	private String service_name;
	private String request_date;
	
	
	public int getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}
	
	public List<String> getQuest_name() {
		return quest_name;
	}
	public void setQuest_name(List<String> quest_name) {
		this.quest_name = quest_name;
	}
	public List<String> getAnswer_cont() {
		return answer_cont;
	}
	public void setAnswer_cont(List<String> answer_cont) {
		this.answer_cont = answer_cont;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
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
	
	
	
}
