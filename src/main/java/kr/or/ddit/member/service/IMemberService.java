package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LanguageVO;
import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	
	/**
	 * 박시찬
	 * 회원 정보조회하는 메서드
	 * 
	 */
	public MemberVO memberInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 회원의 자기소개를 추가,수정 하는 메서드
	 * 
	 */
	public void updateSelfInfo(MemberVO membervo) throws Exception;
	/**
	 * 유서진
	 * 회원가입 메서드
	 * @param memberInfo
	 * @return
	 * @throws Exception
	 */
	public int insertMember(MemberVO memberInfo) throws Exception;
	/**
	 * 전선영
	 * 클라이언트를 가져오는 메서드
	 * @param mem_id
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectClient(String mem_id) throws Exception;
	
	/**
	 * 일반회원 상태인 프리랜서의 수를 가져오는 메서드
	 */
	public int countFree(Map<String, String> params) throws Exception;
	
	/**
	 * 유서진
	 * 일반 회원 상태인 프리랜서의 정보 리스트를 가져오는 메서드
	 * @param params
	 * @throws Exception
	 */
	public List<MemberVO> freeList(Map<String, String> params) throws Exception;
	
	/**
	 * 박시찬
	 * 회원의 자기소개가 있는지 체크하는 메서드
	 * 
	 */
	public String selfInfoCheck(Map<String, String> mem_id) throws Exception;

	public int totalCountFree() throws Exception;  

	/**
	 * 유서진
	 * 일반 회원 리스트의 보유기술 띄우는 메서드
	 * @param params
	 * @throws Exception
	 */
	public List<LanguageVO> repreTech(Map<String, String> params) throws Exception;
	/**
	 * 박시찬
	 * 회원 프로필 사진을 업로드하는 메서드
	 */
	public void insertMemPic(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 회원 프로필 사진을 삭제하는 메서드
	 * @return 
	 */
	public int deleteMemPic(Map<String, String> param) throws Exception;
	
	/**
	 * 박시찬
	 * 회원이 클라이언트인지 프리랜서인지 구분하는 메서드
	 */
	public int checkIden(Map<String, String> params) throws Exception;

	public List<MemberVO> reMember() throws Exception;

	public void updateLogin(Map<String, String> params) throws Exception;

	public void updateLogout(Map<String, String> params) throws Exception;
}