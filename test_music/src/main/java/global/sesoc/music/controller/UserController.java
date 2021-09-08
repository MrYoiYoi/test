package global.sesoc.music.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.music.service.UserService;
import global.sesoc.music.vo.UserVO;

/**
 * 회원 로그인, 로그아웃 처리 콘트롤러
 */
@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService service;
	
	@RequestMapping("/join")
	public String join() {
		return "member/join"; // forwarding 
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserVO user) {
		// DB에 저장하는 작업 필요
		int result = service.insert(user);
		
		return "redirect:/"; // GET방식으로 요청하도록 함!
	}
	// 로그인: 화면제공(GET)
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String userid, String userpwd, HttpSession session) {
		System.out.println(userid+", " +userpwd);
		
		UserVO user= service.selectOne(userid, userpwd);
		
		// member 존재하냐? 로그인할 수 있음 ==> HttpSession -> 넣기(set)/꺼내기(get)/지우기(remove, invalidate)
		if(user != null) {
			session.setAttribute("loginId",   user.getUserid());
			session.setAttribute("loginName", user.getUsername());
			return "redirect:/";
		}
		// String loginId = (String)session.getAttribute("loginId");
		return "member/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "idchek", method = RequestMethod.POST)
	@ResponseBody
	public String idchek(String userid){
		
		//logger.info("memberIdChk() 진입");
		
		
		int result = service.idCheck(userid);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	 
	} // memberIdChkPOST() 종료	
	
}
