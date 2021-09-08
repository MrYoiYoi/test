package global.sesoc.music.dao;

import java.util.ArrayList;
import java.util.List;

import global.sesoc.music.vo.MusicVO;
import global.sesoc.music.vo.SalesVO;

/**
 * 쇼핑 관련 Mybatis 사용 메서드
 */
public interface ShoppingMapper {

	public List<MusicVO> selectAll() throws Exception;

	public MusicVO detailMusic(int cdnum) throws Exception;

	public int orderlist(SalesVO orderlist) throws Exception;

	public List<SalesVO> orderitemList(String userid) throws Exception;

	public List<SalesVO> salesRank() throws Exception;
}
