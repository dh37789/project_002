package kr.or.ddit.evalation.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.evalation.dao.IEvalationDao;
import kr.or.ddit.vo.EvalationVO;

@Service("evalationService")
public class IEvalationServiceImpl implements IEvalationService{

	@Autowired
	private IEvalationDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int insertEvalation(EvalationVO evalationVO) throws Exception {
		return dao.insertEvalation(evalationVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public double evalAvgPro(Map<String, String> params) throws Exception {
		return dao.evalAvgPro(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public double evalAvgSati(Map<String, String> params) throws Exception {
		return dao.evalAvgSati(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public double evalAvgComm(Map<String, String> params) throws Exception {
		return dao.evalAvgComm(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public double evalAvgSche(Map<String, String> params) throws Exception {
		return dao.evalAvgSche(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public double evalAvgActi(Map<String, String> params) throws Exception {
		return dao.evalAvgActi(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int countEval(Map<String, String> params) throws Exception {
		return dao.countEval(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int evalTotalSum(Map<String, String> params) throws Exception {
		return dao.evalTotalSum(params);
	}


}
