package kr.or.ddit.bank.service;

import java.util.Map;

import kr.or.ddit.vo.Bank_accountVO;
import kr.or.ddit.vo.Bank_joinVO;

public interface IBankAccountService {

	/**
	 *	박시찬
	 *  회원의 계좌 정보를 수정하는 메서드
	 * 
	 */
	public int updatebankAccount(Bank_accountVO bank_acVO) throws Exception;
	
	/**
	 * 박시찬
	 * 회원의 계좌 정보를 추가하는 메서드
	 *  
	 */
	public void insertbankAccount(Bank_accountVO bank_acVO) throws Exception;
	
	
	/**
	 * 박시찬
	 * 회원의 계좌 정보를 가져오는 메서드
	 * 
	 */
	public Bank_joinVO bankAccountInfo(Map<String, String> param) throws Exception;

}
