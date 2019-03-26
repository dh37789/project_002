package kr.or.ddit.board.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Board_fileVO;

@Repository("BoardFileDao")
public class IBoardFileDaoImpl implements IBoardFileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertFile(Board_fileVO file) throws Exception {
		client.insert("board_file.insertFile",file);
	}

	@Override
	public Board_fileVO FileInfo(Map<String, String> param)
			throws Exception {
		return (Board_fileVO) client.queryForObject("board_file.FileInfo", param);
		
	}

	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return client.update("board_file.deleteFile", params);
	}

}
