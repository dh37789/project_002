package kr.or.ddit.adProjectMgn.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface IAdProjectDao {
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
	/**
	 * 유서진
	 * 완료된 프로젝트 리스트 조회
	 * @param params
	 * @throws Exception
	 */
	public List<ProjectVO> adEndPrList(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 완료된 프로젝트 View
	 * @param params
	 * @throws Exception
	 */
	public ProjectVO adEndPrView(Map<String, String> params) throws Exception;
	
	/**
	 * 완료된 프로젝트 총 개수 
	 * @throws Exception
	 */
	public int countEnd(Map<String, String> params) throws Exception;

	/**
	 * 계약중인 프로젝트 목록
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> conProjectList(Map<String, String> params) throws Exception;
	/**
	 * 계약중인 프로젝트 수
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int conProjectCount(Map<String, String> params) throws Exception;
	/**
	 * 프로젝트 삭제
	 * @param params
	 */
	public void projectDelete(Map<String, String> params) throws Exception;
	/**
	 * 프로젝트 진행중으로 변경
	 * @param params
	 */
	public void contractProject(Map<String, String> params) throws Exception;
	/**
	 * 진행중인 프로젝트 수
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int projectingCount(Map<String, String> params) throws Exception;
	/**
	 * 진행중인 프로젝트 리스트
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> projectingList(
			Map<String, String> params) throws Exception;
	/**
	 * 모집중인 프로젝트
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> adverProjectList(
			Map<String, String> params) throws Exception;

	public int adverPrCount(Map<String, String> params) throws Exception;

	public void adverEndproject(Map<String, String> params) throws Exception;
	
}
