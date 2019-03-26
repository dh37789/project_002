package kr.or.ddit.notice.dao;

import java.util.Map;

import kr.or.ddit.vo.Notice_fileVO;


public interface INoticeFileDao {
	void insertFile(Notice_fileVO file) throws Exception;

	Notice_fileVO FileInfo(Map<String, String> param) throws Exception;

	int deleteFile(Map<String, String> params) throws Exception;
}
