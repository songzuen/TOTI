package com.yal.toti.kang.dao;

import java.util.List;

import com.yal.toti.kang.domain.KategoriData;
import com.yal.toti.kang.domain.RequestData;

public interface RequestDaoInterface {

	//분야 리스트
	public List<KategoriData> kategorieList();
	
	//요청서
	public RequestData requestData();
	
}
