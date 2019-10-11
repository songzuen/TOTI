package com.yal.toti.baek.dao;

import java.util.List;

import com.yal.toti.baek.domain.ChatRoomInfo;
import com.yal.toti.baek.domain.EstInfo;
import com.yal.toti.baek.domain.MemberInfo;
import com.yal.toti.baek.domain.MentorProfile;
import com.yal.toti.baek.domain.MentorReview;

public interface ChatSessionDao {
	public MemberInfo selectMemberById(String uid);

	public List<EstInfo> selectAllList(int user);

	public String searchChatRoom(int roomnum);

	public int insertChatRoom(int user, int target, int category, int roomnum);

	public String searchTargetName(int target);

	public String searchTargetNameByUser(int user);

	public String searchUserName(int user);

	public String selectMentorCheck(int user);

	public List<ChatRoomInfo> selectChatRoomListByUser(int user);

	public MentorProfile selectMentorProfile(int user);

	public List<MentorReview> selectMentorReview(int user);

	public int insertEstPriceToChatRoom(int roomnum, int user, String date);

	public int insertEstContToChatRoom(int roomnum, int user, String date);

	public int updateLastMsgAtChatRoom(int roomnum);

}
