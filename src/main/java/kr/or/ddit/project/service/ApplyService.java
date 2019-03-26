package kr.or.ddit.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ProjectVO;

public interface ApplyService {
	public int countApply(Map<String, String> params) throws Exception;

	int apply(Map<String, String> params) throws Exception;

	public List<HashMap<String, Object>> conList(Map<String, String> params)
			throws Exception;

	public int checkApply(Map<String, String> params) throws Exception;
	/**
	 * 지원 정보를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public ApplyVO applyInfo(Map<String, String> params) throws Exception;

	public List<HashMap<String, Object>> selectList(Map<String, String> params)
			throws Exception;
	/**
	 * 지원자 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> appList(Map<String, String> params) throws Exception;

	/**
	 * 지원 정보를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public ApplyVO appInfo(Map<String, String> params) throws Exception;
	/**
	 * 지원자 미팅
	 * @param apMtInfo
	 * @throws Exception
	 */
	public void insertAppMeeting(ApmeetingVO apMtInfo) throws Exception;
	/**
	 * 지원자 상태 변환
	 * @param params
	 * @throws Exception
	 */
	public void updateStatus(Map<String, String> params) throws Exception;
	/**
	 * 지원 미팅을 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public ApmeetingVO mtInfo(Map<String, String> params) throws Exception;
	/**
	 * 지원자 상태변환 프리랜서
	 * @param params
	 * @throws Exception
	 */
	public void frUpdateStatus(Map<String, String> params) throws Exception;
	/**
	 * 미팅 확인
	 * @param params
	 * @throws Exception
	 */
	public void updateMtStatus(Map<String, String> params) throws Exception;

	public void sorryApply(Map<String, String> params) throws Exception;
	/**
	 * 지원 상태 초기화
	 * @param params
	 */
	public void frCancelStatus(Map<String, String> params) throws Exception;
	/**
	 * 지원 승낙하기
	 * @param params
	 * @throws Exception 
	 */
	public void okayApply(Map<String, String> params) throws Exception;
}
