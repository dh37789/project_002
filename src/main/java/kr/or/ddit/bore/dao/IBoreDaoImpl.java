package kr.or.ddit.bore.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.Board_replyVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_fileVO;
@Repository("BoreDao")
public class IBoreDaoImpl implements IBoreDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<Board_replyVO> boreList(Map<String, String> params)
			throws Exception {
		return client.queryForList("bore.boreList",params);
	}


	@Override
	public void insertBore(Board_replyVO bore) throws Exception {
		client.insert("bore.insertBore",bore);		
	}

	@Override
	public void updateBore(Board_replyVO Bore) throws Exception {
		client.update("bore.updateBore", Bore);
	}

	@Override
	public void deleteBore(String param) throws Exception {
		client.update("bore.deleteBore",param);
	}


	
	@Override
	public int totalCount(Map<String,String>params) throws Exception {
		return (int)client.queryForObject("bore.totalCount",params);
	}


	@Override
	public void insertBoreReply(Board_replyVO Bore) throws Exception {
		String bore_seq;
		String bore_depth = String.valueOf(Integer.parseInt(Bore.getBore_depth()) +1);
		Bore.setBore_depth(bore_depth);
		if("0".intern() == Bore.getBore_seq().intern()){
			bore_seq = (String) client.queryForObject("bore.incrementSeq", Bore);
		} else{
			client.update("bore.updateSeq", Bore);
			bore_seq = String.valueOf(Integer.parseInt(Bore.getBore_seq())+1);
		}
		
		Bore.setBore_seq(bore_seq);
		
		client.insert("bore.insertBoreReply", Bore);
		
	}

}
