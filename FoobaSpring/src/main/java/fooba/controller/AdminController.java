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
import org.springframework.web.bind.annotation.RequestParam;

import fooba.dto.Paging;
import fooba.dto.QnaVO;
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
			@RequestParam("adminId") String adminId, @RequestParam("adminPw") String adminPw) {
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("adminId", adminId);
		prm.put("ref_cursor", null);
		as.getAdmin(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		
		if(list.size()==0) {
			model.addAttribute("message", "아이디가 없습니다.");
			return "admin/admin_login";
		}
		
		HashMap<String,Object> hm = list.get(0);
		if (hm.get("PWD")==null) model.addAttribute("message", "DB오류 관리자에게 문의하세요");
		else if(adminPw.equals((String)hm.get("PWD"))) {
			session.setAttribute("loginAdmin", hm);
			session.removeAttribute("message");
			return "redirect:/adminList?table=r&first=y";
		} else model.addAttribute("message", "비밀번호가 틀렸습니다.");
		return "admin/admin_login";
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
	
	
	@RequestMapping("/admin_resOx")
	public String admin_restaurantOk(	HttpSession session, @RequestParam("ox") int ox, @RequestParam("rseq") int rseq) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ox", ox);
		prm.put("rseq", rseq);
		as.admin_resOx(prm);
		return "redirect:/adminList?table=r";
	}
	
	
	@RequestMapping("/admin_orderLR")
	public String admin_orderLR(	HttpSession session, @RequestParam("result") int result, @RequestParam("oseq") int oseq) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("result", result);
		prm.put("oseq", oseq);
		as.admin_orderLR(prm);
		return "redirect:/adminList?table=o";
	}
	
	
	@RequestMapping("/admin_qnaWriteForm")
	public String admin_qnaWriteForm(HttpSession session) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
			return "admin/admin_qnaWrite";
	}
	
	
	
	@RequestMapping("/adminQna")
	public String admin_qnaWrite(@ModelAttribute("vo") @Valid QnaVO qvo, BindingResult result, HttpSession session, Model model, @RequestParam("procedure") String procedure) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		String url = "admin/admin_qnaWrite";
		if(procedure.equals("update")) url = "admin/admin_qnaUpdate";
		
		if(!procedure.equals("delete") && result.getFieldError("SUBJECT")!=null)
			model.addAttribute("message",result.getFieldError("SUBJECT").getDefaultMessage());
		else if(!procedure.equals("delete") && result.getFieldError("CONTENT")!=null)
			model.addAttribute("message",result.getFieldError("CONTENT").getDefaultMessage());
		else {
			System.out.println("1");
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("procedure", procedure);
			prm.put("qvo", qvo);
			as.adminQna(prm);
			if(procedure.equals("update")) url = "redirect:/adminDetail?procedure=qna&seq="+qvo.getQSEQ();
			else url = "redirect:/adminList?table=q";
		}
		return url;
	}
	
	
	@RequestMapping("/adminDetail")
	public String adminDetail(HttpSession session, Model model,
			@RequestParam("procedure") String procedure, @RequestParam("seq") int seq
			) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("procedure", procedure);
		prm.put("seq", seq);
		prm.put("ref_cursor", null);
		as.adminDetail(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object> vo = list.get(0);
		model.addAttribute("vo", vo);
		
		if (procedure.equals("res")) return "admin/admin_resDetail";
		if (procedure.equals("qnaUp")) return "admin/admin_qnaUpdate";
		else return "admin/admin_qnaDetail";
	}
	
}	

	
	

