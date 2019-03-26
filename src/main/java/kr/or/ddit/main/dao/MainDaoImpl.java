package kr.or.ddit.main.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("MainDao")
public class MainDaoImpl implements MainDao{
@Autowired
private SqlMapClient client;

	@Override
	public int totalCount() throws Exception {
		return (int) client.queryForObject("project.totalCount");
	}

	@Override
	public int countMember() throws Exception {
		return (int) client.queryForObject("member.countMember");
	}

	@Override
	public int countPay() throws Exception {
		return (int) client.queryForObject("contract.countPay");
	}

}
