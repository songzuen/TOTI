package com.yal.toti.song.mentor.domain;

import java.util.Date;

public class ChatList {

	private int est_idx;
	private String m_photo;
	private String m_name;
	private String cate_name;
	private String service_name;
	private String est_price;
	private Date est_date;
	private String answer_cont;
	private int mento_idx;
	private String last_msg;
	
	
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	public int getEst_idx() {
		return est_idx;
	}
	public void setEst_idx(int est_idx) {
		this.est_idx = est_idx;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
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
	public String getEst_price() {
		return est_price;
	}
	public void setEst_price(String est_price) {
		this.est_price = est_price;
	}
	public Date getEst_date() {
		return est_date;
	}
	public void setEst_date(Date est_date) {
		this.est_date = est_date;
	}
	public String getAnswer_cont() {
		return answer_cont;
	}
	public void setAnswer_cont(String answer_cont) {
		this.answer_cont = answer_cont;
	}
	
	public String getLast_msg() {
		return last_msg;
	}
	public void setLast_msg(String last_msg) {
		this.last_msg = last_msg;
	}
	public ChatList(int est_idx, String m_photo, String m_name, String cate_name, String service_name, String est_price,
			Date est_date, String answer_cont,int mento_idx,String last_msg) {
		super();
		this.mento_idx = mento_idx;
		this.est_idx = est_idx;
		this.m_photo = m_photo;
		this.m_name = m_name;
		this.cate_name = cate_name;
		this.service_name = service_name;
		this.est_price = est_price;
		this.est_date = est_date;
		this.answer_cont = answer_cont;
		this.last_msg = last_msg;
	}
	public ChatList() {
		Date est_date = new Date();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
