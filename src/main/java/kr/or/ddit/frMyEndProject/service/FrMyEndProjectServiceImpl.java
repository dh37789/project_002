package kr.or.ddit.frMyEndProject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.frMyEndProject.dao.FrMyEndProjectDao;
import kr.or.ddit.vo.ProjectVO;

@Service
public class FrMyEndProjectServiceImpl implements FrMyEndProjectService{
	@Autowired
	private FrMyEndProjectDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public List<HashMap<String, Object>> endProjectList(Map<String, String> params)
			throws Exception {
		return dao.endProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public ProjectVO endProjectView(Map<String, String> params)
			throws Exception {
		return dao.endProjectView(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public int endCount(Map<String, String> params) throws Exception {
		return dao.endCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=true)
	@Override
	public int frEndPayment(Map<String, String> params) throws Exception {
		return dao.frEndPayment(params);
	}
	
} 
