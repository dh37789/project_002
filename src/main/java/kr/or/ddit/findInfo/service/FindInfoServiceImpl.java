package kr.or.ddit.findInfo.service;

import java.util.Map;

import kr.or.ddit.findInfo.dao.FindInfoDao;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("FindInfoService")
public class FindInfoServiceImpl implements FindInfoService {
	@Autowired
	private FindInfoDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO findInfo(Map<String, String> params) throws Exception {
		return dao.findInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void randomPass(Map<String, String> params) throws Exception {
		dao.randomPass(params);
		
	}

}
