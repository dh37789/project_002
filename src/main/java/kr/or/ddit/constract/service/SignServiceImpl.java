package kr.or.ddit.constract.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.constract.dao.SignDao;
import kr.or.ddit.vo.SignVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("signService")
public class SignServiceImpl implements SignService{

	@Autowired
	private SignDao dao;

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public SignVO signInfo(Map<String, String> params) throws Exception {
		return dao.signInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertSign(SignVO signInfo) throws Exception {
		dao.insertSign(signInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<SignVO> signList(Map<String, String> params) throws Exception {
		return dao.signList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteSign(Map<String, String> params) throws Exception {
		dao.deleteSign(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void resetSign(Map<String, String> params) throws Exception {
		dao.resetSign(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int countSign(Map<String, String> params) throws Exception {
		return dao.countSign(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertFirstSign(SignVO signInfo) throws Exception {
		dao.insertFirstSign(signInfo);
	}
}
