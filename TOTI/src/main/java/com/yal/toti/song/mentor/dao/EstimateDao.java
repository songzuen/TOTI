package com.yal.toti.song.mentor.dao;

import java.util.List;

import com.yal.toti.song.mentor.domain.Coin;
import com.yal.toti.song.mentor.domain.EstimateInfo;

public interface EstimateDao {
	
	//견적서 등록
	public int insertEstimate(EstimateInfo est);

	public int updateCoin(int mento_idx);

	public List<Coin> coinCheck(int mento_idx);

}
