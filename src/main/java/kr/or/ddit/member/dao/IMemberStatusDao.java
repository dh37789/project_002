package kr.or.ddit.member.dao;

import java.util.Map;

public interface IMemberStatusDao {

	/**
	 * 
	 * 박시찬
	 * 회원 상태를 알수 있는 메서드
	 */
	public String memStatus(Map<String, String> mem_status) throws Exception;
}
