package kr.or.ddit.frMyEndProject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ProjectVO;

@Repository("frMyEndProjectDao")
public class FrMyEndProjectDaoImpl implements FrMyEndProjectDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<HashMap<String, Object>> endProjectList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.endProjectList", params);
	}

	@Override
	public ProjectVO endProjectView(Map<String, String> params)
			throws Exception {
		return (ProjectVO) client.queryForObject("project.endProjectView", params);
	}

	@Override
	public int endCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.endCount", params);
	}

	@Override
	public int frEndPayment(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("project.frEndPayment", params);
	}

}
