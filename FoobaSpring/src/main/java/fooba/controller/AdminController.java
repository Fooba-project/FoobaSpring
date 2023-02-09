package fooba.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fooba.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	@RequestMapping("/admin_tos")
	public String admin_tos() {
		return "admin/admin_fooba_tos";
	}
	
	@RequestMapping("/admin_privacy")
	public String admin_privacy() {
		return "admin/admin_fooba_privacy";
	}
	
	@RequestMapping("/admin_logout")
	public String admin_logout(HttpSession session) {
		session.removeAttribute("loginAdmin");
		return "admin/admin_login";
	}
	
	@RequestMapping("/admin_loginForm")
	public String admin_loginForm(HttpSession session) {
		session.removeAttribute("loginAdmin");
		return "admin/admin_login";
	}

	@RequestMapping("/admin_login")
	public String admin_login(	HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("adminid") String adminid, @RequestParam("adminpw") String adminpw) {
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("adminid", adminid);
		prm.put("rc", null);
		as.getAdmin(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("rc");
		
		if(list.size()==0) {model.addAttribute("message", "아이디가 없습니다.");
			return "admin/admin_login";
		}
		
		HashMap<String,Object> hm = list.get(0);
		if (hm.get("PWD")==null) model.addAttribute("message", "DB오류 관리자에게 문의하세요");
		else if(adminpw.equals((String)hm.get("PWD"))) {
			session.setAttribute("loginAdmin", hm);
			session.removeAttribute("message");
			return "redirect:/adminList?table=r&first=y";
		} else model.addAttribute("message", "비밀번호가 틀렸습니다.");
		return "admin/admin_loginForm";
	}
	
	
		
}	
	/*
	// 기본 프레임
	@RequestMapping("/")
	public String method(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("인수") String 인수) {
		if(session.getAttribute("loginUser")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("인수", 인수);
		prm.put("rc", null);
		as.servicemethod(hm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("rc");
		HashMap<String,Object> hm = list.get(0);
		model.addAttribute("memberList", hm);
		return "갈곳경로;
	}
	*/
	
	

