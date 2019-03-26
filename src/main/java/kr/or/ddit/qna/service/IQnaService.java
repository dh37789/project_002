package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.QnaVO;

public interface IQnaService {
	public List<QnaVO> qnaList(Map<String,String> params)throws Exception;
	
	public QnaVO qnaView(Map<String,String>param)throws Exception;
	
	public void insertQna(QnaVO Qna) throws Exception;
	
	public void updateQna(QnaVO Qna) throws Exception;
	
	public void deleteQna(String param) throws Exception;

	public void delQna(String param) throws Exception;
	
	public void qnaHit(Map<String,String> param) throws Exception;

	public void qnaRe(String param) throws Exception;
	
	public void qnaReDe(String param) throws Exception;
	
	public int totalCount()throws Exception;
	
	public void insertQnaReply(QnaVO Qna) throws Exception;
}
