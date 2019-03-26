package kr.or.ddit.findInfo.dao;

import java.util.Map;

import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("FindInfoDao")
public class FindInfoDaoImpl implements FindInfoDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public MemberVO findInfo(Map<String, String> params) throws Exception {
		return (MemberVO) client.queryForObject("member.findInfo", params);
	}
	
	@Override
	public void randomPass(Map<String, String> params) throws Exception {
		client.update("member.randomPass", params);
	}
}
