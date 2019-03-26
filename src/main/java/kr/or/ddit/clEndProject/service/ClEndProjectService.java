package kr.or.ddit.clEndProject.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

public interface ClEndProjectService {
	public List<ProjectVO> clEndPrList(Map<String, String> params) throws Exception;
	public ProjectVO clEndPrView(Map<String, String> params) throws Exception;
	public int clEndCount(Map<String, String> params) throws Exception;
}
