package kr.or.ddit.evalation.service;

import java.util.Map;

import kr.or.ddit.vo.EvalationVO;

public interface IEvalationService {

	/**
	 * 박시찬
	 * 클라이언트나 프리랜서의 평가를 입력하는 메서드  
	 */
	public int insertEvalation(EvalationVO evalationVO) throws Exception;


	/**
	 * 박시찬
	 * 각 항목의 평점 평균을 가져오는 메서드
	 */
	public double evalAvgPro(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 각 항목의 평점 평균을 가져오는 메서드
	 */
	public double evalAvgSati(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 각 항목의 평점 평균을 가져오는 메서드
	 */
	public double evalAvgComm(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 각 항목의 평점 평균을 가져오는 메서드
	 */
	public double evalAvgSche(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 각 항목의 평점 평균을 가져오는 메서드
	 */
	public double evalAvgActi(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 평가의 총 개수 구하는 메서드
	 */
	public int countEval(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 평가의 총합을 구하는 메서드
	 */
	public int evalTotalSum(Map<String, String> params) throws Exception;
}
