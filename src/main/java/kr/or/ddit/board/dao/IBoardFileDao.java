package kr.or.ddit.board.dao;

import java.util.Map;

import kr.or.ddit.vo.Board_fileVO;


public interface IBoardFileDao {
	void insertFile(Board_fileVO file) throws Exception;

	Board_fileVO FileInfo(Map<String, String> param) throws Exception;

	int deleteFile(Map<String, String> params) throws Exception;
}
