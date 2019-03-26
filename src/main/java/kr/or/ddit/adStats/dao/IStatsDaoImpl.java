package kr.or.ddit.adStats.dao;



import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("IStatsDao")
public class IStatsDaoImpl implements IStatsDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public Map<String, String> totalSales() throws Exception {
		return (Map<String, String>) client.queryForObject("project.totalSales");
	}

	@Override
	public Map<String, String> pureSales() throws Exception {
		return (Map<String, String>) client.queryForObject("project.pureSales");
		
	}

	@Override
	public Map<String, String> categoryList() throws Exception {
		return (Map<String, String>) client.queryForObject("project.categoryList");
	}

	@Override
	public Map<String, String> pjCondition() throws Exception {
		return (Map<String, String>) client.queryForObject("project.pjCondition");
	}

	@Override
	public Map<String, String> pjCategory() throws Exception {
		return (Map<String, String>) client.queryForObject("project.pjCategory");
	}

	@Override
	public Map<String, String> pjRegion() throws Exception {
		return (Map<String, String>) client.queryForObject("project.pjRegion");
	}

	@Override
	public List<Map<String, String>> projectCnt() throws Exception {
		return  client.queryForList("project.projectCnt");
	}

	@Override
	public List<Map<String, String>> projectPayment() throws Exception {
		return  client.queryForList("project.projectPayment");
	}

	@Override
	public List<Map<String, String>> freeJoinProject() throws Exception {
		return client.queryForList("project.freeJoinProject");
	}

	@Override
	public List<Map<String, String>> freeSalary() throws Exception {
		return client.queryForList("project.freeSalary");
	}
	


	
	
	

}
