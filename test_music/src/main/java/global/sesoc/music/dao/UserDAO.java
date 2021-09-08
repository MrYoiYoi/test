package global.sesoc.music.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.music.vo.UserVO;

/**
 * 회원 관련 DAO
 */
@Repository
public class UserDAO {
	
	@Autowired
	SqlSession session;

	public int insert(UserVO user) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result=0;
		try {
			result = mapper.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public UserVO selectOne(Map<String, String> map) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		UserVO user = null;
		
		
		try {
			user = mapper.selectOne(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	public int idChek(String userid) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.idCheck(userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
