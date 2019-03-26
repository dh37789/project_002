package kr.or.ddit.qna.dao;

import java.util.Map;

import kr.or.ddit.vo.Qna_fileVO;


public interface IQnaFileDao {
	void insertFile(Qna_fileVO file) throws Exception;

	Qna_fileVO FileInfo(Map<String, String> param) throws Exception;

	int deleteFile(Map<String, String> params) throws Exception;
}
