package com.yal.toti.yu.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.ListViewData;
import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.SearchParam;

@Service("listService")
public class MemberListService {
	//@Autowired
	//private MemberDao dao;
		
	//@Autowired
	//private MemberJdbcTemplateDao dao;
		
	// 자동 매퍼를 이용해서 생성할 dao 
	private MemberDaoInterface dao;
		
	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	// @Inject : 타입에 맞는 주입 ( java 에서 지원 : 특정 프레임워크에 의존하지 않음 )
	@Autowired
	private SqlSessionTemplate template;
		
	final int MEMBER_CNT_LIST = 3; // 상수는 바뀌지 않으니까 굳이 프라이빗 할 필요는 없음

	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		
		ListViewData listData = new ListViewData();

		// 전체 게시물의 개수
		int totalCnt = dao.selectTotalCount(searchParam);

		int totalPageCnt = 0;
		// 전체 페이지 개수

		if (totalCnt > 0) {
			totalPageCnt = totalCnt / MEMBER_CNT_LIST;
			if (totalCnt % MEMBER_CNT_LIST > 0) {
				totalPageCnt++;
			}
		}
		listData.setPageTotalCount(totalPageCnt);

		// 구간 검색을 위한 index
		// 1->0 , 2->3, 3->6, 4->9 나오게
		int index = (currentPageNumber - 1) * MEMBER_CNT_LIST;

		// 회원 정보 리스트
		List<MemberInfo> memberList = null;


		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", searchParam);
		params.put("index", index);
		params.put("count", MEMBER_CNT_LIST);
		
		memberList = dao.selectList(params);
		System.out.println("사이즈 : : : : " + totalCnt);
		System.out.println("리스트 사이즈 : : : : " + memberList.size());
		
		listData.setMemberList(memberList);
		
		for(MemberInfo m : memberList) {
			System.out.println(m);
		}
		

		// listData.setMemberList(dao.selectList(conn, index, MEMBER_CNT_LIST));

		// 1->9-0 = 9, 2->9-3=6
		int no = totalCnt - index; // 이러면 첫페이지 9 두번째 6 나오겠음
		listData.setNo(no);

		listData.setTotalCount(totalCnt);

		return listData;
	}
	
	public List<MemberInfo> getAllList() {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		List<MemberInfo> list = dao.selectAllList();
		
		return list;
	}
	
}
