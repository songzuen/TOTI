package com.yal.toti.song.mentor.dao;

import java.util.List;

import com.yal.toti.song.mentor.domain.RequestList;

public interface RequestListDao {

	List<RequestList> selectAllRequest();

	int deleteRequest(int request_idx);

	List<RequestList> getRequestInfo(int request_idx);

}
