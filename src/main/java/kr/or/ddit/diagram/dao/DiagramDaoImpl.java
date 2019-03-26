package kr.or.ddit.diagram.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DiagramVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("diagramDao")
public class DiagramDaoImpl implements DiagramDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertDiagram(DiagramVO diagram) throws Exception {
		return (String) client.insert("diagram.insertDiagram", diagram);
	}

	@Override
	public DiagramVO diagramInfo(Map<String, String> params) throws Exception {
		return (DiagramVO) client.queryForObject("diagram.diagramInfo", params);
	}

	@Override
	public List<DiagramVO> diagramList(Map<String, String> params)
			throws Exception {
		return client.queryForList("diagram.diagramList", params);
	}

	@Override
	public void updateDiagram(DiagramVO diagram) throws Exception {
		client.update("diagram.updateDiagram", diagram);
	}

	@Override
	public void deleteDiagram(Map<String, String> params) throws Exception {
		client.update("diagram.deleteDiagram", params);
	}

	@Override
	public int diagramCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("diagram.diagramCount", params);
	}
}
