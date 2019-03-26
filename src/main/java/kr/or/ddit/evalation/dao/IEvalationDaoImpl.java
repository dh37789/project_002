package kr.or.ddit.evalation.dao;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.EvalationVO;

@Repository("evalationDao")
public class IEvalationDaoImpl implements IEvalationDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public int insertEvalation(EvalationVO evalationVO) throws Exception {
		int cnt = 0;
		String key = (String) client.insert("evalation.insertEvalation", evalationVO);
		if (key != null){
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public double evalAvgPro(Map<String, String> params) throws Exception {
		return (double) client.queryForObject("evalation.evalAvgPro", params);
	}

	@Override
	public double evalAvgSati(Map<String, String> params) throws Exception {
		return (double) client.queryForObject("evalation.evalAvgSati", params);
	}

	@Override
	public double evalAvgComm(Map<String, String> params) throws Exception {
		return (double) client.queryForObject("evalation.evalAvgComm", params);
	}

	@Override
	public double evalAvgSche(Map<String, String> params) throws Exception {
		return (double) client.queryForObject("evalation.evalAvgSche", params);
	}

	@Override
	public double evalAvgActi(Map<String, String> params) throws Exception {
		return (double) client.queryForObject("evalation.evalAvgActi", params);
	}

	@Override
	public int countEval(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("evalation.countEval", params);
	}

	@Override
	public int evalTotalSum(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("evalation.evalTotalSum", params);
	}


}
