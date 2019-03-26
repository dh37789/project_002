package kr.or.ddit.clEndProject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.clEndProject.dao.ClEndProjectDao;
import kr.or.ddit.vo.ProjectVO;

@Service
public class ClEndProjectServiceImpl implements ClEndProjectService{
	@Autowired
	private ClEndProjectDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<ProjectVO> clEndPrList(Map<String, String> params)
			throws Exception {
		return dao.clEndPrList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO clEndPrView(Map<String, String> params) throws Exception {
		return dao.clEndPrView(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int clEndCount(Map<String, String> params) throws Exception {
		return dao.clEndCount(params);
	}

}
