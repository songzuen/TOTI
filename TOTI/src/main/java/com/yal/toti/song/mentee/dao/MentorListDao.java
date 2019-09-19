package com.yal.toti.song.mentee.dao;

import java.util.List;
import java.util.Map;

import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.MentorServiceList;
import com.yal.toti.song.mentee.domain.SearchParam;

public interface MentorListDao {

	List<MentorMemberInfo> selectAllList();

	int selectTotalCount(SearchParam search);

	List<MentorMemberInfo> selectMentorList(Map<String, Object> params);

	List<MentorMemberInfo> getMentorPage(int mento_idx);

	List<MentorMemberInfo> selectListByRCnt();

	List<MentorMemberInfo> selectListByStr();

	List<MentorServiceList> getServiceList(int mento_idx);

}
