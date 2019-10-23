package com.yal.toti.kang.dao;

import java.util.List;
import java.util.Map;

import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.EstimateeListData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.QuestionsData;
import com.yal.toti.kang.domain.RequestAnswer;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.RequestUser;
import com.yal.toti.kang.domain.ServiceData;
import com.yal.toti.kang.domain.UserRequestData;
import com.yal.toti.kang.domain.UserRequestList;

public interface RequestDaoInterface {

	//분야 리스트
	public List<CategoriData> categorieList();
	
	//로그인한 유저(멘토)의 카테고리명
	public String categorieIdx(int m_idx);
	
	//분야번호에 맞는 분야명
	public CategoriData cate_data(int cate_idx);
	
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
	
	//로그인한 유저의 요청서 리스트
	public List<UserRequestList> userRequestList(int m_idx);
	
	//요청서 개수
	public int requestCnt(int request_idx);
		
	//로그인한 유저의 5일지난 요청서번호
	public List<Integer> userDelRequestNum(int m_idx);
	
	//5일지난 요청서 삭제 스케줄러
	public void userRequestDel();
	
	//------------------------- 요청서 정보 ---------------------------
	//유저정보
	public RequestUser requestUserInfo(int request_idx, int m_idx);
	
	//분야
	public String requestCate(int request_idx);
	
	//서비스
	public String requestService(int request_idx);
	
	//질문답변
	public List<RequestAnswer> requestAnswer(int request_idx);
	
	//시간
	public String requestDate(int request_idx);
	
	//-------------------------------------------------------------
	
	
	//견적서데이터 리스트
	public List<EstimateeListData> estimateeList(int request_idx);
	
	//요청서 취소(삭제)
	public int requestDelete(int request_idx);
	
}
