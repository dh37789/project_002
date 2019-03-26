package kr.or.ddit.academic.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AcademicVO;

public interface IAcademicDao {
	
	/**
	 * 박시찬
	 * 프리랜서 학력 리스트를 가져오는 메서드
	 * 
	 */
	public List<AcademicVO> academicList(Map<String, String> mem_id) throws Exception; 
	
	/**
	 *	박시찬
	 *  프리랜서 학력을 수정하는 메서드
	 * 
	 */
	public int updateAcademic(AcademicVO academicVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 학력을 추가하는 메서드
	 *  
	 */
	public int insertAcademic(AcademicVO academicVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 학력을 삭제하는 메서드
	 * 
	 */
	public int deleteAcademic(Map<String, String> param) throws Exception;
	
	
	/**
	 * 박시찬
	 * 프리랜서 학력 유무를 체크하는 메서드
	 */
	public List<AcademicVO> academicCheck(Map<String, String> mem_id) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 학력 정보를 가져오는 메서드
	 * 
	 */
	public AcademicVO academicInfo(Map<String, String> param) throws Exception;
	
}
