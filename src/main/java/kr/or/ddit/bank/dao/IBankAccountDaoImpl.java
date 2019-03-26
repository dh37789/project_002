package kr.or.ddit.bank.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Bank_accountVO;
import kr.or.ddit.vo.Bank_joinVO;

@Repository("bankAccountDao")
public class IBankAccountDaoImpl implements IBankAccountDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public int updatebankAccount(Bank_accountVO bank_acVO) throws Exception {
		return client.update("bank_account.updatebankAccount", bank_acVO);
	}

	@Override
	public void insertbankAccount(Bank_accountVO bank_acVO) throws Exception {
		client.insert("bank_account.insertbankAccount", bank_acVO);
	}

	@Override
	public Bank_joinVO bankAccountInfo(Map<String, String> param)
			throws Exception {
		return (Bank_joinVO) client.queryForObject("bank_account.bankAccountInfo", param);
	}


}
