package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_techVO;
import kr.or.ddit.vo.TechniqueVO;

public interface ProjectTechDao {
	/**
	 * 프로젝트에 해당하는 보유기술 리스트를 가져온다.
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<LanguageVO> techList(String projectList) throws Exception;
	
	List<LanguageVO> lanList() throws Exception;
	
	List<Map<String,String>> project_techList(Map<String, String> params) throws Exception;
	
}
