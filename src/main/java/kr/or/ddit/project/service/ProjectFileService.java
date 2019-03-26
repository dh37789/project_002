package kr.or.ddit.project.service;

import java.util.Map;

import kr.or.ddit.vo.Project_fileVO;

public interface ProjectFileService {
	Project_fileVO fileInfo(Map<String, String> params) throws Exception;
}
