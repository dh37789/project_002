package kr.or.ddit.fProjectNotice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Project_noticeVO;

public interface ProjectNtcService {
	/**
	 * 현재 진행중인 프로젝트의 공지사항 리스트
	 * @param params
	 * @return
	 */
	List<Project_noticeVO> boardList(Map<String, String> params) throws Exception;
	/**
	 * 프로젝트 공지사항 insert
	 * @param boardInfo
	 * @throws Exception
	 */
	void insertNtc(Project_noticeVO boardInfo) throws Exception;
	/**
	 * 프로젝트 공지사항 View
	 * @param params
	 * @return
	 * @throws Exception
	 */
	Project_noticeVO boardInfo(Map<String, String> params) throws Exception;
	/**
	 * 공지사항 삭제
	 * @param params
	 * @throws Exception
	 */
	void deleteNtc(Map<String, String> params) throws Exception;
	/**
	 * 공지사항 수정
	 * @param boardInfo
	 * @throws Exception
	 */
	void updateNtc(Project_noticeVO boardInfo) throws Exception;
	/**
	 * 공지사항 수
	 * @param params
	 * @return
	 */
	int boardCount(Map<String, String> params) throws Exception;
}
