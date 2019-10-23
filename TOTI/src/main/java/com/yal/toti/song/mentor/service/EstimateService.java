package com.yal.toti.song.mentor.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

		EstimateInfo est = write.toEstimateInfo();
		est.setRequest_idx(request_idx);

		try {
			if (write.getEst_file() != null) {
				newFileName = write.getRequest_idx() + "_" + write.getEst_file().getOriginalFilename();

				write.getEst_file().transferTo(new File(dir, newFileName));
				est.setEst_file(newFileName);
			}
			System.out.println(est.toString());
			rCnt = dao.insertEstimate(est);
			if (rCnt != 0) {
				cnt = est.getEst_idx();
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
