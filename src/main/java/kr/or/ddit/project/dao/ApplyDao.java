package kr.or.ddit.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApmeetingVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.ProjectVO;

public interface ApplyDao {
	/**
	 * 프로젝트에 지원한 지원자 수를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int countApply(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 프리랜서가 지원하는 데이터를 insert 한다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int apply(Map<String, String> params) throws Exception;
	
	/**
	 * 계약중인 리스트를 가져온다.
	 * @param params
	 * @return
	 */
	List<HashMap<String, Object>> conList(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 지원 중복 확인을 위한 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int checkApply(Map<String, String> params)throws Exception;
	ApplyVO applyInfo(Map<String, String> params)throws Exception;
	/**
	 * 전선영
	 * 프리랜서가 지원한 목록을 가져오는 메서드
	 * @param params
	 * @return
	 */
	List<HashMap<String, Object>> selectList(Map<String, String> params) throws Exception;
	List<HashMap<String, Object>> appList(Map<String, String> params) throws Exception;
	ApplyVO appInfo(Map<String, String> params) throws Exception;
	void insertAppMeeting(ApmeetingVO apMtInfo) throws Exception;
	void updateStatus(Map<String, String> params) throws Exception;
	ApmeetingVO mtInfo(Map<String, String> params) throws Exception;
	void frUpdateStatus(Map<String, String> params) throws Exception;
	void updateMtStatus(Map<String, String> params) throws Exception;
	void sorryApply(Map<String, String> params) throws Exception;
	void frCancelStatus(Map<String, String> params) throws Exception;
	void deleteMt(Map<String, String> params) throws Exception;
	void okayApply(Map<String, String> params) throws Exception;
}
