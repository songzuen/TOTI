package com.yal.toti.han.dao;

import java.util.List;

import com.yal.toti.han.domain.CategoryInfo;
import com.yal.toti.han.domain.QuestionInfo;
import com.yal.toti.han.domain.QuestionItem;
import com.yal.toti.han.domain.ServiceInfo;

public interface AdminDaoInterface {
	
	// 분야 리스트
	public List<CategoryInfo> categoryList();
	// 종목별 서비스 리스트
	public List<ServiceInfo> selectServiceByCate(int cate_idx);
	// 서비스 삭제
	public int deleteService(int service_idx);
	// 서비스 등록
	public int insertService(ServiceInfo insertservice);
	
	// 종목별 질문 리스트
	public List<QuestionInfo> selectQuestionByCate(int cate_idx);
	// 질문 등록
	public int insertQuestion(QuestionInfo insertquestion);
	// 질문 삭제
	public int deleteQuestion(int quest_idx);
	// 질문 수정을 위한 정보획득
	public QuestionInfo selectQuestionByIdx(int quest_idx);
	// 질문 수정
	public int questionUpdate(QuestionInfo questionInfo);
	
	// 질문별 항목 리스트
	public List<QuestionItem> itemList(int quest_idx);
	// 항목 등록
	public int insertItem(QuestionItem questionItem); 
	// 항복 삭제
	public int deleteItem(int item_idx); 
}	
