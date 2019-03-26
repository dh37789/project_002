package kr.or.ddit.notice.service;

import java.util.Map;

import kr.or.ddit.vo.Notice_fileVO;

public interface INoticeFileService {
	Notice_fileVO FileInfo(Map<String, String> param) throws Exception;
	
	int deleteFile(Map<String, String> params) throws Exception;

}
