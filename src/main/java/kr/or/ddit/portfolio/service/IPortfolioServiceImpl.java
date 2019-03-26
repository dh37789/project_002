package kr.or.ddit.portfolio.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.portfolio.dao.IPortfolioDao;
import kr.or.ddit.vo.PortfolioVO;
import kr.or.ddit.vo.Portfolio_file_joinVO;

@Service("portfolioService")
public class IPortfolioServiceImpl implements IPortfolioService{
	@Autowired
	private IPortfolioDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<PortfolioVO> portfolioList(Map<String, String> mem_id) throws Exception {
		return dao.portfolioList(mem_id);
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public PortfolioVO portfolioInfo(Map<String, String> mem_id) throws Exception {
		return dao.portfolioInfo(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updatePortfolio(PortfolioVO portfolioVO) throws Exception {
		dao.updatePortfolio(portfolioVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void insertPortfolio(PortfolioVO portfolioVO) throws Exception {
		dao.insertPortfolio(portfolioVO);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int deletePortfolio(Map<String, String> mem_id) throws Exception {
		return dao.deletePortfolio(mem_id);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateRepre(Map<String, String> param) throws Exception {
		return dao.updateRepre(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int updateTotalRepre(Map<String, String> param) throws Exception {
		return dao.updateTotalRepre(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<PortfolioVO> checkRepre(Map<String, String> param)
			throws Exception {
		return dao.checkRepre(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public Portfolio_file_joinVO portfolioInfoJoin(Map<String, String> po_num)
			throws Exception {
		return dao.portfolioInfoJoin(po_num);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String poTech(Map<String, String> param) throws Exception {
		return dao.poTech(param);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public String poTechName(Map<String, String> param) throws Exception {
		return dao.poTechName(param);
	}

}
