package com.kosta.matchmaker.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.mail.MailSend;
import com.kosta.matchmaker.mail.RandomString;
import com.kosta.matchmaker.service.UserService;

import net.tanesha.recaptcha.ReCaptchaResponse;

@Controller
@RequestMapping("/users")
public class UserController {

	@Inject
	private UserService service;
	
	/*선수 가입 폼 가져오기*/
	@RequestMapping(value = "/playerForm")
	public void playerForm() {}
	
	/*로그인 페이지로 이동*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet() {}
	
	/*로그인*/
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, Model model, RedirectAttributes rttr) throws Exception{
		
		UserVO user = service.login(dto);
		
		if(user == null){
			return;
		}
		model.addAttribute("userVO", user);
	}
	
	/*프로파일 페이지로 이동*/
	@RequestMapping(value = "/{userid}", method=RequestMethod.GET)
	public String getProfile(Model model, @PathVariable("userid") String userid, Criteria cri) throws Exception {
		
		model.addAttribute("list", service.articleList(userid, cri));
		model.addAttribute("user", service.selectUser(userid));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.articleCount(userid));
		model.addAttribute("pageMaker", pageMaker);
		
		return "users/profile";
	}
	
	/*회원가입 페이지로 이동*/ 
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void joinGet() throws Exception {}
	
	/*회원가입*/
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String joinPost(RedirectAttributes rttr, UserVO user) throws Exception {
	
		service.join(user);
		rttr.addFlashAttribute("result", "joinSuccess");
			
		return "redirect:/";
	}
	
	/*선수 정보 가입*/
	@RequestMapping(value = "/playerJoin", method=RequestMethod.POST)
	public String playerJoin(RedirectAttributes rttr, PlayerVO player) throws Exception {
	
		service.playerJoin(player);
		rttr.addFlashAttribute("result", "joinSuccess");
			
		return "redirect:/";
	}
	
	/*아이디 중복 확인*/
	@ResponseBody
	@RequestMapping(value = "/join/idCheck", method=RequestMethod.POST)
	public String idCheck(RedirectAttributes rttr, @RequestParam("userid") String userid) throws Exception{

		int result = service.userIdCheck(userid);
		
		if(result == 1){
			return "idCheckSuccess";
		}else{ 
			return "idCheckFail";
		}
	}
	
	//캡차
	@RequestMapping(value = "/recapcha", method=RequestMethod.GET)
	public void validateRecaptcha() throws Exception {}
	
	@ResponseBody
	@RequestMapping(value = "/validateRecaptcha", method = RequestMethod.POST)
	public String validateRecaptcha(@RequestParam Map<String, String> paramMap) {
	    
		service.reCaptcha();
		
	    String check = "";
	    String host = paramMap.get("host");
	    String challenge = paramMap.get("challenge");
	    String res = paramMap.get("response");
	    
	    ReCaptchaResponse reCaptchaResponse = service.reCaptcha().checkAnswer(host, challenge, res);
	 
	    if (reCaptchaResponse.isValid()) {
	        check = "Y";
	    } else {
	        check = "N";
	    }
	     
	    return check;
	}
	
	//로그 아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, @RequestParam("result") String result, RedirectAttributes rttr) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("login") !=null){
			session.removeAttribute("login");
			session.invalidate();
		}
		rttr.addFlashAttribute("result", result);
		
		return "redirect:/";
	}

	//비밀번호 확인 페이지
	@RequestMapping(value = "/lock", method=RequestMethod.GET)
	public void checkPw() throws Exception {}
	
	//비밀번호 확인
	@RequestMapping(value = "/lock", method=RequestMethod.POST)
	public String checkPw(LoginDTO dto, RedirectAttributes rttr) throws Exception {
		if(service.login(dto) != null) {
			return "redirect:/users/update";
		}
		rttr.addFlashAttribute("fail", "FAIL");
		
		return "redirect:/users/lock";
	}
	
	//회원 정보 수정, 탈퇴 페이지
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public void updateGet() throws Exception {}
	
	//회원 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(UserVO user, RedirectAttributes rttr) throws Exception{
		service.update(user);
		rttr.addFlashAttribute("result", "updatesuccess");
		
		return "redirect:/users/profile";
	}
	
	//회원 탈퇴
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String deletePost(UserVO user, RedirectAttributes rttr) throws Exception{
			service.delete(user.getUserid());
			
			rttr.addAttribute("result", "deletesuccess");
			
			return "redirect:/users/logout";
		}
	
	//회원 인증(비밀번호 바꾸기전에 이전 비밀번호 확인)
	@ResponseBody
	@RequestMapping(value = "/update/authCheck", method=RequestMethod.POST)
	public String authCheck(RedirectAttributes rttr, @RequestParam("userid") String userid,
					@RequestParam("userpw") String userpw) throws Exception{
		int result = service.userAuth(userid, userpw);
		if(result == 1){
			return "authchecksuccess";
		}else{ 
			return "authcheckfail";
		}
		
	}
	
	//비밀번호 찾기
		@RequestMapping(value = "/findPassword", method =RequestMethod.GET)
		public String findPassword(){
			return "users/findPassword";
		}
		
		@ResponseBody
		@RequestMapping(value = "/findPassword/auth", method = RequestMethod.POST)
		public String findPasswordAuth(@RequestParam("username") String username,@RequestParam("userid") String userid, 
				@RequestParam("email") String email) throws Exception{
			
			UserVO user = service.findPassword(username, userid, email);
			if(user !=null){
				RandomString random = new RandomString();
				String newPass = random.RandumPass(6);
				
				MailSend mailsend = new MailSend();
				mailsend.sendMail(email, newPass);

				System.out.println(email);
				System.out.println(newPass);
				
				user.setUserpw(newPass);
				service.update(user);
				
				
				return "success";
			}
			return "fail";
		}
		
		
		//아이디 찾기
		@RequestMapping(value = "/findId", method =RequestMethod.GET)
		public String findId(){
			return "users/findId";
		}
		
		//아이디 찾기
		@ResponseBody
		@RequestMapping(value = "/findId/auth", method = RequestMethod.POST)
		public String findIdAuth(@RequestParam("username") String username, @RequestParam("email") String email) throws Exception{
			
			UserVO user = service.findId(username, email);
			
			if(user !=null){
				return user.getUserid();
			}
			return "fail";
			
		}
	
}
