package kr.or.ddit.qna.service;

import java.util.Map;

import kr.or.ddit.vo.Qna_fileVO;

public interface IQnaFileService {
	Qna_fileVO FileInfo(Map<String, String> param) throws Exception;
	
	int deleteFile(Map<String, String> params) throws Exception;

}
