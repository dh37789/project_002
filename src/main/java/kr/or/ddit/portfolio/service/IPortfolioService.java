package kr.or.ddit.portfolio.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PortfolioVO;
import kr.or.ddit.vo.Portfolio_file_joinVO;

public interface IPortfolioService {

	/**
	 * 박시찬
	 * 포트폴리오 리스트를 가져오는 메서드
	 * 
	 */
	public List<PortfolioVO> portfolioList(Map<String, String> mem_id) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 정보를 가져오는 메서드
	 * 
	 */
	public PortfolioVO portfolioInfo(Map<String, String> mem_id) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 조인정보를 가져오는 메서드
	 * 
	 */
	public Portfolio_file_joinVO portfolioInfoJoin(Map<String, String> po_num) throws Exception;

	
	/**
	 * 박시찬
	 * 포트폴리오 정보를 수정하는 메서드
	 * 
	 */
	public void updatePortfolio(PortfolioVO portfolioVO) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 정보를 등록하는 메서드
	 * 
	 */
	public void insertPortfolio(PortfolioVO portfolioVO) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 정보를 삭제하는 메서드
	 * 
	 */
	public int deletePortfolio(Map<String, String> mem_id) throws Exception;
	
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
	
	/**
	 * 박시찬
	 * 프리랜서 보유기술 중 대표기술을 체크하는 메서드 
	 */
	public List<PortfolioVO> checkRepre(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 기술의 고유번호를 얻어오기 위한 메서드
	 */
	public String poTech(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 포트폴리오 기술의 이름을 얻어오기 위한 메서드
	 */
	public String poTechName(Map<String, String> param) throws Exception;
}
