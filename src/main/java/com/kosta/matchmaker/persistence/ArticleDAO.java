package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.FreeBoardVO;
import com.kosta.matchmaker.domain.NoticeBoardVO;
import com.kosta.matchmaker.domain.ReferenceBoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;

public interface ArticleDAO {

	// 게시글 타입 가져오기 
	public String getType(Integer ano, Integer bno) throws Exception;
	
	// 게시글 마지막 번호 가져오기
	public Integer lastAno(int bno) throws Exception;

	
	
	// 게시글 등록(create)
	public void create(ArticleVO board) throws Exception;
	
	// 자유 게시글 등록
	public void freeCreate(ArticleVO board) throws Exception;
	
	// 공지 게시글 등록
	public void noticeCreate(ArticleVO board) throws Exception;
	
	// 자료 게시글 등록
	public void referenceCreate(ArticleVO board) throws Exception;
	
	
	
	// 게시글 읽기 (전체목록 read)
	public List<ArticleVO> readAll(Integer bno) throws Exception;
	
	// 검색 결과 
	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception;

	// 검색 결과 개수
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	// 자유 게시글 조회(selectOne)
	public FreeBoardVO freeOne(Integer bno, Integer ano) throws Exception;

	// 공지 게시글 조회
	public NoticeBoardVO noticeOne(Integer bno, Integer ano) throws Exception;
	
	// 자료 게시글 조회
	public ReferenceBoardVO referenceOne(Integer bno, Integer ano) throws Exception;	
	
	
	
	
	// 게시글 수정(update)
	public void update(ArticleVO board) throws Exception;
	
	// 자유 게시글 수정
	public void freeUpdate(Integer bno, Integer ano) throws Exception;
	
	// 공지 게시글 수정
	public void noticeUpdate(Integer bno, Integer ano) throws Exception;
	
	// 자료 게시글 수정
	public void referenceUpdate(Integer bno, Integer ano) throws Exception;
	

	
	
	// 게시글 삭제(delete)
	public void delete(Integer bno, Integer ano) throws Exception;
	
	


	// 리플라이 카운터
	public void updateReplyCnt(Integer ano, int amount) throws Exception;

	// 조회수
	public void updateHit(Integer bno, Integer ano) throws Exception;

	// 첨부파일
	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer ano) throws Exception;

	// 첨부파일 삭제
	public void deleteAttach(Integer ano) throws Exception;

	// 첨부파일 수정
	public void replaceAttach(String fullName, Integer ano) throws Exception;

	// 게시판 구분 메서드
	public void selectBoard(Integer bno) throws Exception;

}
