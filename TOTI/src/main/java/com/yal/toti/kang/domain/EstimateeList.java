package com.yal.toti.kang.domain;

import java.util.List;

public class EstimateeList {

	private String cate_name;
	private String service_name;
	private String request_date;
	private List<EstimateeListData> estiData;
	
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
	public List<EstimateeListData> getEstiData() {
		return estiData;
	}
	public void setEstiData(List<EstimateeListData> estiData) {
		this.estiData = estiData;
	}
	
	
	
}
