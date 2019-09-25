package com.yal.toti.kang.domain;

import java.util.List;

public class RequestData {
	
	private int request_idx; 	//요청서번호
	private int m_idx;			//회원번호
	private int cate_idx; 		//분야번호
	private int service_idx; 	//서비스번호
	private List<AnswerData> answerDatas; //질문번호, 답변내용
	
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public int getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}
	public int getService_idx() {
		return service_idx;
	}
	public void setService_idx(int service_idx) {
		this.service_idx = service_idx;
	}
	public List<AnswerData> getAnswerDatas() {
		return answerDatas;
	}
	public void setAnswerDatas(List<AnswerData> answerDatas) {
		this.answerDatas = answerDatas;
	}
	
	
	
}
