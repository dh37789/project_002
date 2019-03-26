package kr.or.ddit.fProjectNotice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.fProjectNotice.dao.ProjectNtcDao;
import kr.or.ddit.vo.Project_noticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("projectNtcService")
public class ProjectNtcServiceImpl implements ProjectNtcService{
	@Autowired
	private ProjectNtcDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Project_noticeVO> boardList(Map<String, String> params)
			throws Exception {
		return dao.boardList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertNtc(Project_noticeVO boardInfo) throws Exception {
		dao.insertNtc(boardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public Project_noticeVO boardInfo(Map<String, String> params)
			throws Exception {
		return dao.boardInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteNtc(Map<String, String> params) throws Exception {
		dao.deleteNtc(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateNtc(Project_noticeVO boardInfo) throws Exception {
		dao.updateNtc(boardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int boardCount(Map<String, String> params) throws Exception {
		return dao.boardCount(params);
	}

}
