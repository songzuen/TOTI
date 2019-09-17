package com.yal.toti.han.dao;

import java.util.List;

import com.yal.toti.han.domain.ServiceInfo;

public interface HyewonDaoInterface {

	// 서비스 등록
	public int insertService(ServiceInfo serviceInfo);
	// 종목별 서비스 리스트
	public List<ServiceInfo> selectServiceByCate(int cate_idx);
	// 전체 리스트
	public List<ServiceInfo> selectAllList();
	// 서비스 삭제
	public int deleteService(int id);
}
