package kr.or.ddit.project.dao;

import java.util.Map;

import kr.or.ddit.vo.Portfolio_fileVO;
import kr.or.ddit.vo.Project_fileVO;

public interface ProjectFileDao {
	/**
	 * 전선영
	 * 프로젝트 파일을 추가하는 메서드
	 */
	public void insertFile(Project_fileVO pr_file) throws Exception;

	public Project_fileVO fileInfo(Map<String, String> params) throws Exception;
}
