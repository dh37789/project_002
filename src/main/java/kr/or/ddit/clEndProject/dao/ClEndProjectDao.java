package kr.or.ddit.clEndProject.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface ClEndProjectDao {
	public List<ProjectVO> clEndPrList(Map<String, String> params) throws Exception;
	
	public ProjectVO clEndPrView(Map<String, String> params) throws Exception;
	
	public int clEndCount(Map<String, String> params) throws Exception;
}
