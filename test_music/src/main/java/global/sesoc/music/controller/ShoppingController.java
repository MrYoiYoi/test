package global.sesoc.music.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.music.service.ShoppingService;
import global.sesoc.music.service.UserService;
import global.sesoc.music.vo.MusicVO;
import global.sesoc.music.vo.SalesVO;
import global.sesoc.music.vo.UserVO;

/**
 * 쇼핑 관련 콘트롤러
 */
@Controller
public class ShoppingController {
	private static final Logger logger = LoggerFactory.getLogger(ShoppingController.class);
	
	@Autowired
	ShoppingService service;
	
	//음반 리스트
	@RequestMapping("/musiclist")
	public String bookList(Model model) {
	
		List<MusicVO> list = service.musicList(); 
		// System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "music/musiclist";
	}
	
	//음반 상세정보
	@RequestMapping(value = "/detailmusic")
	public String detailmusic(int cdnum, Model model,HttpSession session) {
		String userid = (String)session.getAttribute("loginId");
		MusicVO music = service.musicDetail(cdnum);
		
		model.addAttribute("music", music);
		
		return "music/musicdetail";
	}
	/*
	 *    @RequestMapping("/detailboard")
   public String detailboard(String userid, int cdnum, Model model, HttpSession session) {
      
      
      
      MusicVO music = dao.selectOne(cdnum);
      
      model.addAttribute("music", music);
      System.out.println(music);
      
      return "detailBoard";
   }
   
   @RequestMapping(value="/detailboard", method=RequestMethod.POST)
   public String detailboard(String userid, SalesVO sales, HttpSession session) {
      
      
      
      int result = dao.insert(sales);
      logger.info("등록 여부 : {}", result);
      
      return "redirect:buylist?userid=" + userid;
   }
	 */
	@RequestMapping("/orderlist")
	public String orderList(SalesVO orderlist,Model model, HttpSession session,
			int cdnum
			) {
		String userid = (String)session.getAttribute("loginId");
		orderlist.setUserid(userid);
		
		service.orderlist(orderlist);
		System.out.println(orderlist);
		
		return "redirect:musiclist";
	}
	
	@RequestMapping("orderitemList")
	public String orderitemList(String userid,Model model, HttpSession session) {
		
		
		List<SalesVO> list = service.orderitemList(userid);
		model.addAttribute("list", list);
		
		return "music/orderlist";
	}
	
	@RequestMapping("/rank")
	public String salesRank(Model model) {

		List<SalesVO> sales = service.salesRank();
		
		model.addAttribute("sales", sales);
		
		System.out.println(sales);
		return "music/rank";
	}
	
	
	
}











