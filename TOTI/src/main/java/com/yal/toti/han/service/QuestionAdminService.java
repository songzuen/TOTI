package com.yal.toti.han.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.AdminDaoInterface;
import com.yal.toti.han.domain.QuestionInfo;
import com.yal.toti.han.domain.QuestionItem;

@Service("adminQuestion")
public class QuestionAdminService {

	private AdminDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 분야별 질문 리스트
	public List<QuestionInfo> getQuestionbyCate(int cate_idx) {

		dao = template.getMapper(AdminDaoInterface.class);

		List<QuestionInfo> list = dao.selectQuestionByCate(cate_idx);

		return list;
	} 
	
	// 질문 등록
	public int QuestionInsert(QuestionInfo insertquestion) {

		dao = template.getMapper(AdminDaoInterface.class);

		int resultCnt = 0;

		resultCnt = dao.insertQuestion(insertquestion);

		return resultCnt;
	}
	
	// 질문 삭제
	public int Questiondelete(int quest_idx) {

		dao = template.getMapper(AdminDaoInterface.class);

		return dao.deleteQuestion(quest_idx);
	}
	
	// 질문 수정을 위한 정보획득
	public QuestionInfo getEditFormData(int quest_idx) {
		
		QuestionInfo questionInfo = dao.selectQuestionByIdx(quest_idx);
		
		return questionInfo;
	}
	
	// 질문 수정
	public int QuestionEdit(QuestionInfo questionInfo) {
		
		dao = template.getMapper(AdminDaoInterface.class);

		int resultCnt = 0;

		resultCnt = dao.questionUpdate(questionInfo);

		return resultCnt;
	}
	
	// 질문별 항목 리스트
		public List<QuestionItem> getItemByQuestion(int quest_idx) {

			dao = template.getMapper(AdminDaoInterface.class);

			List<QuestionItem> list = dao.itemList(quest_idx);

			return list;
		} 
		
		// 항목 등록
		public int ItemInsert(QuestionItem questionItem) {

			dao = template.getMapper(AdminDaoInterface.class);

			int resultCnt = 0;

			resultCnt = dao.insertItem(questionItem);

			return resultCnt;
		}
		
		// 항목 삭제
		public int Itemdelete(int item_idx) {

			dao = template.getMapper(AdminDaoInterface.class);

			return dao.deleteItem(item_idx);
		}
	
}
