package kr.or.ddit.adManagement.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface MemberMgnService {
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 클라이언트 리스트 출력
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> clientList(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 프리랜서 리스트 출력
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> freelancerList(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(클라이언트, 프리랜서) 출력
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> blackList(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(클라이언트) 출력
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> cl_blackList(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(프리랜서) 출력
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> free_blackList(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트 등록
	 * @param params
	 * @throws Exception
	 */
	public void addBlack(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트 제거
	 * @param params
	 * @throws Exception
	 */
	public void removeBlack(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 탈퇴신청자 승인
	 * @param params
	 * @throws Exception
	 */
	public void deleteMember(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 숫자 카운팅
	 * @param params
	 * @throws Exception
	 */
	public int totalCount(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트) 숫자 카운팅
	 * @param params
	 * @throws Exception
	 */
	public int clientCount(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(프리랜서) 숫자 카운팅
	 * @param params
	 * @throws Exception
	 */
	public int freelancerCount(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 상세정보
	 * @param params
	 * @throws Exception
	 */
	public MemberVO memberInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 정보 수정
	 * @param memberInfo
	 * @throws Exception
	 */
	public void updateMember(MemberVO memberInfo) throws Exception;
	
}
