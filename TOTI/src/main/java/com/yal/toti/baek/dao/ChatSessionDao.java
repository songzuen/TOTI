package com.yal.toti.baek.dao;

import java.util.List;

import com.yal.toti.baek.domain.MemberInfo;

public interface ChatSessionDao {
	public MemberInfo selectMemberById(String uid);

	public List<MemberInfo> selectAllList(String user);
	
	public String searchChatRoom(String user, String target);
	
	public int insertChatRoom(String user, String target);

}
