package global.sesoc.music.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import global.sesoc.music.dao.UserDAO;
import global.sesoc.music.vo.MusicVO;
import global.sesoc.music.vo.UserVO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	public int insert(UserVO user) {
		// TODO Auto-generated method stub
		return dao.insert(user);
	}

	public UserVO selectOne(String userid, String userpwd) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userid", userid);
		if(userpwd != null) 
			map.put("userpwd", userpwd);
		
		UserVO user = dao.selectOne(map);
		
		return user;
	}

	public int idCheck(String userid) {
		return dao.idChek(userid);
	}

	
	
}
