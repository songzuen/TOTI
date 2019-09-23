package com.yal.toti.kang.dao;

import java.util.List;
import java.util.Map;

import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.QuestionsData;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.ServiceData;
import com.yal.toti.kang.domain.UserRequestData;

public interface RequestDaoInterface {

	//분야 리스트
	public List<CategoriData> categorieList();
	
	//분야번호에 맞는 분야명
	public String cate_naem(int cate_idx);
	
	//분야번호에 맞는 서비스번호, 서비스명 리스트
	public List<ServiceData> serviceData(int cate_idx);
	
	//분야번호에 맞는 질문번호, 질문
	public List<QuestionsData> questData(int cate_idx);
	
	//질문번호에 맞는 항목
	public List<ItemListData> itemListData(int quest_idx);
	
	//요청서 등록(회원번호, 분야번호)
	public int insertRequest(RequestData data);
	
	//멘티 서비스 등록
	public int insertService(RequestData data);
	
	//답변 등록(요청서번호, 질문번호, 답변내용)
	public void insertAnswer(Map<String, Object> an);
	
	//요청서 정보
	public UserRequestData getUserRequestData(int request_idx);
}
