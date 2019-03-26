package kr.or.ddit.bank.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.bank.dao.IBankAccountDao;
import kr.or.ddit.vo.Bank_accountVO;
import kr.or.ddit.vo.Bank_joinVO;

@Service("bankAccountService")
public class IBankAccountServiceImpl implements IBankAccountService{

	@Autowired
	private IBankAccountDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updatebankAccount(Bank_accountVO bank_acVO) throws Exception {
		return dao.updatebankAccount(bank_acVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertbankAccount(Bank_accountVO bank_acVO) throws Exception {
		dao.insertbankAccount(bank_acVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Bank_joinVO bankAccountInfo(Map<String, String> param)
			throws Exception {
		return dao.bankAccountInfo(param);
	}
	

}
