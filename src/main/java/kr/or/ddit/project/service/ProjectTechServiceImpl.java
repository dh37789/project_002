package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.ProjectDao;
import kr.or.ddit.project.dao.ProjectTechDao;
import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_techVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProjectTechServiceImpl implements ProjectTechService {
	@Autowired
	private ProjectTechDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LanguageVO> techList(String projectList)
			throws Exception {
		return dao.techList(projectList);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<LanguageVO> lanList() throws Exception {
		return dao.lanList();
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String,String>> project_techList(Map<String, String> params)
			throws Exception {
		return dao.project_techList(params);
	}
}
