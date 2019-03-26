package kr.or.ddit.license.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LicenseVO;

public interface ILicenseService {

	/**
	 * 박시찬
	 * 프리랜서 자격증 리스트를 가져오는 메서드
	 * 
	 */
	public List<LicenseVO> licenseList(Map<String, String> mem_id) throws Exception; 
	
	/**
	 *	박시찬
	 *  프리랜서 자격증을 수정하는 메서드
	 * 
	 */
	public int updateLicense(LicenseVO licenseVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 자격증을 추가하는 메서드
	 *  
	 */
	public int insertLicense(LicenseVO licenseVO) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 자격증을 삭제하는 메서드
	 * 
	 */
	public int deleteLicense(Map<String, String> param) throws Exception;
	
	
	/**
	 * 박시찬
	 * 프리랜서 자격증 유무를 체크하는 메서드
	 */
	public List<LicenseVO> licenseCheck(Map<String, String> mem_id) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 자격증 정보를 가져오는 메서드
	 * 
	 */
	public LicenseVO licenseInfo(Map<String, String> param) throws Exception;

}
