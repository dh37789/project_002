package kr.or.ddit.constract.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SignVO;

public interface SignDao {

	SignVO signInfo(Map<String, String> params) throws Exception;

	void insertSign(SignVO signInfo) throws Exception;

	List<SignVO> signList(Map<String, String> params) throws Exception;

	void deleteSign(Map<String, String> params) throws Exception;

	void resetSign(Map<String, String> params) throws Exception;

	void representSign(Map<String, String> params) throws Exception;

	int countSign(Map<String, String> params) throws Exception;

	void insertFirstSign(SignVO signInfo) throws Exception;
}
