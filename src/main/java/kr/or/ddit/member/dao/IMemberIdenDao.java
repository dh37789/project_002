package kr.or.ddit.member.dao;

import java.util.Map;

public interface IMemberIdenDao {

	/**
	 * 박시찬
	 * 회원을 식별하는 메서드(프리랜서,클라이언트,관리자)
	 */
	public String memberIden(Map<String, String> mem_iden) throws Exception;

}
