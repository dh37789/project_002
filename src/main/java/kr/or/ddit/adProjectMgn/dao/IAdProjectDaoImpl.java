package kr.or.ddit.adProjectMgn.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ProjectVO;

@Repository("IAdProjectDao")
public class IAdProjectDaoImpl implements IAdProjectDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<ProjectVO> stProjectList(Map<String, String> params) throws Exception{
		return client.queryForList("project.stProjectList", params);
	}

	@Override
	public ProjectVO stProjectView(Map<String, String> params) throws Exception {
		return (ProjectVO) client.queryForObject("project.stProjectView", params);
	}

	@Override
	public void accProject(Map<String, String> params) throws Exception {
		client.update("project.accProject", params);
		
	}

	@Override
	public void refuProject(Map<String, String> params) throws Exception {
		client.update("project.refuProject", params);
		
	}
	
	@Override
	public int countPro(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.countPro", params);
	}

	@Override
	public void insertRefuse(Map<String, String> params) throws Exception {
		client.update("project.insertRefuse", params);
		
	}

	@Override
	public List<ProjectVO> adEndPrList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.adEndPrList", params);
	}

	@Override
	public ProjectVO adEndPrView(Map<String, String> params) throws Exception {
		return (ProjectVO) client.queryForObject("project.clEndPrView", params);
	}

	@Override
	public int countEnd(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.adEndCount", params);
	}

	@Override
	public List<HashMap<String, Object>> conProjectList(Map<String, String> params) throws Exception {
		return client.queryForList("project.conProjectList", params);
	}

	@Override
	public int conProjectCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.conProjectCount", params);
	}

	@Override
	public void projectDelete(Map<String, String> params) throws SQLException {
		client.update("project.projectDelete", params);
	}

	@Override
	public void contractProject(Map<String, String> params) throws SQLException {
		client.update("project.contractProject", params);
	}

	@Override
	public int projectingCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.projectingCount", params);
	}

	@Override
	public List<HashMap<String, Object>> projectingList(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.projectingList", params);
	}

	@Override
	public List<HashMap<String, Object>> adverProjectList(
			Map<String, String> params) throws Exception {
		return client.queryForList("project.adverProjectList", params);
	}

	@Override
	public int adverPrCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.adverPrCount", params);
	}

	@Override
	public void adverEndproject(Map<String, String> params) throws Exception {
		client.update("project.adverEndproject", params);
	}

	

	
}
