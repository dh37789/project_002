package kr.or.ddit.member.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("memberIdenDao")
public class IMemberIdenDaoImpl implements IMemberIdenDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public String memberIden(Map<String, String> mem_iden) throws Exception {
		return (String) client.queryForObject("memberIden.memIden", mem_iden);
	}


}
