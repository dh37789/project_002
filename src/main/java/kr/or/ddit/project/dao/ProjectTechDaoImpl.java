package kr.or.ddit.project.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.Project_techVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ProjectTechDaoImpl implements ProjectTechDao {
	@Autowired
	private SqlMapClient client;


	@Override
	public List<LanguageVO> techList(String projectList)
			throws Exception {
		return (List<LanguageVO>) client.queryForList("language.languageList",projectList);
	}


	@Override
	public List<LanguageVO> lanList() throws Exception {
		return client.queryForList("language.lanList");
	}


	@Override
	public List<Map<String,String>> project_techList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project_tech.project_techList",params);
	}

	
}
