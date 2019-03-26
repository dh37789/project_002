package kr.or.ddit.prre.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.Project_reply;
@Repository("PrreDao")
public class IPrreDaoImpl implements IPrreDao{
	@Autowired
	private SqlMapClient client;
	
	@Override
	public List<Project_reply> PrreList(Map<String, String> params)
			throws Exception {
		return client.queryForList("prre.prreList", params);
	}


	@Override
	public void insertPrre(Project_reply prre) throws Exception {
		client.insert("prre.insertPrre", prre);		
	}

	@Override
	public void updatePrre(Project_reply Prre) throws Exception {
		client.update("prre.updatePrre", Prre);
	}

	@Override
	public void deletePrre(String param) throws Exception {
		client.update("prre.deletePrre", param);
	}


	
	@Override
	public int totalCount(Map<String,String>params) throws Exception {
		return (int)client.queryForObject("prre.totalCount", params);
	}


	@Override
	public void insertPrreReply(Project_reply Prre) throws Exception {
		String prre_seq;
		String prre_depth = String.valueOf(Integer.parseInt(Prre.getPrre_depth()) +1);
		Prre.setPrre_depth(prre_depth);
		if("0".intern() == Prre.getPrre_seq().intern()){
			prre_seq = (String) client.queryForObject("prre.incrementSeq", Prre);
		} else{
			client.update("prre.updateSeq", Prre);
			prre_seq = String.valueOf(Integer.parseInt(Prre.getPrre_seq())+1);
		}
		
		Prre.setPrre_seq(prre_seq);
		
		client.insert("prre.insertPrreReply", Prre);
		
	}

}
