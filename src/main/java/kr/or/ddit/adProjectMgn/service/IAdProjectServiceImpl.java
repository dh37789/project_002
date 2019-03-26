package kr.or.ddit.adProjectMgn.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.adProjectMgn.dao.IAdProjectDao;
import kr.or.ddit.vo.ProjectVO;

@Service("IAdProjectService")
public class IAdProjectServiceImpl implements IAdProjectService{
	@Autowired
	private IAdProjectDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> stProjectList(Map<String, String> params)
			throws Exception {
		return dao.stProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO stProjectView(Map<String, String> params) throws Exception {
		return dao.stProjectView(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void accProject(Map<String, String> params) throws Exception {
		dao.accProject(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void refuProject(Map<String, String> params) throws Exception {
		dao.refuProject(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countPro(Map<String, String> params) throws Exception {
		return dao.countPro(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertRefuse(Map<String, String> params) throws Exception {
		dao.insertRefuse(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> adEndPrList(Map<String, String> params)
			throws Exception {
		return dao.adEndPrList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO adEndPrView(Map<String, String> params) throws Exception {
		return dao.adEndPrView(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countEnd(Map<String, String> params) throws Exception {
		return dao.countEnd(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> conProjectList(Map<String, String> params) throws Exception {
		return dao.conProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int conProjectCount(Map<String, String> params) throws Exception {
		return dao.conProjectCount(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void projectDelete(Map<String, String> params) throws Exception {
		dao.projectDelete(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void contractProject(Map<String, String> params) throws Exception {
		dao.contractProject(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int projectingCount(Map<String, String> params) throws Exception {
		return dao.projectingCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> projectingList(
			Map<String, String> params) throws Exception {
		return dao.projectingList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> adverProjectList(
			Map<String, String> params) throws Exception {
		return dao.adverProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int adverPrCount(Map<String, String> params) throws Exception {
		return dao.adverPrCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void adverEndProject(Map<String, String> params) throws Exception {
		dao.adverEndproject(params);
	}
}
