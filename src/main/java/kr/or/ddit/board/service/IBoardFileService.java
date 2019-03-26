package kr.or.ddit.board.service;

import java.util.Map;

import kr.or.ddit.vo.Board_fileVO;

public interface IBoardFileService {
	Board_fileVO FileInfo(Map<String, String> param) throws Exception;
	
	int deleteFile(Map<String, String> params) throws Exception;

}
