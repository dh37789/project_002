package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service("BoardService")
public class IBoardServiceImpl implements IBoardService{
	@Autowired
	private IBoardDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<BoardVO> boardList(Map<String, String> params)
			throws Exception {
		List<BoardVO> boardList =null;
		boardList = dao.boardList(params);
		
		return boardList;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public BoardVO boardView(Map<String, String> param) throws Exception {
		BoardVO  board = null;
		board = dao.boardView(param);
		
		return board;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertBoard(BoardVO board)
			throws Exception {
		dao.insertBoard(board);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateBoard(BoardVO board) throws Exception {
		dao.updateBoard(board);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteBoard(String param) throws Exception {
		dao.deleteBoard(param);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public void boardHit(Map<String, String> param) throws Exception {
		dao.boardHit(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		
		totalCount = dao.totalCount(params);
		
		return totalCount;
	}
	
}
