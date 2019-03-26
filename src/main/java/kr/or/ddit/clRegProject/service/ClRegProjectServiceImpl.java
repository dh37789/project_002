package kr.or.ddit.clRegProject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.clRegProject.dao.ClRegProjectDao;
import kr.or.ddit.vo.ProjectVO;

@Service
public class ClRegProjectServiceImpl implements ClRegProjectService{
	@Autowired
	private ClRegProjectDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> regProjectList(Map<String, String> params)
			throws Exception {
		return dao.regProjectList(params);
	}

}
