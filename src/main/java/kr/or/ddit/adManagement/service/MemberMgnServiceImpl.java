package kr.or.ddit.adManagement.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.adManagement.dao.MemberMgnDao;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("memberMgnService")
public class MemberMgnServiceImpl implements MemberMgnService{
	@Autowired
	private MemberMgnDao dao;

	/**
	 * 작성자 - 김동영
	 * 관리자 - 클라이언트 리스트 출력	
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> clientList(Map<String, String> params) throws Exception {
		return dao.clientList(params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 프리랜서 리스트 출력	
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> freelancerList(Map<String, String> params) throws Exception {
		return dao.freelancerList(params);
	}

	@Override
	public List<MemberVO> blackList(Map<String, String> params)	throws Exception {
		return dao.blackList(params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(클라이언트) 출력	
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> cl_blackList(Map<String, String> params) throws Exception {
		return dao.cl_blackList(params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 블랙리스트(프리랜서) 출력	
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> free_blackList(Map<String, String> params) throws Exception {
		return dao.free_blackList(params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원 블랙리스트 추가(클라이언트, 프리랜서 페이지)	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void addBlack(Map<String, String> params) throws Exception {
		dao.addBlack(params);
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원 블랙리스트 제거(블랙리스트 페이지)	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void removeBlack(Map<String, String> params) throws Exception {
		dao.removeBlack(params);
		
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 탈퇴 신청자 승인	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void deleteMember(Map<String, String> params) throws Exception {
		dao.deleteMember(params);
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 숫자 카운팅	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		int totalCount = 0;
		totalCount = dao.totalCount(params);
	return totalCount;
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트) 숫자 카운팅	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int clientCount(Map<String, String> params) throws Exception {
		int clientCount = 0;
		clientCount = dao.clientCount(params);
	return clientCount;
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(프리랜서) 숫자 카운팅	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public int freelancerCount(Map<String, String> params) throws Exception {
		int freelancerCount = 0;
		freelancerCount = dao.freelancerCount(params);
	return freelancerCount;
	}
	
	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 상세 정보
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		MemberVO memberInfo = null;
		memberInfo = dao.memberInfo(params);
		return memberInfo;
	}

	/**
	 * 작성자 - 김동영
	 * 관리자 - 회원(클라이언트, 프리랜서) 정보 수정	
	 */
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	@Override
	public void updateMember(MemberVO memberInfo) throws Exception {
		dao.updateMember(memberInfo);
	}

}
