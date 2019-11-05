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

	public String searchTargetName(int target, int est_idx);
	
	public String searchTargetNameByUser(int user, int est_idx);

	public String searchUserName(int user);

	public int selectMentorCheck(int roomnum);

	public List<ChatRoomInfo> selectChatRoomListByUser(int user);

	public MentorProfile selectMentorProfile(int user);

	public List<MentorReview> selectMentorReview(int user);

	public int insertChatlog(String message, String message_date, int roomnum, int user);

	public int selectReqNum(int room_num);

	public int updateLastMsgAtChatRoom(int lastmsg, int roomnum);

}
