package com.yal.toti.kang.domain;

import java.util.List;

public class RequestListData {
	
	private int cate_idx; 		//분야번호
	private String cate_name; 	//분야명
	private List<ServiceData> service; //서비스번호, 서비스명
	private List<QuestionsData> quest; //질문번호, 질문
	
	
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public List<ServiceData> getService() {
		return service;
	}
	public void setService(List<ServiceData> service) {
		this.service = service;
	}
	public List<QuestionsData> getQuest() {
		return quest;
	}
	public void setQuest(List<QuestionsData> quest) {
		this.quest = quest;
	}
	@Override
	public String toString() {
		return "RequestListData [cate_idx=" + cate_idx + ", cate_name=" + cate_name + ", service=" + service
				+ ", quest=" + quest + "]";
	}
	
	
	
	
}