package kr.or.ddit.carrer.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CareerVO;

public interface ICareerDao {

	/**
	 * 박시찬
	 * 프리랜서 경력 리스트를 가져오는 메서드
	 * 
	 */
	public List<CareerVO> careerList(Map<String, String> mem_id) throws Exception; 
	
	/**
	 *	박시찬
	 *  프리랜서 경력을 수정하는 메서드
	 * 
	 */
	public int updateCareer(CareerVO careerVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 경력을 추가하는 메서드
	 *  
	 */
	public int insertCareer(CareerVO careerVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 경력을 삭제하는 메서드
	 * 
	 */
	public int deleteCareer(Map<String, String> param) throws Exception;
	
	
	/**
	 * 박시찬
	 * 프리랜서 경력 유무를 체크하는 메서드
	 */
	public List<CareerVO> careerCheck(Map<String, String> mem_id) throws Exception;

	/**
	 * 박시찬
	 * 프리랜서 경력 정보를 가져오는 메서드
	 */
	public CareerVO careerInfo(Map<String, String> param) throws Exception;
}
