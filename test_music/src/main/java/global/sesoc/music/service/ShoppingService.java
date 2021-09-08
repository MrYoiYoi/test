package global.sesoc.music.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.sesoc.music.dao.ShoppingDAO;
import global.sesoc.music.vo.MusicVO;
import global.sesoc.music.vo.SalesVO;

@Service
public class ShoppingService {
	
	@Autowired
	ShoppingDAO dao;
	
	public List<MusicVO> musicList() {
		
		List<MusicVO> list = dao.musicList();
		
		return list;
		
	}

	public MusicVO musicDetail(int cdnum) {
		
		MusicVO music = dao.musicDetail(cdnum);
		return music;
	}

	public int orderlist(SalesVO orderlist) {
		int result = dao.orderlist(orderlist);
		
		System.out.println(result);
		
		return result;
	}

	public List<SalesVO> orderitemList(String userid) {
		List<SalesVO> list = dao.orderitemList(userid);
		
		return list;
	}

	public List<SalesVO> salesRank() {
		List<SalesVO> sales = dao.salesRank();
		return sales;
	}
	
	
}
