package kr.or.ddit.fProjectNotice.service;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Project_notice_fileVO;

public interface ProjectNtcFileService {
	/**
	 * 프로젝트 공지사항 파일 정보 가져오기
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Project_notice_fileVO boardFileInfo(Map<String, String> params) throws Exception;
	/**
	 * 프로젝트 공지사항 파일 삭제
	 * @param params
	 * @return
	 * @throws Exception
	 */
	int deleteFile(Map<String, String> params) throws Exception;
	/**
	 * 파일 정보
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Project_notice_fileVO fileInfo(Map<String, String> params) throws Exception;

}
