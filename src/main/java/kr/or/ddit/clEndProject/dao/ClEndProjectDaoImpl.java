package kr.or.ddit.clEndProject.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ProjectVO;

@Repository("ClEndPrijectDao")
public class ClEndProjectDaoImpl implements ClEndProjectDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<ProjectVO> clEndPrList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.clEndPrList",params);
	}

	@Override
	public ProjectVO clEndPrView(Map<String, String> params) throws Exception {
		return (ProjectVO) client.queryForObject("project.clEndPrView", params);
	}

	@Override
	public int clEndCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.clEndCount", params);
	}
	
}
