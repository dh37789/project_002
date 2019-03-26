package kr.or.ddit.frMyProject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

public interface ContractService {
	/**
	 * 프리랜서가 진행중인 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> projectingList(Map<String, String> params) throws Exception;
	/**
	 * 진행중인 프로젝트 수
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int myProjectCount(Map<String, String> params) throws Exception;
	/**
	 * 일감 인원 목록
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> memList(Map<String, String> params) throws Exception;
	/**
	 * 미팅 리스트(자기 제외하는 리스트)
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> meetList(Map<String, String> params) throws Exception;
	/**
	 * 계약중인 정보를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public ConstractVO constractInfo(Map<String, String> params) throws Exception;
	/**
	 * 계약 정보 수정
	 * @param consInfo
	 */
	public void updateCons(ConstractVO consInfo) throws Exception;
	public HashMap<String, String> consFile(Map<String, String> params) throws Exception;
	/**
	 * 클라이언트 사인
	 * @param params
	 */
	public void clientOk(Map<String, String> params) throws Exception;
	/**
	 * 전체 금액
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int totalMoney(Map<String, String> params) throws Exception;
	
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
	/**
	 * 오명학
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int conChk(Map<String, String> params) throws Exception;
}
