package kr.or.ddit.frMyProjectPresent.service;

import java.util.Map;

import kr.or.ddit.frMyProjectPresent.dao.ProjectOutputDao;
import kr.or.ddit.vo.Project_outputVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("projectOutputService")
public class ProjectOutputServiceImpl implements ProjectOutputService{
	
	@Autowired
	private ProjectOutputDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void requestFile(Project_outputVO file) throws Exception {
		dao.requestFile(file);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Project_outputVO fileInfo(Map<String, String> params)
			throws Exception {
		return dao.fileInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteFile(Map<String, String> params) throws Exception {
		dao.deleteFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Project_outputVO downloadFile(Map<String, String> params)
			throws Exception {
		return dao.downloadFile(params);
	}
}
