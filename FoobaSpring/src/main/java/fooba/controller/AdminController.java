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
	public String admin_login(	HttpSession session, Model model,
			@RequestParam("ADMINID") String ADMINID, @RequestParam("ADMINPW") String ADMINPW) {
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ADMINID", ADMINID);
		prm.put("ref_cursor", null);
		as.getAdmin(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		
		if(list.size()==0) model.addAttribute("message", "아이디가 없습니다.");
		else {
			HashMap<String,Object> hm = list.get(0);
			if (hm.get("PWD")==null) model.addAttribute("message", "DB오류 관리자에게 문의하세요");
			else if(ADMINPW.equals((String)hm.get("PWD"))) {
				session.setAttribute("loginAdmin", hm);
				session.removeAttribute("message");
				return "redirect:/adminList?table=r&first=y";
			} else model.addAttribute("message", "비밀번호가 틀렸습니다.");
		}
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
		model.addAttribute("list", list);
		if(table.equals("r")) return "admin/admin_reslist";
		else if(table.equals("o")) return "admin/admin_orderlist";
		else if(table.equals("m"))	return "admin/admin_memlist";
		else if(table.equals("q")) return "admin/admin_qnalist";
		else	return "admin/admin_bannerlist";
	}
	
	
	@RequestMapping("/admin_resOx")
	public String admin_restaurantOk(	HttpSession session, @RequestParam("ox") int ox, @RequestParam("RSEQ") int RSEQ) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ox", ox);
		prm.put("RSEQ", RSEQ);
		as.admin_resOx(prm);
		return "redirect:/adminList?table=r";
	}
	
	
	@RequestMapping("/admin_orderLR")
	public String admin_orderLR(	HttpSession session, @RequestParam("result") int result, @RequestParam("OSEQ") int OSEQ) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("result", result);
		prm.put("OSEQ", OSEQ);
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
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("procedure", procedure);
			prm.put("qvo", qvo);
			as.adminQna(prm);
			if(procedure.equals("update")) url = "redirect:/adminDetail?procedure=qna&SEQ="+qvo.getQSEQ();
			else url = "redirect:/adminList?table=q";
		}
		return url;
	}
	
	
	@RequestMapping("/adminDetail")
	public String adminDetail(HttpSession session, Model model,
			@RequestParam("procedure") String procedure, @RequestParam("SEQ") int SEQ ) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("procedure", procedure);
		prm.put("SEQ", SEQ);
		prm.put("ref_cursor", null);
		as.adminDetail(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object> vo = list.get(0);
		model.addAttribute("vo", vo);
		
		if (procedure.equals("res")) return "admin/admin_resDetail";
		if (procedure.equals("qnaUp")) return "admin/admin_qnaUpdate";
		else return "admin/admin_qnaDetail";
	}
	
	
	@RequestMapping("/admin_bupdown")
	public String admin_bupdown(HttpSession session, @RequestParam("BSEQ") int BSEQ, @RequestParam("num") int num) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크

		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BSEQ", BSEQ);
		prm.put("num", num);
		as.admin_bupdown(prm);
		System.out.println(1);
		return "redirect:/adminList?table=b";
	}

	
}
	

