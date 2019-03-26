package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface ProjectDao {
	/**
	 * 프로젝트 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<ProjectVO> projectList(Map<String, String> params) throws Exception;
	
	/**
	 * 지원자 대기중인 모든 프로젝트의 갯수를 가져온다.
	 * @return
	 * @throws Exception
	 */
	public int totalCount() throws Exception;
	/**
	 * 조건에 해당하는 프로젝트 리스트 수를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int countProject(Map<String, String> params) throws Exception;
	
	/**
	 * 프로젝트 고유번호에 해당하는 프로젝트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public ProjectVO projectView(Map<String, String> params) throws Exception;

	public List<ProjectVO> readyList(Map<String, String> params) throws Exception;
	/**
	 * 해당 클라이언트의 등록한 프로젝트 갯수를 가져온다.
	 * @param mem_id
	 * @return
	 * @throws Exception
	 */
	public int cntClientProject(String mem_id)throws Exception;
	/**
	 * 해당 클라이언트가 진행한 계약 갯수를 가져온다.
	 * @param mem_id
	 * @return
	 */
	public int cntApplyProject(String mem_id) throws Exception;
	/**
	 * 프로젝트 정보가져오기
	 * @param params
	 * @return
	 */
	public ProjectVO projectInfo(Map<String, String> params) throws Exception;
	/**
	 * 프로젝트 등록하기
	 * @param project
	 */
	public void insertProject(ProjectVO project) throws Exception;

	public void payOk(Map<String, String> params) throws Exception;
	/**
	 * 검수대기중인 프로젝트 리스트 가져오기
	 * @param parmas
	 * @return
	 * @throws Exception
	 */
	public List<ProjectVO> inspectionProject(Map<String, String> parmas) throws Exception;
	/**
	 * 프로젝트를 임시저장하는 메서드 
	 * @param project
	 */
	public void saveProject(ProjectVO project)throws Exception;
	/**
	 * 임시저장한 프로젝트 리스트를 가져오는 메서드
	 * @param params
	 * @return
	 */
	public List<Map<String, Object>> temporaryList(Map<String, String> params)throws Exception;

	public void deleteProject(String pr_num)throws Exception;

	public void updateProject(ProjectVO project)throws Exception;
	/**
	 * 전선영
	 * 채팅 관련 메서드 
	 * 로그인한 프리랜서가 참여한 프로젝트 정보를 가져온다. 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> chatFreeProjectList(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 채팅 관련 메서드 
	 * 로그인한 클라이언트가 참여한 프로젝트 정보를 가져온다. 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> chatClientProjectList(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 채팅 관련 메서드
	 * 해당 프로젝트에 참여하는 클라이언트를 포함한 멤버 리스트
	 * @param params
	 * @return
	 * @throws Exception
	 */
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
