package kr.or.ddit.projectWork.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.projectWork.dao.ProjectWorkDao;
import kr.or.ddit.vo.WorkVO;

@Service("projectWorkService")
public class ProjectWorkServiceImpl implements ProjectWorkService{
	
	@Autowired
	private ProjectWorkDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<WorkVO> boardList(Map<String, String> params) throws Exception {
		return dao.boardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertWork(WorkVO workInfo) throws Exception {
		dao.insertWork(workInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public WorkVO boardInfo(Map<String, String> params) throws Exception {
		return dao.boardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteWork(Map<String, String> params) throws Exception {
		dao.deleteWork(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateWork(WorkVO workInfo) throws Exception {
		dao.updateWork(workInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<WorkVO> orderList(Map<String, String> params) throws Exception {
		return dao.orderList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public WorkVO orderInfo(Map<String, String> params) throws Exception {
		return dao.orderInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<WorkVO> chartList(Map<String, String> params) throws Exception {
		return dao.chartList(params);
	}

}
