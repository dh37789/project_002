package kr.or.ddit.constract.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

public interface ContractiDao {
	/**
	 * 전선영
	 * 조건에 해당하는 계약 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> contractList(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 프리랜서가 계약 수정 요청을 하여 계약 상태를 수정하는 메서드 
	 * @param cons_num
	 * @throws Exception
	 */
	public void freeNo(Map<String, String> params) throws Exception;
	/**
	 * 전선영 
	 * 프리랜서가 계약을 확인하여 계약 상태를 수정하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public void freeOk(Map<String, String> params) throws Exception;
	/**
	 * 전선영
	 * 프리랜서가 확인한 계약을 최종으로 클라이언트가 확인하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public void clientOk(Map<String, String> params) throws Exception;
	
	public HashMap<String, String> consFile(Map<String, String> params) throws Exception;
	public void insertContract(ConstractVO consInfo) throws Exception;
	public String selectPr_num(String cons_num) throws Exception;
	public List<String> selectFree(String pr_num) throws Exception;
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
}
