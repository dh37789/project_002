package kr.or.ddit.member.service;

import java.util.Map;

import kr.or.ddit.member.dao.IMemberStatusDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("memberStatusService")
public class IMemberStatusServiceImpl implements IMemberStatusService{

	@Autowired
	private IMemberStatusDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String memStatus(Map<String, String> mem_status) throws Exception {
		return dao.memStatus(mem_status);
	}

	
}
