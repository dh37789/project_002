package kr.or.ddit.board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.board.dao.IBoardFileDao;
import kr.or.ddit.vo.Board_fileVO;

@Service("BoardFileService")
public class IBoardFileServiceImpl implements IBoardFileService {
	@Autowired
	IBoardFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Board_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return dao.FileInfo(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return dao.deleteFile(params);
	}

}
