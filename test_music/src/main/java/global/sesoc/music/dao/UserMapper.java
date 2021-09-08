package global.sesoc.music.dao;

import java.util.Map;

import global.sesoc.music.vo.UserVO;

/**
 * 회원 관련 Mybatis 사용 메서드
 */
public interface UserMapper {

	public int insert(UserVO user) throws Exception;

	public UserVO selectOne(Map<String, String> map) throws Exception;

	public int idCheck(String userid) throws Exception;
}
