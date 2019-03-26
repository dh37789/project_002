package kr.or.ddit.projectTest.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.projectTest.dao.TestDao;
import kr.or.ddit.vo.TestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("testService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertTest(TestVO testInfo) throws Exception {
		dao.insertTest(testInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<TestVO> boardList(Map<String, String> params) throws Exception {
		return dao.boardList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public TestVO boardInfo(Map<String, String> params) throws Exception {
		return dao.boardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void boardUpdate(TestVO boardInfo) throws Exception {
		dao.boardUpdate(boardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void boardDelete(Map<String, String> params) throws Exception {
		dao.boardDelete(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

}
