package kr.or.ddit.bore.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.bore.dao.IBoreDao;
import kr.or.ddit.vo.Board_replyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service("BoreService")
public class IBoreServiceImpl implements IBoreService{
	@Autowired
	private IBoreDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Board_replyVO> boreList(Map<String, String> params)
			throws Exception {
		List<Board_replyVO> boardList =null;
		boardList = dao.boreList(params);
		
		return boardList;
	}


	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertBore(Board_replyVO bore)
			throws Exception {
		dao.insertBore(bore);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateBore(Board_replyVO bore) throws Exception {
		dao.updateBore(bore);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteBore(String param) throws Exception {
		dao.deleteBore(param);
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
	public void insertBoreReply(Board_replyVO Bore) throws Exception {
		dao.insertBoreReply(Bore);
	}
	
}
