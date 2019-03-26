package kr.or.ddit.adProjectMgn.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface IAdProjectService {
	/**
	 * 유서진
	 * 승인 대기중인 프로젝트 리스트 출력
	 * @param params
	 * @throws Exception
	 */
	public List<ProjectVO> stProjectList(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 승인 대기중인 프로젝트 상세보기
	 * @param params
	 * @throws Exception
	 */
	public ProjectVO stProjectView(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 승인 버튼 누르면 대기 상태에서 지원상태로 변경
	 * @param params
	 * @throws Exception
	 */
	public void accProject(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 승인 버튼 누르면 대기 상태에서 거절상태로 변경
	 * @param params
	 * @throws Exception
	 */
	public void refuProject(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 프로젝트 거절 사유를 등록하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public void insertRefuse(Map<String, String> params) throws Exception;
	
	public int countPro(Map<String, String> params) throws Exception;
	
	public List<ProjectVO> adEndPrList(Map<String, String> params) throws Exception;
	
	public ProjectVO adEndPrView(Map<String, String> params) throws Exception;
	
	public int countEnd(Map<String, String> params) throws Exception;

	public List<HashMap<String, Object>> conProjectList(Map<String, String> params) throws Exception;

	public int conProjectCount(Map<String, String> params) throws Exception;

	public void projectDelete(Map<String, String> params) throws Exception;

	public void contractProject(Map<String, String> params) throws Exception;

	public int projectingCount(Map<String, String> params) throws Exception;

	public List<HashMap<String, Object>> projectingList(Map<String, String> params) throws Exception;

	public List<HashMap<String, Object>> adverProjectList(
			Map<String, String> params) throws Exception;

	public int adverPrCount(Map<String, String> params) throws Exception;

	public void adverEndProject(Map<String, String> params) throws Exception;

}
