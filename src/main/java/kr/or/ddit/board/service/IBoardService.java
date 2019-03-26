package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.BoardVO;

public interface IBoardService {
	public List<BoardVO> boardList(Map<String,String> params)throws Exception;
	
	public BoardVO boardView(Map<String,String>param)throws Exception;
	
	public void insertBoard(BoardVO Board) throws Exception;
	
	public void updateBoard(BoardVO Board) throws Exception;
	
	public void deleteBoard(String param) throws Exception;
	
	public void boardHit(Map<String,String> param) throws Exception;
	
	public int totalCount(Map<String,String> params)throws Exception;
	
}
