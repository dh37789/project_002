package kr.or.ddit.project.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.project.dao.ProjectFileDao;
import kr.or.ddit.vo.Project_fileVO;

@Service("ProjectFileService")
public class ProjectFileServiceImpl implements ProjectFileService{
	@Autowired
	ProjectFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Project_fileVO fileInfo(Map<String, String> params) throws Exception {
		return dao.fileInfo(params);
	}
}
