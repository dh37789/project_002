package kr.or.ddit.projectWork.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.WorkVO;

public interface ProjectWorkDao {

	int totalCount(Map<String, String> params) throws Exception;

	List<WorkVO> boardList(Map<String, String> params) throws Exception;

	void insertWork(WorkVO workInfo) throws Exception;

	WorkVO boardInfo(Map<String, String> params) throws Exception;

	void deleteWork(Map<String, String> params) throws Exception;

	void updateWork(WorkVO workInfo) throws Exception;

	List<WorkVO> orderList(Map<String, String> params) throws Exception;

	WorkVO orderInfo(Map<String, String> params) throws Exception;

	List<WorkVO> chartList(Map<String, String> params) throws Exception;

}
