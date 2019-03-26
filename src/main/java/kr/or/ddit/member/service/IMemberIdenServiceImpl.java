package kr.or.ddit.member.service;

import java.util.Map;

import kr.or.ddit.member.dao.IMemberIdenDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("memberIdenService")
public class IMemberIdenServiceImpl implements IMemberIdenService{
	@Autowired
	private IMemberIdenDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String memberIden(Map<String, String> mem_iden) throws Exception {
		return dao.memberIden(mem_iden);
	}
	

}
