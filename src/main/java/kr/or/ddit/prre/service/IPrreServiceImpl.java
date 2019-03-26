package kr.or.ddit.prre.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.prre.dao.IPrreDao;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Project_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service("PrreService")
public class IPrreServiceImpl implements IPrreService{
	@Autowired
	private IPrreDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Project_reply> prreList(Map<String, String> params)	throws Exception {
		List<Project_reply> PrreList =null;
		PrreList = dao.PrreList(params);
		
		return PrreList;
	}


	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertPrre(Project_reply prre)
			throws Exception {
		dao.insertPrre(prre);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updatePrre(Project_reply prre) throws Exception {
		dao.updatePrre(prre);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deletePrre(String param) throws Exception {
		dao.deletePrre(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String,String> params) throws Exception {
		int totalCount = 0;		
		totalCount = dao.totalCount(params);
		
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertPrreReply(Project_reply Prre) throws Exception {
		dao.insertPrreReply(Prre);
	}
	
}
