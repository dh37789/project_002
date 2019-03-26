package kr.or.ddit.fProjectNotice.service;

import java.util.Map;

import kr.or.ddit.fProjectNotice.dao.ProjectNtcFileDao;
import kr.or.ddit.vo.Project_notice_fileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("projectNtcFileService")
public class ProjectNtcFileServiceImpl implements ProjectNtcFileService {
	@Autowired
	ProjectNtcFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Project_notice_fileVO boardFileInfo(Map<String, String> params)
			throws Exception {
		return dao.boardFileInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return dao.deleteFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Project_notice_fileVO fileInfo(Map<String, String> params)
			throws Exception {
		return dao.fileInfo(params);
	}
	

}
