package com.kosta.matchmaker.persistence;


import java.util.List;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.MessageVO;

public interface MessageDAO {

	//쪽지 보내기
	public void create(MessageVO vo) throws Exception;

	//전체 쪽지 read
	public List<MessageVO> readAll() throws Exception;
	
	//해당되는 아이디만 read
	public List<MessageVO> idReadAll(String targetid,int page) throws Exception;

	//쪽지 한개씩 읽기(쪽지 조회)
	public MessageVO readOne(Integer mno) throws Exception;
	
	//쪽지 삭제
	public void delete(Integer mno) throws Exception;
	
	//첫 쪽지 읽은 시간(opendate) 업데이트
	public void updateDate(Integer mno) throws Exception;
	
	//쪽지 개수 확인
	public int messageCount (String targetid) throws Exception;
	
	//페이징 처리
	public List<MessageVO> idReadListCriteria(String targetid, Criteria cri) throws Exception;
	
	//읽지 않은 쪽지 목록
	public List<MessageVO> notReadMessage(String targetid) throws Exception;
	
	//읽지않은 쪽지 확인
	public int notReadMessageCount (String targetid) throws Exception;
	
}
