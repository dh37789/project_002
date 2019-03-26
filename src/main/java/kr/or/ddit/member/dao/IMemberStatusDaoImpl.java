package kr.or.ddit.member.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("memberStatusDao")
public class IMemberStatusDaoImpl implements IMemberStatusDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public String memStatus(Map<String, String> mem_status) throws Exception {
		return (String) client.queryForObject("memberStatus.memStatus", mem_status);
	}

}
