package com.yal.toti.song.mentor.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.EstimateDao;
import com.yal.toti.song.mentor.domain.EstimateInfo;
import com.yal.toti.song.mentor.domain.WriteEstimate;

@Service("estimateService")
public class EstimateService {

	@Autowired
	private SqlSessionTemplate template;

	private EstimateDao dao;

	public int insertEstimate(WriteEstimate write, HttpServletRequest request) {
		dao = template.getMapper(EstimateDao.class);

		String path = "/uploadfile/song/estimate";

		String dir = request.getSession().getServletContext().getRealPath(path);

		int rCnt = 0;
		String newFileName = "";

		EstimateInfo est = write.toEstimateInfo();

		try {
			if (write.getEst_file() != null) {
				newFileName = write.getRequest_idx() + "_" + write.getEst_file().getOriginalFilename();

				write.getEst_file().transferTo(new File(dir, newFileName));
				est.setEst_file(newFileName);
			}
			System.out.println(est.toString());
			rCnt = dao.insertEstimate(est);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			if(write.getEst_file() != null) {
				new File(dir, newFileName).delete();
			}
		}
		return rCnt;
	}

}
