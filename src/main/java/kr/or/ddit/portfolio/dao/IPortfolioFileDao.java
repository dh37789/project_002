package kr.or.ddit.portfolio.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Project_notice_fileVO;
import kr.or.ddit.vo.Qna_fileVO;


public interface IPortfolioFileDao {
	/**
	 * 박시찬
	 * 프리랜서 포트폴리오파일을 추가하는 메서드
	 */
	public void insertFile(Portfolio_fileVO file) throws Exception;

	/**
	 * 박시찬
	 * 프리랜서 포트폴리오파일의 정보를 가져오는 메서드
	 */
	public Portfolio_fileVO boardFileInfo(Map<String, String> param) throws Exception;

	/**
	 * 박시찬
	 * 프리랜서 포트폴리오파일을 삭제하는 메서드
	 */
	public int deleteFile(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 포트폴리오파일의 정보를 가져오는 메서드
	 */
	public Portfolio_fileVO fileInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 포트폴리오파일의 이미지 리스트를 가져오는 메서드
	 */
	public List<Portfolio_fileVO> fileItemList() throws Exception;
}
