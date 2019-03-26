package kr.or.ddit.frMyProject.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("contractDao")
public class ContractDaoImpl implements ContractDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<HashMap<String, Object>> projectingList(
			Map<String, String> params) throws Exception {
		return (List<HashMap<String, Object>>) client.queryForList("contract.projectingList", params);
	}

	@Override
	public int myProjectCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.myProjectCount", params);
	}

	@Override
	public List<HashMap<String, Object>> memList(Map<String, String> params)
			throws Exception {
		return (List<HashMap<String, Object>>) client.queryForList("contract.memList", params);
	}

	@Override
	public List<HashMap<String, Object>> meetList(Map<String, String> params)
			throws Exception {
		return (List<HashMap<String, Object>>) client.queryForList("contract.meetList", params);
	}

	@Override
	public ConstractVO constractInfo(Map<String, String> params)
			throws Exception {
		return (ConstractVO) client.queryForObject("contract.constractInfo", params);
	}

	@Override
	public void updateCons(ConstractVO consInfo) throws Exception {
		client.update("contract.updateCons", consInfo);
	}

	@Override
	public HashMap<String, String> consFile(Map<String, String> params)
			throws Exception {
		return (HashMap<String, String>) client.queryForObject("contract.consFile", params);
	}

	@Override
	public void clientOk(Map<String, String> params) throws Exception {
		client.update("contract.clientOk", params);
	}

	@Override
	public int totalMoney(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.totalMoney", params);
	}
	
	@Override
	public List<Cons_MemJoinVO> evalFree(Map<String, String> params)
			throws Exception {
		return client.queryForList("contract.evalFree", params);
	}
	
	@Override
	public Cons_ClientJoinVO evalClient(Map<String, String> params)
			throws Exception {
		return (Cons_ClientJoinVO) client.queryForObject("contract.evalClient", params);
	}

	@Override
	public int updateEndCheck(Map<String, String> params) throws Exception {
		return client.update("contract.updateEndCheck", params);
	}

	@Override
	public int countConsFree(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.countConsFree", params);
	}

	@Override
	public int countConsEndChk(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.countConsEndChk", params);
	}
	
	@Override
	public int checkEndChk(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.checkEndChk", params);
	}

	@Override
	public int conChk(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("contract.conChk", params);
	}

}
