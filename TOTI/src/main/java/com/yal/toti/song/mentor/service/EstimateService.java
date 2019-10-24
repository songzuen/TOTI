package com.yal.toti.song.mentor.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.EstimateDao;
import com.yal.toti.song.mentor.domain.Coin;
import com.yal.toti.song.mentor.domain.EstimateInfo;
import com.yal.toti.song.mentor.domain.WriteEstimate;

@Service("estimateService")
public class EstimateService {

	@Autowired
	private SqlSessionTemplate template;

	private EstimateDao dao;

	public int insertEstimate(WriteEstimate write, HttpServletRequest request, int request_idx) {
		dao = template.getMapper(EstimateDao.class);

		String path = "/uploadfile/song/estimate";

		String dir = request.getSession().getServletContext().getRealPath(path);

		int rCnt = 0;
		int cnt = 0;
		String newFileName = "";

		EstimateInfo est = null;
		est = write.toEstimateInfo();
		
		est.setRequest_idx(request_idx);
//		Map<String, Object> procedure = new HashMap<String, Object>(request_idx);
//		procedure.put("mento_idx", est.getMento_idx());
//		procedure.put("request_idx", est.getRequest_idx());
//		procedure.put("est_price", est.getEst_price());
//		procedure.put("est_cont", est.getEst_cont());
		

		try {
			if (write.getEst_file() != null) {
				newFileName = write.getRequest_idx() + "_" + write.getEst_file().getOriginalFilename();

				write.getEst_file().transferTo(new File(dir, newFileName));
				
				est.setEst_file(newFileName);
//				procedure.put("est_file", est.getEst_file());
			}
			
			
			
			rCnt = dao.insertEstimate(est);
//			System.out.println(cnt);
//			rCnt = dao.insertEstimate(procedure);
			if (rCnt != 0) {
				cnt = est.getEst_idx();
//				cnt = dao.getEstidx(request_idx, mento_idx);
//				System.out.println(cnt);
			}	
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			if (write.getEst_file() != null) {
				new File(dir, newFileName).delete();
			}
		}
		return cnt;
	}

	public int updateCoin(int mento_idx) {
		dao = template.getMapper(EstimateDao.class);

		int rCnt = 0;
		rCnt = dao.updateCoin(mento_idx);

		return rCnt;
	}

	public List<Coin> coinCheck(int mento_idx) {
		dao = template.getMapper(EstimateDao.class);
		List<Coin> list = dao.coinCheck(mento_idx);

		return list;
	}

}
