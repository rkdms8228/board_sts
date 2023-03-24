package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.UserService;
import com.web.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	//회원가입폼
	@GetMapping("/joinForm")
	public String joinForm() {
		
		return "/user/joinForm";
		
	}
	
	//회원가입
	@PostMapping("/join")
	public String join() {
		
		//코드 작성 예정
		
		return "/user/joinOk";
		
	}
	
	//회원가입
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String id) {
		
		String idCheck = userService.idCheck(id);
		
		return idCheck;
		
	}
	
	//회원가입 성공(화면 확인용 테스트)
	@GetMapping("/joinOk")
	public String joinOk() {
		
		return "/user/joinOk";
		
	}
	
	//로그인폼
	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "/user/loginForm";
		
	}
	
	//로그인
	@PostMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) throws Exception{

		userVo = userService.login(userVo);
		
		/* 세션에 로그인 회원 정보 저장 */
		if(userVo != null) {
			session.setAttribute("authUser", userVo);
			return "redirect:/main";
		}else {
			return "/user/loginForm";
		}

	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(@ModelAttribute UserVo userVo, HttpSession session) {
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/main";
		
	}

}
