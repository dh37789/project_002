package kr.or.ddit.projectTest.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.TestVO;

public interface TestDao {
	
	void insertTest(TestVO testInfo) throws Exception;

	List<TestVO> boardList(Map<String, String> params) throws Exception;

	TestVO boardInfo(Map<String, String> params) throws Exception;

	void boardUpdate(TestVO boardInfo) throws Exception;

	void boardDelete(Map<String, String> params) throws Exception;

	int totalCount(Map<String, String> params) throws Exception;

}
