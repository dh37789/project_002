package kr.or.ddit.projectTest.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.TestVO;

public interface TestService {
	/**
	 * 테스트 게시판 insert
	 * @param testInfo
	 */
	void insertTest(TestVO testInfo) throws Exception;
	/**
	 * 테스트 게시판 리스트
	 * @param params
	 * @return
	 */
	List<TestVO> boardList(Map<String, String> params) throws Exception;
	/**
	 * 테스트 게시판 뷰 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	TestVO boardInfo(Map<String, String> params) throws Exception;
	/**
	 * 테스트 게시판 수정
	 * @param params
	 * @throws Exception
	 */
	void boardUpdate(TestVO boardInfo) throws Exception;
	/**
	 * 테스트 게시판 삭제
	 * @param params
	 * @throws Exception 
	 */
	void boardDelete(Map<String, String> params) throws Exception;
	/**
	 * 테스트 게시판 게시물 수
	 * @param params
	 * @return
	 * @throws Exception 
	 */
	int totalCount(Map<String, String> params) throws Exception;

}
