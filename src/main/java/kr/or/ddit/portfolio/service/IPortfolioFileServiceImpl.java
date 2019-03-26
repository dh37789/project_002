package kr.or.ddit.portfolio.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.portfolio.dao.IPortfolioFileDao;
import kr.or.ddit.qna.dao.IQnaFileDao;
import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Qna_fileVO;

@Service("portfolioFileService")
public class IPortfolioFileServiceImpl implements IPortfolioFileService {
	@Autowired
	IPortfolioFileDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertFile(Portfolio_fileVO file) throws Exception {
		dao.insertFile(file);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Portfolio_fileVO boardFileInfo(Map<String, String> param)
			throws Exception {
		return dao.boardFileInfo(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return dao.deleteFile(params);
	}

	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Portfolio_fileVO fileInfo(Map<String, String> params)
			throws Exception {
		return dao.fileInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<Portfolio_fileVO> fileItemList()
			throws Exception {
		return dao.fileItemList();
	}
	

}
