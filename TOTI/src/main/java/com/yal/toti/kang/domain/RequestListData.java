package com.yal.toti.kang.domain;

import java.util.List;

public class RequestListData {
	
	private CategoriData catedata;
	private List<ServiceData> service; //서비스번호, 서비스명
	private List<QuestionsData> quest; //질문번호, 질문
	

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
	public CategoriData getCatedata() {
		return catedata;
	}
	public void setCatedata(CategoriData catedata) {
		this.catedata = catedata;
	}
	
	
	
	
	
	
}