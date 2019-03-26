package kr.or.ddit.diagram.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.diagram.dao.DiagramDao;
import kr.or.ddit.vo.DiagramVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("diagramService")
public class DiagramServiceImpl implements DiagramService{
	
	@Autowired
	private DiagramDao dao;

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public String insertDiagram(DiagramVO diagram) throws Exception {
		return dao.insertDiagram(diagram);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public DiagramVO diagramInfo(Map<String, String> params) throws Exception {
		return dao.diagramInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<DiagramVO> diagramList(Map<String, String> params)
			throws Exception {
		return dao.diagramList(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateDiagram(DiagramVO diagram) throws Exception {
		dao.updateDiagram(diagram);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteDiagram(Map<String, String> params) throws Exception {
		dao.deleteDiagram(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int diagramCount(Map<String, String> params) throws Exception {
		return dao.diagramCount(params);
	}

}
