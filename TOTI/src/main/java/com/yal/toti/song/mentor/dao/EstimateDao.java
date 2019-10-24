package com.yal.toti.song.mentor.dao;

import java.util.List;
import java.util.Map;

import com.yal.toti.song.mentor.domain.ChatList;
import com.yal.toti.song.mentor.domain.Coin;
import com.yal.toti.song.mentor.domain.EstimateInfo;

public interface EstimateDao {
	
	//견적서 등록
	public int insertEstimate(EstimateInfo est);
//	public int insertEstimate(Map<String, Object> procedure);

	public int updateCoin(int mento_idx);

	public List<Coin> coinCheck(int mento_idx);

	public List<ChatList> getChatList(int mento_idx);

//	public int getEstidx(int request_idx, int mento_idx);

}
