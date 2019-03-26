package kr.or.ddit.main.service;

import kr.or.ddit.main.dao.MainDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MainServiceImpl implements MainService{
@Autowired
private MainDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount() throws Exception {
		return dao.totalCount();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countMember() throws Exception {
		return dao.countMember();
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countPay() throws Exception {
		return dao.countPay();
	}
	
}
