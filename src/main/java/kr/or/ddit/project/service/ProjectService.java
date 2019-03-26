package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface ProjectService {
	public List<ProjectVO> projectList(Map<String, String> params) throws Exception;
	public int totalCount() throws Exception;
	public int countProject(Map<String, String> params) throws Exception;
	public ProjectVO projectView(Map<String, String> params) throws Exception;
	/**
	 * 준비중인(계약) 프로젝트 리스트 클라이언트
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<ProjectVO> readyList(Map<String, String> params) throws Exception;
	public int cntClientProject(String mem_id)throws Exception;
	public int cntApplyProejct(String mem_id) throws Exception;
	public ProjectVO projectInfo(Map<String, String> params) throws Exception;
	public void insertProject(ProjectVO project) throws Exception;
	public void payOk(Map<String, String> params) throws Exception;
	public List<ProjectVO> inspectionProject(Map<String, String> parmas) throws Exception;
	
	public void saveProject(ProjectVO project)throws Exception;
	
	public List<Map<String, Object>> temporaryList(Map<String, String> params)throws Exception;
	public void deleteProject(String pr_num)throws Exception;
	public void updateProject(ProjectVO project)throws Exception;
	
	public List<Map<String, Object>> chatFreeProjectList(Map<String, String> params) throws Exception;
	
	public List<Map<String, Object>> chatClientProjectList(Map<String, String> params) throws Exception;
	
	public List<Map<String, Object>> chatMemberList(Map<String, String> params) throws Exception;
	
	public List<ProjectVO> mainProList() throws Exception;
	
	public List<ProjectVO> stbyProList() throws Exception;
	
	public List<ProjectVO> projectingList() throws Exception;
	public int endCount(Map<String, String> params) throws Exception;
	public int proing(Map<String, String> params) throws Exception;
	public int proMoney(Map<String, String> params) throws Exception;
	public int frEndCount(Map<String, String> params) throws Exception;
	public int frProing(Map<String, String> params) throws Exception;
	public int frProMoney(Map<String, String> params) throws Exception;
}
