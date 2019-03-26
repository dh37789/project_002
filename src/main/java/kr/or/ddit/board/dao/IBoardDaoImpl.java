package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_fileVO;
@Repository("BoardDao")
public class IBoardDaoImpl implements IBoardDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private IBoardFileDao itemDao;
	
	@Override
	public List<BoardVO> boardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("board.boardList",params);
	}

	@Override
	public BoardVO boardView(Map<String, String> param) throws Exception {
		return (BoardVO)client.queryForObject("board.boardView",param);
	}

	@Override
	public void insertBoard(BoardVO board) throws Exception {
		String bo_num= (String)client.insert("board.insertBoard",board);
		if (!board.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(board.getFile(), bo_num);
			Board_fileVO file = new Board_fileVO();
			System.out.println(board.getFile().getName());
			file.setBo_num(bo_num);
			file.setBofile_size(item.getFile_size());
			file.setBofile_name(item.getFile_name());
			file.setBofile_save_name(item.getFile_save_name());
			file.setBofile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void updateBoard(BoardVO Board) throws Exception {
		client.update("board.updateBoard", Board);
		String bo_num = Board.getBo_num();
		if ((!(Board.getFile() == null))&&!Board.getFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(Board.getFile(), bo_num);
			Board_fileVO file = new Board_fileVO();
			System.out.println(Board.getFile().getName());
			file.setBo_num(bo_num);
			file.setBofile_size(item.getFile_size());
			file.setBofile_name(item.getFile_name());
			file.setBofile_save_name(item.getFile_save_name());
			file.setBofile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public void deleteBoard(String param) throws Exception {
		client.update("board.deleteBoard",param);
	}

	@Override
	public void boardHit(Map<String, String> param) throws Exception {
		client.update("board.boardHit",param);		
	}

	
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int)client.queryForObject("board.totalCount",params);
	}

}
