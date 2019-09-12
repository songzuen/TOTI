package com.yal.toti.song.mentor.dao;

import com.yal.toti.song.mentor.domain.EstimateInfo;

public interface EstimateDao {
	
	//견적서 등록
	public int insertEstimate(EstimateInfo est);

}
