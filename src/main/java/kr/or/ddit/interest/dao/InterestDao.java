package kr.or.ddit.interest.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.Intest_FreelancerVO;


public interface InterestDao {

	/**
	 * 전선영
	 * 프리랜서가 프로젝트를 관심프로젝트로 등록하는 메서드 
	 * @param params
	 * @throws Exception
	 */
	public String insertProject(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 클라이언트가 프리랜서를 관심 프리랜서로 등록하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public String insertFreelancer(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 프리랜서가 관심 프로젝트를 취소하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public int deleteProject(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 클라이언트가 관심 프리랜서를 취소하는 메서드
	 * @param params
	 * @throws Exception
	 */
	public int deleteFreelancer(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 프리랜서에 해당하는 관심 프로젝트 리스트를 가져오는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Interest_projectVO> selectProject(Map<String, String> params)throws Exception;
	
	/**
	 * 전선영
	 * 클라이언트에 해당하는 관심 프리랜서 리스트를 가져오는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<Intest_FreelancerVO> selectFreelancer(Map<String, String> params)throws Exception;

	/**
	 * 전선영
	 * 이미 관심 등록한 프로젝트인지 확인하기 위한 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int checkProject(Map<String, String> params) throws Exception;
	
	/**
	 * 전선영
	 * 이미 관심 등록한 프리랜서인지 확인하기 위한 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public int checkFreelancer(Map<String, String> params) throws Exception;

	/**
	 * 전선영
	 * 관심 프로젝트 고유번호 가져오는 메서드
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String selectInpr_num(Map<String, String> params)throws Exception;
	
	public List<Map<String, Object>> freeList(Map<String,String> params) throws Exception;
	
	public int countFree(Map<String,String> params)throws Exception;
	
}
