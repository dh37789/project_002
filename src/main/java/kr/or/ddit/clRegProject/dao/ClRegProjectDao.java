package kr.or.ddit.clRegProject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ClRegProjectDao {

	/**
	 * 유서진
	 * 클라이언트가 등록한 프로젝트 리스트를 보는 메서드
	 * @param params
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> regProjectList(Map<String, String> params) throws Exception;
}
