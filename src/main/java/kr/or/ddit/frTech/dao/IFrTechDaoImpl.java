package kr.or.ddit.frTech.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.TechniqueVO;

@Repository("frTechDao")
public class IFrTechDaoImpl implements IFrTechDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<TechniqueVO> techList(Map<String, String> mem_id) throws Exception {
		return client.queryForList("technique.techList", mem_id);
	}

	@Override
	public int updateTech(TechniqueVO techVO) throws Exception {
		return client.update("technique.updateTech", techVO);
	}

	@Override
	public int insertTech(TechniqueVO techVO) throws Exception {
		int cnt = 0;
		String key = (String) client.insert("technique.insertTech",techVO);
		if (key != null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteTech(Map<String, String> param) throws Exception {
		return client.delete("technique.deleteTech", param);
	}

	@Override
	public int countTech(Map<String, String> param) throws Exception {
		return (int) client.queryForObject("technique.countTech", param);
	}

	@Override
	public int waitDeleteTech(Map<String, String> param) throws Exception {
		return client.delete("technique.waitDeleteTech", param);
	}

	@Override
	public int calcenDeleteTech(Map<String, String> param) throws Exception {
		return client.delete("technique.calcenDeleteTech", param);
	}

	@Override
	public List<TechniqueVO> techCheck(Map<String, String> mem_id) throws Exception {
		return (List<TechniqueVO>) client.queryForList("technique.techCheck", mem_id);
	}

	@Override
	public int updateRepre(Map<String, String> param) throws Exception {
		return client.update("technique.updateRepre", param);
	}

	@Override
	public int updateTotalRepre(Map<String, String> param) throws Exception {
		return client.update("technique.updateTotalRepre", param);
	}

}
