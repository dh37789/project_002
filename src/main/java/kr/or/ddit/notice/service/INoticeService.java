package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.NoticeVO;

public interface INoticeService {
	public List<NoticeVO> noticeList(Map<String,String> params)throws Exception;
	
	public NoticeVO noticeView(Map<String,String>param)throws Exception;
	
	public void insertNotice(NoticeVO notice) throws Exception;
	
	public void updateNotice(NoticeVO notice) throws Exception;
	
	public void deleteNotice(String param) throws Exception;
	
	public void noticeHit(Map<String,String> param) throws Exception;
	
	public int totalCount(Map<String,String> params)throws Exception;
	
}
