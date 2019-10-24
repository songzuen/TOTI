package com.yal.toti.song.mentor.domain;

import java.util.Date;

public class EstimateInfo {
	private int est_idx;	//견적서 번호
	private int request_idx; //요청서 번호
	private int mento_idx;	//고수 회원번호
	private int est_price;	//견적 금액
	private String est_cont; 	//견적 내용
	private String est_file;	//견적 파일
	private Date est_date;
	
	public int getEst_idx() {
		return est_idx;
	}
	public void setEst_idx(int est_idx) {
		this.est_idx = est_idx;
	}
	public int getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(int request_idx) {
		this.request_idx = request_idx;
	}
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	public int getEst_price() {
		return est_price;
	}
	public void setEst_price(int est_price) {
		this.est_price = est_price;
	}
	public String getEst_cont() {
		return est_cont;
	}
	public void setEst_cont(String est_cont) {
		this.est_cont = est_cont;
	}
	public String getEst_file() {
		return est_file;
	}
	public void setEst_file(String est_file) {
		this.est_file = est_file;
	}
	public Date getEst_date() {
		return est_date;
	}
	public void setEst_date(Date est_date) {
		this.est_date = est_date;
	}
	@Override
	public String toString() {
		return "Estimate [est_idx=" + est_idx + ", request_idx=" + request_idx + ", mento_idx=" + mento_idx
				+ ", est_price=" + est_price + ", est_cont=" + est_cont + ", est_file=" + est_file + ", est_date="
				+ est_date + "]";
	}
	public EstimateInfo(int est_idx, int request_idx, int mento_idx, int est_price, String est_cont, String est_file,
			Date est_date) {
		super();
		this.est_idx = est_idx;
		this.request_idx = request_idx;
		this.mento_idx = mento_idx;
		this.est_price = est_price;
		this.est_cont = est_cont;
		this.est_file = est_file;
		this.est_date = est_date;
	}
	public EstimateInfo(int mento_idx, int est_price, String est_cont, String est_file) {
		super();
		this.mento_idx = mento_idx;
		this.est_price = est_price;
		this.est_cont = est_cont;
		this.est_file = est_file;
		this.est_date = new Date();
	}
	public EstimateInfo() {
		super();
		this.est_date = new Date();
	}
	
	
}
