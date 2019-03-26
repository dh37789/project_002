package kr.or.ddit.clRegProject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ClRegProjectDaoImpl implements ClRegProjectDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<HashMap<String, Object>> regProjectList(Map<String, String> params)
			throws Exception {
		return client.queryForList("project.regProjectList", params);
	}
	
}
