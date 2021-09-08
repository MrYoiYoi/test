package global.sesoc.music.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.music.vo.MusicVO;
import global.sesoc.music.vo.SalesVO;

/**
 * 쇼핑 관련 DAO
 */
@Repository
public class ShoppingDAO {
	
	@Autowired
	SqlSession session;
	
	
	public List<MusicVO> musicList() {
	
		ShoppingMapper mapper = session.getMapper(ShoppingMapper.class);
		
		List<MusicVO> list = null;
		
		try {
			list = mapper.selectAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	public MusicVO musicDetail(int cdnum) {
		ShoppingMapper mapper = session.getMapper(ShoppingMapper.class);
		
		MusicVO music = null;
		
		try {
			music = mapper.detailMusic(cdnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return music;
	}


	public int orderlist(SalesVO orderlist) {
		ShoppingMapper mapper = session.getMapper(ShoppingMapper.class);
		int result = 0;
		
		try {
			result = mapper.orderlist(orderlist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}


	public List<SalesVO> orderitemList(String userid) {
		ShoppingMapper mapper = session.getMapper(ShoppingMapper.class);
		List<SalesVO> list = null;
		
		try {
			list = mapper.orderitemList(userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


	public List<SalesVO> salesRank() {
		ShoppingMapper mapper = session.getMapper(ShoppingMapper.class);
		List<SalesVO> s = null;
		try {
			s = mapper.salesRank();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
	}
	
}
