package kr.or.ddit.portfolio.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.utils.AttacheFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.PortfolioVO;
import kr.or.ddit.vo.Portfolio_file_joinVO;

@Repository("portfolioDao")
public class IPortfolioDaoImpl implements IPortfolioDao{
	@Autowired
	private SqlMapClient client;
	@Autowired
	private AttacheFileMapper mapper;
	@Autowired
	private IPortfolioFileDao itemDao;

	
	
	@Override
	public List<PortfolioVO> portfolioList(Map<String, String> mem_id) throws Exception {
		return client.queryForList("portfolio.portfolioList", mem_id);
	}

	@Override
	public PortfolioVO portfolioInfo(Map<String, String> mem_id) throws Exception {
		return (PortfolioVO) client.queryForObject("portfolio.portfolioInfo", mem_id);
	}
	
	@Override
	public void updatePortfolio(PortfolioVO portfolioVO) throws Exception {
		client.update("portfolio.updatePortfolio", portfolioVO);
		String po_num = portfolioVO.getPo_num();
		if (portfolioVO.getPortFile() != null){
			if (!portfolioVO.getPortFile().getOriginalFilename().equals("")) {
				FileItemVO item = mapper.mapping(portfolioVO.getPortFile(), po_num);
				Portfolio_fileVO file = new Portfolio_fileVO();
				file.setPo_num(po_num);
				file.setPofile_size(item.getFile_size());
				file.setPofile_file_name(item.getFile_name());
				file.setPofile_save_name(item.getFile_save_name());
				file.setPofile_type(item.getFile_content_type());
				itemDao.insertFile(file);
			}
		}
	}

	@Override
	public void insertPortfolio(PortfolioVO portfolioVO) throws Exception {
		String po_num = (String) client.insert("portfolio.insertPortfolio", portfolioVO);
		if (!portfolioVO.getPortFile().getOriginalFilename().equals("")) {
			FileItemVO item = mapper.mapping(portfolioVO.getPortFile(), po_num);
			Portfolio_fileVO file = new Portfolio_fileVO();
			file.setPo_num(po_num);
			file.setPofile_size(item.getFile_size());
			file.setPofile_file_name(item.getFile_name());
			file.setPofile_save_name(item.getFile_save_name());
			file.setPofile_type(item.getFile_content_type());
			itemDao.insertFile(file);
		}
	}

	@Override
	public int deletePortfolio(Map<String, String> mem_id) throws Exception {
		return client.delete("portfolio.deletePortfolio", mem_id);
	}

	@Override
	public int updateRepre(Map<String, String> param) throws Exception {
		return client.update("portfolio.updateRepre", param);
	}

	@Override
	public int updateTotalRepre(Map<String, String> param) throws Exception {
		return client.update("portfolio.updateTotalRepre", param);
	}

	@Override
	public List<PortfolioVO> checkRepre(Map<String, String> param)
			throws Exception {
		return (List<PortfolioVO>) client.queryForList("portfolio.checkRepre", param);
	}

	@Override
	public Portfolio_file_joinVO portfolioInfoJoin(Map<String, String> po_num)
			throws Exception {
		return (Portfolio_file_joinVO) client.queryForObject("portfolio.portfolioInfoJoin", po_num);
	}

	@Override
	public String poTech(Map<String, String> param) throws Exception {
		return (String) client.queryForObject("language.poTech", param);
	}

	@Override
	public String poTechName(Map<String, String> param) throws Exception {
		return (String) client.queryForObject("language.poTechName", param);
	}

}
