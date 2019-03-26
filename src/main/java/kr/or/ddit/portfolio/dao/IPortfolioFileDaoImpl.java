package kr.or.ddit.portfolio.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Qna_fileVO;

@Repository("portfolioFileDao")
public class IPortfolioFileDaoImpl implements IPortfolioFileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void insertFile(Portfolio_fileVO file) throws Exception {
		client.insert("portfolio_file.insertFile",file);
	}

	@Override
	public Portfolio_fileVO boardFileInfo(Map<String, String> param)
			throws Exception {
		return (Portfolio_fileVO) client.queryForObject("portfolio_file.boardFileInfo", param);
		
	}

	@Override
	public int deleteFile(Map<String, String> params) throws Exception {
		return client.update("portfolio_file.deleteFile", params);
	}

	@Override
	public Portfolio_fileVO fileInfo(Map<String, String> params)
			throws Exception {
		return (Portfolio_fileVO) client.queryForObject("portfolio_file.fileInfo", params);
	}

	@Override
	public List<Portfolio_fileVO> fileItemList()
			throws Exception {
		return client.queryForList("portfolio_file.fileItemList");
	}

}
