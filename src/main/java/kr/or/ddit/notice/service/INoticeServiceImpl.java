package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service("noticeService")
public class INoticeServiceImpl implements INoticeService{
	@Autowired
	private INoticeDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<NoticeVO> noticeList(Map<String, String> params)
			throws Exception {
		List<NoticeVO> noticeList =null;
		noticeList = dao.noticeList(params);
		
		return noticeList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public NoticeVO noticeView(Map<String, String> param) throws Exception {
		NoticeVO notice = null;
		notice = dao.noticeView(param);
		
		return notice;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertNotice(NoticeVO notice)
			throws Exception {
		dao.insertNotice(notice);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateNotice(NoticeVO notice) throws Exception {
		dao.updateNotice(notice);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteNotice(String param) throws Exception {
		dao.deleteNotice(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void noticeHit(Map<String, String> param) throws Exception {
		dao.noticeHit(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		
		totalCount = dao.totalCount(params);
		
		return totalCount;
	}
	
	
}
