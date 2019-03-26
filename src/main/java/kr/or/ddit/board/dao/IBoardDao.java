package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDao {
	public List<BoardVO> boardList(Map<String,String> params)throws Exception;
	
	public BoardVO boardView(Map<String,String>param)throws Exception;
	
	public void insertBoard(BoardVO Board) throws Exception;
	
	public void updateBoard(BoardVO Board) throws Exception;
	
	public void deleteBoard(String param) throws Exception;
	
	public void boardHit(Map<String,String> param) throws Exception;
	
	public int totalCount(Map<String,String> params)throws Exception;

	
}
