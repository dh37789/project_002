package kr.or.ddit.frMyProject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.frMyProject.dao.ContractDao;
import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("contractService")
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> projectingList(
			Map<String, String> params) throws Exception{
		return dao.projectingList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int myProjectCount(Map<String, String> params) throws Exception {
		return dao.myProjectCount(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> memList(Map<String, String> params) throws Exception {
		return dao.memList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<HashMap<String, Object>> meetList(Map<String, String> params)
			throws Exception {
		return dao.meetList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public ConstractVO constractInfo(Map<String, String> params)
			throws Exception {
		return dao.constractInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateCons(ConstractVO consInfo) throws Exception {
		dao.updateCons(consInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public HashMap<String, String> consFile(Map<String, String> params)
			throws Exception {
		return dao.consFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void clientOk(Map<String, String> params) throws Exception {
		dao.clientOk(params);
	}

	@Override
	public int totalMoney(Map<String, String> params) throws Exception {
		return dao.totalMoney(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Cons_MemJoinVO> evalFree(Map<String, String> params)
			throws Exception {
		return dao.evalFree(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Cons_ClientJoinVO evalClient(Map<String, String> params)
			throws Exception {
		return dao.evalClient(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateEndCheck(Map<String, String> params) throws Exception {
		return dao.updateEndCheck(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countConsFree(Map<String, String> params) throws Exception {
		return dao.countConsFree(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countConsEndChk(Map<String, String> params) throws Exception {
		return dao.countConsEndChk(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int checkEndChk(Map<String, String> params) throws Exception {
		return dao.checkEndChk(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int conChk(Map<String, String> params) throws Exception {
		return dao.conChk(params);
	}
}
