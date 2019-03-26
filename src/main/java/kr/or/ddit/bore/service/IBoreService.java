package kr.or.ddit.bore.service;

import java.util.List;
import java.util.Map;


import kr.or.ddit.vo.Board_replyVO;

public interface IBoreService {
	public List<Board_replyVO> boreList(Map<String,String> params)throws Exception;
	
	
	public void insertBore(Board_replyVO Bore) throws Exception;
	
	public void updateBore(Board_replyVO Bore) throws Exception;
	
	public void deleteBore(String param) throws Exception;
	
	public int totalCount(Map<String,String> params)throws Exception;

	public void insertBoreReply(Board_replyVO Bore)throws Exception;

}
