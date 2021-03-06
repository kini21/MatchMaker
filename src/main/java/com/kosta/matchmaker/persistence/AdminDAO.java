package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.AdminDTO;
import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.domain.UserVO;

public interface AdminDAO {

	// 관리자 로그인
	public AdminVO login(AdminDTO dto) throws Exception;
	
	//관리자 회원가입
	public void join(AdminVO admin) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList(SearchCriteria cri) throws Exception;

	// 회원수 카운트
	public int countUser() throws Exception;

	// 회원 한명 조회
	public UserVO selectOne(String userid);

	// 회원 삭제
	public void delete(String userid);
	
	//아이디로 회원정보 받아오기

}