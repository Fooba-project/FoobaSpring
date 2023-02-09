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

import fooba.dto.Paging;
import fooba.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	@RequestMapping("/")
	public String main() {
		System.out.println(1);
		return "redirect:/admin_loginForm";
	}
	
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
			@RequestParam("adminId") String adminId, @RequestParam("adminPw") String adminPw) {
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("adminId", adminId);
		prm.put("ref_cursor", null);
		as.getAdmin(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		
		if(list.size()==0) {model.addAttribute("message", "아이디가 없습니다.");
			return "admin/admin_login";
		}
		
		HashMap<String,Object> hm = list.get(0);
		if (hm.get("PWD")==null) model.addAttribute("message", "DB오류 관리자에게 문의하세요");
		else if(adminPw.equals((String)hm.get("PWD"))) {
			session.setAttribute("loginAdmin", hm);
			session.removeAttribute("message");
			return "redirect:/adminList?table=r&first=y";
		} else model.addAttribute("message", "비밀번호가 틀렸습니다.");
		return "admin/admin_loginForm";
	}
	
	
	@RequestMapping("/adminList")
	public String adminList(HttpServletRequest request, HttpSession session, Model model, @RequestParam("table") String table) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("table", table);
		prm.put("request", request);
		prm.put("ref_cursor", null);
		as.adminList(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("paging", (Paging)prm.get("paging"));
		model.addAttribute("key", (String)prm.get("key"));
		if(table.equals("r")) { 
			model.addAttribute("resList", list);
			return "admin/admin_reslist";
		} else if(table.equals("o")) {
			model.addAttribute("orderList", list);
			return "admin/admin_orderlist";
		} else if(table.equals("m")) {
			model.addAttribute("memberList", list);
			return "admin/admin_memlist";
		} else if(table.equals("q")) {
			model.addAttribute("qnaList", list);
			return "admin/admin_qnalist";
		} else {
			model.addAttribute("bannerList", list);
			return "admin/admin_bannerlist";
		}
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
	
	

