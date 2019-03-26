package kr.or.ddit.constract.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;
import oracle.net.aso.p;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ContractDaoImpl implements ContractiDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Map<String, Object>> contractList(Map<String, String> params)
			throws Exception {
		return client.queryForList("contract.contractList", params) ;
	}

	@Override
	public void freeNo(Map<String, String> params) throws Exception {
		client.update("contract.freeNo",params);
	}

	@Override
	public void freeOk(Map<String, String> params) throws Exception {
		client.update("contract.freeOk",params);
	}

	@Override
	public void clientOk(Map<String, String> params) throws Exception {
		client.update("contract.clientOk",params);
		
	}

	@Override
	public HashMap<String, String> consFile(Map<String, String> params) throws SQLException {
		return (HashMap<String, String>) client.queryForObject("contract.consFile", params);
	}

	@Override
	public void insertContract(ConstractVO consInfo) throws Exception {
		client.insert("contract.insertContract", consInfo);
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
	public String selectPr_num(String cons_num) throws Exception {
		return (String) client.queryForObject("contract.selectPr_num",cons_num);
	}

	@Override
	public List<String> selectFree(String pr_num) throws Exception {
		return client.queryForList("contract.selectFree", pr_num);
	}
	
	

}
