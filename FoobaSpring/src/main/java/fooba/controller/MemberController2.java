package fooba.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fooba.dto.MemberVO;
import fooba.service.MemberService2;

@Controller
public class MemberController2 {
	
	@Autowired
	MemberService2 ms;
	
	/*
	// 기본 프레임
	@RequestMapping("/")
	public String method(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("인수1") String 인수1) {
		if(session.getAttribute("loginUser")==null) 
		return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("인수1", 인수1);
		prm.put("rc", null);
		ms.servicemethod(hm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("rc");
		HashMap<String,Object> hm = list.get(0);
		model.addAttribute("memberList", hm);
		return "갈곳경로;
	}
	*/
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/memberLogin";
	}
	
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	   public String login(@ModelAttribute("dto") @Valid MemberVO mvo, 
			   BindingResult result, HttpSession session, Model model) {
	      
	      String url = "member/memberLogin";
	      if(result.getFieldError("id")!=null)
	         model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
	      else if (result.getFieldError("pwd")!=null)
	         model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
	      else {
	         HashMap<String, Object> prm = new HashMap<>();
	         prm.put("id", mvo.getId());
	         prm.put("ref_cursor", null);
	         
	         ms.getMember(prm);
	         
	         ArrayList<HashMap<String,Object>> list 
	         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
	         if(list.size()==0) {	
	            model.addAttribute("message","아이디가 없습니다.");
	            return "member/memberLogin";   
	         }
	         HashMap<String, Object> hvo = list.get(0);
	         if(!hvo.get("PWD").equals(mvo.getPwd()))
	            model.addAttribute("message","비번이 안맞습니다.");
	         else if (hvo.get("PWD").equals(mvo.getPwd())) {
	            session.setAttribute("loginUser", hvo);
	            url = "redirect:/";
	         }	   
	      }
	      return url;
	 }
	
	 @RequestMapping("/logout")
	 public String logout(HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 session.removeAttribute("loginUser");
		 return "redirect:/";
	 }
	 
	 @RequestMapping("/miniLoginForm")
	 public String mini_login_form( HttpServletRequest request) {
		 if(request.getParameter("check")==null)
			 request.setAttribute("message", "로그인이 필요합니다.");
		 return "member/memberMiniLogin";
	 }
	 
	 @RequestMapping("/miniLogin")
	 public String miniLogin(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, 
	         HttpServletRequest request, Model model,
	         @RequestParam("fseq") String fseq) {
		 
		 String url="member/memberMiniLogin";
		 
		 model.addAttribute("check", "1");
		 
		 if(result.getFieldError("userid")!=null)
	         model.addAttribute("message", result.getFieldError("userid").getDefaultMessage());
	      else if (result.getFieldError("userpw")!=null)
	         model.addAttribute("message", result.getFieldError("userpw").getDefaultMessage());
	      else {
	         HashMap<String, Object> paramMap = new HashMap<String, Object>();
	         paramMap.put("userid", membervo.getId());
	         paramMap.put("ref_cursor", null);
	         
	         ms.getMember(paramMap);
	         
	         ArrayList<HashMap<String,Object>> list 
	         = (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
	         if(list==null) {	
	            model.addAttribute("message","아이디가 없습니다.");
	            return "member/memberLogin";   
	         }
	         HashMap<String, Object> mvo = list.get(0);
	         if(!mvo.get("USERPW").equals(membervo.getPwd()))
	            model.addAttribute("message","비번이 안맞습니다.");
	         else if (mvo.get("USERPW").equals(membervo.getPwd())) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginUser", mvo);
	            url = "redirect:/";
	         }	   	 
	      }
		 return url;
	 }
	 
	 @RequestMapping("/")
	 
}
