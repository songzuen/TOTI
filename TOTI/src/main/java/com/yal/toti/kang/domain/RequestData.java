package com.yal.toti.kang.domain;

public class RequestData {
	
	private int m_idx;			//회원번호
	private int cate_idx; 		//분야번호
	private int request_idx; 	//요청서번호
	private int qurest_idx;		//질문번호
	private String answer_cont;	//답변내용
	
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
	public int getQurest_idx() {
		return qurest_idx;
	}
	public void setQurest_idx(int qurest_idx) {
		this.qurest_idx = qurest_idx;
	}
	public String getAnswer_cont() {
		return answer_cont;
	}
	public void setAnswer_cont(String answer_cont) {
		this.answer_cont = answer_cont;
	}
	
	
}
