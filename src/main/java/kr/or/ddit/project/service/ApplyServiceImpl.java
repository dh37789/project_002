package kr.or.ddit.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.ApplyDao;
import kr.or.ddit.project.dao.ProjectDao;
import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	private ApplyDao dao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public int countApply(Map<String, String> params) throws Exception {
		return dao.countApply(params);
	}

	// public int checkApply(Map<String, String> params) throws Exception{
	//
	// }

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int apply(Map<String, String> params) throws Exception {
		return dao.apply(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> conList(Map<String, String> params) throws Exception {
		return dao.conList(params);
	}


	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public int checkApply(Map<String, String> params) throws Exception {
		return dao.checkApply(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ApplyVO applyInfo(Map<String, String> params) throws Exception {
		return dao.applyInfo(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<HashMap<String, Object>> selectList(Map<String, String> params)
			throws Exception {
		return dao.selectList(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<HashMap<String, Object>> appList(Map<String, String> params)
			throws Exception {
		return dao.appList(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public ApplyVO appInfo(Map<String, String> params) throws Exception {
		return dao.appInfo(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertAppMeeting(ApmeetingVO apMtInfo) throws Exception {
		dao.insertAppMeeting(apMtInfo);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateStatus(Map<String, String> params) throws Exception {
		dao.updateStatus(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly=true)
	@Override
	public ApmeetingVO mtInfo(Map<String, String> params) throws Exception {
		return dao.mtInfo(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public void frUpdateStatus(Map<String, String> params) throws Exception {
		dao.frUpdateStatus(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public void updateMtStatus(Map<String, String> params) throws Exception {
		dao.updateMtStatus(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public void sorryApply(Map<String, String> params) throws Exception {
		dao.sorryApply(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public void frCancelStatus(Map<String, String> params) throws Exception {
		dao.frCancelStatus(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public void okayApply(Map<String, String> params) throws Exception {
		dao.okayApply(params);
	}


}
