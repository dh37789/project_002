package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.dao.ProjectDao;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao dao;
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> projectList(Map<String, String> params) throws Exception {
		return dao.projectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount() throws Exception {
		return dao.totalCount();
	}

	@Override
	public int countProject(Map<String, String> params) throws Exception {
		return dao.countProject(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO projectView(Map<String, String> params) throws Exception {
		return dao.projectView(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> readyList(Map<String, String> params)
			throws Exception {
		return dao.readyList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int cntClientProject(String mem_id) throws Exception {
		return dao.cntClientProject(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int cntApplyProejct(String mem_id) throws Exception {
		return dao.cntApplyProject(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ProjectVO projectInfo(Map<String, String> params) throws Exception {
		return dao.projectInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertProject(ProjectVO project) throws Exception {
		dao.insertProject(project);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void payOk(Map<String, String> params) throws Exception {
		dao.payOk(params);
	}

	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> inspectionProject(Map<String, String> parmas)
			throws Exception {
		return dao.inspectionProject(parmas);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void saveProject(ProjectVO project) throws Exception {
		dao.saveProject(project);
		
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> temporaryList(Map<String, String> params)throws Exception {
		return dao.temporaryList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteProject(String pr_num) throws Exception {
		dao.deleteProject(pr_num);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateProject(ProjectVO project) throws Exception {
		dao.updateProject(project);
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> chatMemberList(Map<String, String> params)
			throws Exception {
		return dao.chatMemberList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> chatFreeProjectList(
			Map<String, String> params) throws Exception {
		return dao.chatFreeProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> chatClientProjectList(
			Map<String, String> params) throws Exception {
		return dao.chatClientProjectList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> mainProList() throws Exception {
		return dao.mainProList();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> stbyProList() throws Exception {
		return dao.stbyProList();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<ProjectVO> projectingList() throws Exception {
		return dao.projectingList();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int endCount(Map<String, String> params) throws Exception {
		return dao.endCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int proing(Map<String, String> params) throws Exception {
		return dao.proing(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int proMoney(Map<String, String> params) throws Exception {
		return dao.proMoney(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int frEndCount(Map<String, String> params) throws Exception {
		return dao.frEndCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int frProing(Map<String, String> params) throws Exception {
		return dao.frProing(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int frProMoney(Map<String, String> params) throws Exception {
		return dao.frProMoney(params);
	}

}
