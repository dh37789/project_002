package kr.or.ddit.constract.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.constract.dao.ContractiDao;
import kr.or.ddit.vo.Cons_ClientJoinVO;
import kr.or.ddit.vo.Cons_MemJoinVO;
import kr.or.ddit.vo.ConstractVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	private ContractiDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Map<String, Object>> contractList(Map<String, String> params)
			throws Exception {
		return dao.contractList(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void freeNo(Map<String, String> params) throws Exception {
		dao.freeNo(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void freeOk(Map<String, String> params) throws Exception {
		dao.freeOk(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void clientOk(Map<String, String> params) throws Exception {
		dao.clientOk(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public HashMap<String, String> consFile(Map<String, String> params)
			throws Exception {
		return dao.consFile(params);
	}
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertContract(ConstractVO consInfo) throws Exception {
		dao.insertContract(consInfo);
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
	
	@Override
	public String selectPr_num(String cons_num) throws Exception {
		return dao.selectPr_num(cons_num);
	}
	@Override
	public List<String> selectFree(String pr_num) throws Exception {
		return dao.selectFree(pr_num);
	}

}
