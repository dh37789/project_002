package kr.or.ddit.projectWork.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.WorkVO;

public interface ProjectWorkService {
	/**
	 * 오명학
	 * 일감 목록의 수를 가져온다
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int totalCount(Map<String, String> params) throws Exception;
	/**
	 * 오명학
	 * 일감 목록을 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<WorkVO> boardList(Map<String, String> params) throws Exception;
	/**
	 * 일감 등록
	 * @param workInfo
	 */
	void insertWork(WorkVO workInfo) throws Exception;
	/**
	 * 일감 정보를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	WorkVO boardInfo(Map<String, String> params) throws Exception;
	/**
	 * 일감 삭제
	 * @param params
	 * @throws Exception
	 */
	void deleteWork(Map<String, String> params) throws Exception;
	/**
	 * 일감 수정
	 * @param workInfo
	 */
	void updateWork(WorkVO workInfo) throws Exception;
	/**
	 * 일감 상위목록 
	 * @param params
	 * @return
	 */
	List<WorkVO> orderList(Map<String, String> params) throws Exception;
	/**
	 * 상위 일감 정보
	 * @param params
	 * @return
	 * @throws Exception
	 */
	WorkVO orderInfo(Map<String, String> params) throws Exception;
	/**
	 * 차트 리스트
	 * @param params
	 * @return
	 */
	List<WorkVO> chartList(Map<String, String> params) throws Exception;

}
