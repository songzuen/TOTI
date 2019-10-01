package com.yal.toti.song.mentor.domain;

import org.springframework.web.multipart.MultipartFile;

public class WriteEstimate {
	private int request_idx;
	private int mento_idx;
	private int est_price;
	private String est_cont;
	private MultipartFile est_file;
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
	public MultipartFile getEst_file() {
		return est_file;
	}
	public void setEst_file(MultipartFile est_file) {
		this.est_file = est_file;
	}
	
	public EstimateInfo toEstimateInfo() {
		EstimateInfo est = new EstimateInfo();
		est.setRequest_idx(request_idx);
		est.setMento_idx(mento_idx);
		est.setEst_price(est_price);
		est.setEst_cont(est_cont);
		
		return est;
		
	}
	
}
