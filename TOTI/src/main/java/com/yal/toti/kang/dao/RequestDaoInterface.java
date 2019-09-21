package com.yal.toti.kang.dao;

import java.util.List;

import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.QuestionsData;
import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.domain.ServiceData;

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
	public int insertRequest(int m_idx, int cate_idx);
	
	//답변 등록(요청서번호, 질문번호, 답변내용)
	public int insertAnswer(int request_idx, int quest_idx, String answer_cont);
	
	//멘티 서비스 등록
	public int insertService(int request_idx, int m_idx, int service_idx);
}
