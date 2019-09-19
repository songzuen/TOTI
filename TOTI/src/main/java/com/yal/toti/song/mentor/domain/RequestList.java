package com.yal.toti.song.mentor.domain;

import java.util.Date;

public class RequestList {

//	toti_request
	private int request_idx; // 요청서 번호
	private int m_idx; // 회원번호
	private Date request_date; // 요청서 작성 날짜

//	toti_question
	private String quest_name; // 질문

	// toti_cate
	private int cate_idx; // 분야 번호
	private String cate_name; // 분야 이름

//	toti_answer
	private int answer_idx; // 답변 번호
	private String answer_cont; // 답변내

	private String m_name; // 회원 이름
	private String m_photo; // 회원 사진

	private int mento_idx; // 요청서 받는 고수 번호
	
	private String service_name;

	public int getRequest_idx() {
		return request_idx;
	}

	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public Date getRequest_date() {
		return request_date;
	}

	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}

	public String getQuest_name() {
		return quest_name;
	}

	public void setQuest_name(String quest_name) {
		this.quest_name = quest_name;
	}

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

	public int getAnswer_idx() {
		return answer_idx;
	}

	public void setAnswer_idx(int answer_idx) {
		this.answer_idx = answer_idx;
	}

	public String getAnswer_cont() {
		return answer_cont;
	}

	public void setAnswer_cont(String answer_cont) {
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

	public int getMento_idx() {
		return mento_idx;
	}

	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}

	public String getService_name() {
		return service_name;
	}

	public void setService_name(String service_name) {
		this.service_name = service_name;
	}

	public RequestList(int request_idx, int m_idx, Date request_date, String quest_name, int cate_idx, String cate_name,
			int answer_idx, String answer_cont, String m_name, String m_photo, String service_name) {
		super();
		this.request_idx = request_idx;
		this.m_idx = m_idx;
		this.request_date = request_date;
		this.quest_name = quest_name;
		this.cate_idx = cate_idx;
		this.cate_name = cate_name;
		this.answer_idx = answer_idx;
		this.answer_cont = answer_cont;
		this.m_name = m_name;
		this.m_photo = m_photo;
		this.service_name = service_name;
	}

	public RequestList() {
		Date request_date = new Date();
		// TODO Auto-generated constructor stub
	}

}
