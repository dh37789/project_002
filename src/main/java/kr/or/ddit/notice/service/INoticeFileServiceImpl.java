package kr.or.ddit.notice.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.notice.dao.INoticeFileDao;
import kr.or.ddit.vo.Notice_fileVO;

@Service("NoticeFileService")
public class INoticeFileServiceImpl implements INoticeFileService {
	@Autowired
	INoticeFileDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Notice_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return dao.FileInfo(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return dao.deleteFile(params);
	}

}
