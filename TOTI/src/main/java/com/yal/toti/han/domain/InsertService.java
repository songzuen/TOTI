package com.yal.toti.han.domain;

public class InsertService {
	
	private int cate_idx;
	private String service_name;
	
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	
	public ServiceInfo toServiceInfo() {
		
		//ServiceInfo info = new ServiceInfo(cate_idx, cate_idx, service_name);
		//info.setCate_idx(cate_idx);
		//info.setService_name(service_name);
		
		return null;
	}

}
