package kr.or.ddit.frTech.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.TechniqueVO;

public interface IFrTechDao {

	/**
	 * 박시찬
	 * 프리랜서 자신의 보유기술 리스트를 가져오는 메서드
	 * 
	 */
	public List<TechniqueVO> techList(Map<String, String> mem_id) throws Exception; 
	
	/**
	 *	박시찬
	 *  프리랜서 보유기술을 수정하는 메서드
	 * 
	 */
	public int updateTech(TechniqueVO techVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술을 추가하는 메서드
	 *  
	 */
	public int insertTech(TechniqueVO techVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술을 삭제하는 메서드
	 * 
	 */
	public int deleteTech(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술의 중복을 확인하는 메서드
	 * 
	 */
	public int countTech(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술 삭제를 보류하는 메서드
	 */
	public int waitDeleteTech(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술 삭제보류 항목들을 원상복구 시키는 메서드
	 */
	public int calcenDeleteTech(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술 유무를 체크하는 메서드
	 */
	public List<TechniqueVO> techCheck(Map<String, String> mem_id) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술중 대표기술을 선정하는 메서드
	 */
	public int updateRepre(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술중 대표기술을 수정하는 메서드
	 */
	public int updateTotalRepre(Map<String, String> param) throws Exception;
}
