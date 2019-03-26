package kr.or.ddit.diagram.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DiagramVO;

public interface DiagramDao {

	String insertDiagram(DiagramVO diagram) throws Exception;

	DiagramVO diagramInfo(Map<String, String> params) throws Exception;

	List<DiagramVO> diagramList(Map<String, String> params) throws Exception;

	void updateDiagram(DiagramVO diagram) throws Exception;

	void deleteDiagram(Map<String, String> params) throws Exception;

	int diagramCount(Map<String, String> params) throws Exception;

}
