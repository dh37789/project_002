package kr.or.ddit.constract.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.SignVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ch.qos.logback.core.net.server.Client;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("signDao")
public class SignDaoImpl implements SignDao{
	
	@Autowired
	SqlMapClient client;

	@Override
	public SignVO signInfo(Map<String, String> params) throws Exception {
		return (SignVO) client.queryForObject("sign.signInfo", params);
	}

	@Override
	public void insertSign(SignVO signInfo) throws Exception {
		client.insert("sign.insertSign", signInfo);
	}

	@Override
	public List<SignVO> signList(Map<String, String> params) throws Exception {
		return client.queryForList("sign.signList", params);
	}

	@Override
	public void deleteSign(Map<String, String> params) throws Exception {
		client.update("sign.deleteSign", params);
	}

	@Override
	public void resetSign(Map<String, String> params) throws Exception {
		client.update("sign.resetSign", params);
		representSign(params);
	}

	@Override
	public void representSign(Map<String, String> params) throws Exception {
		client.update("sign.representSign", params);
	}

	@Override
	public int countSign(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("sign.countSign", params);
	}

	@Override
	public void insertFirstSign(SignVO signInfo) throws Exception {
		client.insert("sign.insertFirstSign", signInfo);
	}
}
