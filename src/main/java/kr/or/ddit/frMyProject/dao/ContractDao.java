package kr.or.ddit.frMyProject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

public interface ContractDao {
	/**
	 * 프리랜서가 진행중인 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<HashMap<String, Object>> projectingList(Map<String, String> params) throws Exception;

	int myProjectCount(Map<String, String> params) throws Exception;

	List<HashMap<String, Object>> memList(Map<String, String> params) throws Exception;

	List<HashMap<String, Object>> meetList(Map<String, String> params) throws Exception;

	ConstractVO constractInfo(Map<String, String> params) throws Exception;

	void updateCons(ConstractVO consInfo) throws Exception;

	HashMap<String, String> consFile(Map<String, String> params) throws Exception;

	void clientOk(Map<String, String> params) throws Exception;

	int totalMoney(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프로젝트를 같이한 프리랜서의 리스트를 가져오는 메서드
	 */
	public List<Cons_MemJoinVO> evalFree(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프로젝트를 같이한 클라이언트 정보를 가져오는 메서드
	 */
	public Cons_ClientJoinVO evalClient(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서가 프로젝트 평가를 완료한 후 상태값을 변경하는 메서드 
	 */
	public int updateEndCheck(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프로젝트의 계약된 프리랜서 수를 가져오는 메서드
	 */
	public int countConsFree(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프로젝트 평가를 프리랜서가 몇명이 했는지 가져오는 메서드
	 */
	public int countConsEndChk(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 평가 유무의 결과값을 알려주는 메서드
	 */
	public int checkEndChk(Map<String, String> params) throws Exception;

	int conChk(Map<String, String> params) throws Exception;
}
