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
		if(session.getAttribute("loginUser")==null) return "redirect:/login"; // 로그인체크

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
	
	@RequestMapping("/index")
	public String index() {
		return "main";
	}
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		return "member/memberLogin";
	}
	
	 @RequestMapping(value="login", method=RequestMethod.POST)
	   public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, 
	         HttpServletRequest request, Model model) {
	      
	      String url = "member/memberLogin";
	      if(result.getFieldError("id")!=null)
	         model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
	      else if (result.getFieldError("pwd")!=null)
	         model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
	      else {
	         HashMap<String, Object> paramMap = new HashMap<String, Object>();
	         paramMap.put("id", membervo.getId());
	         paramMap.put("ref_cursor", null);
	         
	         ms.getMember(paramMap);
	         
	         ArrayList<HashMap<String,Object>> list 
	         = (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
	         //System.out.println(list.get(0).get("ID"));
	         if(list==null) {	
	            model.addAttribute("message","아이디가 없습니다.");
	            return "member/memberLogin";   
	         }
	         HashMap<String, Object> mvo = list.get(0);
	         if(!mvo.get("PWD").equals(membervo.getPwd()))
	            model.addAttribute("message","비번이 안맞습니다.");
	         else if (mvo.get("PWD").equals(membervo.getPwd())) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginUser", mvo);
	            url = "redirect:/";
	         }	   
	      }
	      return url;
	 }
	
}
