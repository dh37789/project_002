package kr.or.ddit.interest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Interest_projectVO;
import kr.or.ddit.vo.Intest_FreelancerVO;
@Repository
public class InterestDaoImpl implements InterestDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertProject(Map<String, String> params) throws Exception {
		return (String)client.insert("interest.insertProject", params);
		
	}

	@Override
	public String insertFreelancer(Map<String, String> params) throws Exception {
		return (String) client.insert("interest.insertFreelancer", params);
		
	}

	@Override
	public int deleteProject(Map<String, String> params) throws Exception {
		return client.delete("interest.deleteProject", params);
		
	}

	@Override
	public int deleteFreelancer(Map<String, String> params) throws Exception {
		return client.delete("interest.deleteFreelancer", params);
		
	}

	@Override
	public List<Interest_projectVO> selectProject(Map<String, String> params)
			throws Exception {
		return (List<Interest_projectVO>) client.queryForList("interest.selectProject",params);
	}

	@Override
	public List<Intest_FreelancerVO> selectFreelancer(Map<String, String> params)
			throws Exception {
		return (List<Intest_FreelancerVO>)client.queryForList("interest.selectFreelancer",params);
	}

	@Override
	public int checkProject(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("interest.checkProject", params);
	}

	@Override
	public int checkFreelancer(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("interest.checkFreelancer", params);
	}

	@Override
	public String selectInpr_num(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("interest.selectInpr_num",params);
	}

	@Override
	public List<Map<String, Object>> freeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("interest.freeList",params);
	}

	@Override
	public int countFree(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("interest.countFree", params);
	}

}
