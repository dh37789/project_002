package kr.or.ddit.qna.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.qna.dao.IQnaFileDao;
import kr.or.ddit.vo.Qna_fileVO;

@Service("QnaFileService")
public class IQnaFileServiceImpl implements IQnaFileService {
	@Autowired
	IQnaFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Qna_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return dao.FileInfo(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return dao.deleteFile(params);
	}

}
