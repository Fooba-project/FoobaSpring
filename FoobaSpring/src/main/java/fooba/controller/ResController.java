package fooba.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fooba.service.ResService;

@Controller
public class ResController {
	
	@Autowired
	ResService rs;
	
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
	
	@RequestMapping("/res_loginForm")
	public String res_loginForm(HttpSession session) {
		if(session.getAttribute("loginRes")!=null) return "redirect:/res_foodmenu";
		return "restaurant/res_login";
	}
	
	@RequestMapping(value="/res_login",method=RequestMethod.POST)
	public String res_login(@RequestParam("rid") String rid,@RequestParam("rpwd")String rpwd,
			 BindingResult result, HttpSession session, Model model) { 
		
		String url="restaurant/res_login"; 
		if(result.getFieldError("rid")!=null)
			model.addAttribute("message",result.getFieldError("rid").getDefaultMessage());
		else if(result.getFieldError("rpwd")!=null)
			model.addAttribute("message",result.getFieldError("rpwd").getDefaultMessage());
		else {

			HashMap<String,Object>paramMap=new HashMap<String,Object>();
			paramMap.put("rid",rid);
			paramMap.put("ref_cursor",null);
			
			rs.getRes(paramMap);
		
			ArrayList<HashMap<String,Object>> list
			=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			
			if(list.size()==0) {
				model.addAttribute("message","아이디가 없습니다.");
				return "restaurant/res_login";
			}
			HashMap<String,Object>rvo=list.get(0);
			if(!rvo.get("RPWD").equals(rpwd))
				model.addAttribute("message","비번이 틀립니다.");
			else if(rvo.get("RYN").equals("0")) 
				model.addAttribute("message","휴면계정입니다 관리자에게 문의하세요!");
			else if(rvo.get("RPWD").equals(rpwd)) {
				session.setAttribute("loginRes",rvo);
				url="redirect:/res_foodmenu";
				
				paramMap.put("rseq",rvo.get("RSEQ"));
				rs.starAvg(paramMap);
				session.setAttribute("intstar",paramMap.get("intstar")); //별 개수
				session.setAttribute("doublestar",paramMap.get("doublestar")); //별점(소수점까지)
				/**/
				session.removeAttribute("message");
				
			}			
		}
		return url;
	}
	
	@RequestMapping(value="/res_logout")
	public String res_logout(HttpSession session) {
		session.removeAttribute("loginRes");
		session.removeAttribute("intstar");
		session.removeAttribute("doublestar");
		return "redirect:/res_loginForm";
	}
	
	@RequestMapping("/res_FindIdForm")
	public String res_FindIdForm() {
		return"restaurant/res_FindId";
	}
	
	@RequestMapping(value="res_FindId",method=RequestMethod.POST)
	public String res_FindId(@RequestParam("rname")String rname,@RequestParam("rphone")String rphone,Model model) {
		HashMap<String,Object>paramMap=new HashMap<String,Object>();
		paramMap.put("rname",rname);
		paramMap.put("ref_cursor",null);
		
		rs.resFindId(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		if(list.size()==0) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "redirect:/res_FindIdForm";
		}
		HashMap<String,Object> rvo=list.get(0);
		if(!rvo.get("RPHONE").equals(rphone)) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "redirect:/res_FindIdForm";
		}
		else {
			model.addAttribute("message","귀하의 아이디는 '"+rvo.get("ID")+"'입니다.");
			return "redirect:/res_loginForm";
		}
	}
	
	@RequestMapping("/res_FindPwForm")
	public String res_FindPwForm() {
		return"restaurant/res_FindPw";
	}
	
	@RequestMapping(value="res_FindPw",method=RequestMethod.POST)
	public String res_FindPw(@RequestParam("rname")String rname,@RequestParam("rphone")String rphone,
			@RequestParam("rid")String rid,Model model) {
		HashMap<String,Object>paramMap=new HashMap<String,Object>();
		paramMap.put("rid",rid);
		paramMap.put("ref_cursor",null);
		rs.getRes(paramMap);
		
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		if(list.size()==0) {
			model.addAttribute("message","아이디가 없습니다.");
			return "redirect:/res_FindPwForm";
		}
		HashMap<String,Object> rvo=list.get(0);
		if(!rvo.get("RPHONE").equals(rphone)||!rvo.get("RNAME").equals(rname)) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "redirect:/res_FindPwForm";
		}
		else {
			model.addAttribute("message","귀하의 비밀번호는 '"+rphone+"'로 전송되었습니다.");
			return "redirect:/res_loginForm";
		}
		
		
	}
	
	
	
	
}
