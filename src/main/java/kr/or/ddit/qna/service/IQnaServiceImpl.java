package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.qna.dao.IQnaDao;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.QnaVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service("QnaService")
public class IQnaServiceImpl implements IQnaService{
	@Autowired
	private IQnaDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<QnaVO> qnaList(Map<String, String> params)
			throws Exception {
		List<QnaVO> qnaList =null;
		qnaList = dao.qnaList(params);
		
		return qnaList;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public QnaVO qnaView(Map<String, String> param) throws Exception {
		QnaVO  qna = null;
		qna = dao.qnaView(param);
		
		return qna;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertQna(QnaVO qna)
			throws Exception {
		dao.insertQna(qna);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateQna(QnaVO qna) throws Exception {
		dao.updateQna(qna);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteQna(String param) throws Exception {
		dao.deleteQna(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void delQna(String param) throws Exception {
		dao.delQna(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void qnaHit(Map<String, String> param) throws Exception {
		dao.qnaHit(param);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public int totalCount() throws Exception {
		int totalCount = 0;
		
		totalCount = dao.totalCount();
		
		return totalCount;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor=Exception.class)
	@Override
	public void insertQnaReply(QnaVO qna) throws Exception {
		dao.insertQnaReply(qna);	
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void qnaRe(String param) throws Exception {
		dao.qnaRe(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void qnaReDe(String param) throws Exception {
		dao.qnaReDe(param);
	}

}
