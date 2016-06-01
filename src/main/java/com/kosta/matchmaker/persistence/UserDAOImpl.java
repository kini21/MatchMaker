package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mapper.UserMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void join(UserVO user) throws Exception {
		//아이디가 겹치지 않으면 이 if문에 걸려서 user등록됨
		if(userIdCheck(user.getUserid())==1){
			session.insert(namespace + ".join", user);
		}
	}

	@Override
	public List<UserVO> selectList() throws Exception {
		List<UserVO> list = session.selectList(namespace + ".selectList");
		return list;
	}

	@Override
	public UserVO selectOne(String userid, String userpw) {

		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		UserVO user = session.selectOne(namespace + ".selectOne", map);

		return user;
	}

	@Override
	public void update(UserVO user) {
		session.update(namespace + ".update", user);
	}

	@Override
	public void delete(String userid, String userpw) {

		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		session.delete(namespace + ".delete", map);
	}

	@Override
	public UserVO selectId(String userid) {

		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);

		UserVO user = session.selectOne(namespace + ".selectId", map);

		return user;
	}

	@Override
	public int userIdCheck(String userid) {
		List<UserVO> list = session.selectList(namespace + ".selectList");
		
		for(UserVO user : list) {
		
			if(userid.equals(user.getUserid())){
				return 0;//중복 아이디 있음
			}
				
		}
		return 1;//중복 아이디 없음
	}

}
