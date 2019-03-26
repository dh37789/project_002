package kr.or.ddit.interest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.interest.dao.InterestDao;
import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.Intest_FreelancerVO;

@Service
public class InterestServiceImpl implements InterestService {
	@Autowired
	private InterestDao dao;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public String insertProject(Map<String, String> params) throws Exception {
		return dao.insertProject(params);

	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public String insertFreelancer(Map<String, String> params) throws Exception {
		return dao.insertFreelancer(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int deleteProject(Map<String, String> params) throws Exception {
		return dao.deleteProject(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int deleteFreelancer(Map<String, String> params) throws Exception {
		return dao.deleteFreelancer(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Interest_projectVO> selectProject(Map<String, String> params)
			throws Exception {
		return dao.selectProject(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Intest_FreelancerVO> selectFreelancer(Map<String, String> params)
			throws Exception {
		return dao.selectFreelancer(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int checkProject(Map<String, String> params) throws Exception {
		return dao.checkProject(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int checkFreelancer(Map<String, String> params) throws Exception {
		return dao.checkFreelancer(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String selectInpr_num(Map<String, String> params) throws Exception {
		return dao.selectInpr_num(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> freeList(Map<String, String> params)
			throws Exception {
		return dao.freeList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countFree(Map<String, String> params) throws Exception {
		return dao.countFree(params);
	}

}
