package kr.or.ddit.projectTest.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.TestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("testDao")
public class TestDaoImpl implements TestDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertTest(TestVO testInfo) throws Exception {
		client.insert("test.insertTest", testInfo);
	}

	@Override
	public List<TestVO> boardList(Map<String, String> params) throws Exception {
		return client.queryForList("test.boardList", params);
	}

	@Override
	public TestVO boardInfo(Map<String, String> params) throws Exception {
		return (TestVO) client.queryForObject("test.boardInfo", params);
	}

	@Override
	public void boardUpdate(TestVO boardInfo) throws Exception {
		client.update("test.boardUpdate", boardInfo);
	}

	@Override
	public void boardDelete(Map<String, String> params) throws Exception {
		client.update("test.boardDelete", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("test.totalCount", params);
	}

}
