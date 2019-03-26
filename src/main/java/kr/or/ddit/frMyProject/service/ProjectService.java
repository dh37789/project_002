package kr.or.ddit.frMyProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface ProjectService {
	/**
	 * 진행중인 프로젝트의 정보를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	ProjectVO myProjectInfo(Map<String, String> params) throws Exception;
	/**
	 * 깃허브 url 업데이트
	 * @param params
	 */
	void updateGit(Map<String, String> params) throws Exception;
	/**
	 * 클라이언트 진행중인 프로젝트
	 * @param params
	 * @return
	 */
	List<ProjectVO> clMyproject(Map<String, String> params) throws Exception;
	/**
	 * 모집기간이 끝나면 지원중인 프로젝트 계약중으로 변경
	 * @throws Exception
	 */
	void updateContract() throws Exception;

	/**
	 * 박시찬
	 * 프로젝트 완료시 클라이언트가 평가 완료를 하면 상태값을 업데이트하는 메서드
	 */
	public int updateEndCheck(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프로젝트 평가를 프리랜서,클라이언트 모두 완료할 시 완료 프로젝트로 변경되는 메서드
	 */
	public int updatePrStatus(Map<String, String> params) throws Exception; 
	
	/**
	 * 박시찬
	 * 현재 진행중인 프로젝트 수를 가져오는 메서드
	 */
	public int countProjecting(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트의 등록한 프로젝트의 개수를 가져오는 메서드
	 */
	public int clCountRegisPr(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트의 계약중인 프로젝트의 개수를 가져오는 메서드
	 */
	public int clCountContract(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트의 진행중인 프로젝트의 개수를 가져오는 메서드
	 */
	public int clCountProjecting(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트의 완료한 프로젝트의 개수를 가져오는 메서드
	 */
	public int clCountEndPr(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 클라이언트의 누적 완료 금액을 가져오는 메서드
	 */
	public int clTotalPay(Map<String, String> params) throws Exception;
	void adverEndProject(Map<String, String> params) throws Exception;
}
