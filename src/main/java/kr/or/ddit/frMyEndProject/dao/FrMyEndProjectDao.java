package kr.or.ddit.frMyEndProject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface FrMyEndProjectDao {

	public List<HashMap<String, Object>> endProjectList(Map<String, String> params) throws Exception;
	
	public ProjectVO endProjectView(Map<String, String> params) throws Exception;
	
	public int endCount(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 프리랜서 완료프로젝트 누적금액 가져오는 메서드
	 */
	public int frEndPayment(Map<String, String> params) throws Exception;
	
}
