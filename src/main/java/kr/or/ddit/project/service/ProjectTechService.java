package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_techVO;

public interface ProjectTechService {
	List<LanguageVO> techList(String projectList) throws Exception;
	List<LanguageVO> lanList() throws Exception;
	List<Map<String,String>> project_techList(Map<String, String> params)throws Exception;
}
