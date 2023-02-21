package fooba.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import fooba.dto.BannerVO;
import fooba.dto.Paging;
import fooba.dto.QnaVO;
import fooba.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;

	@Autowired
	ServletContext context;
	
	@RequestMapping("/admin_fooba_tos") // 이용약관 페이지
	public String admin_fooba_tos() {
		return "admin/admin_fooba_tos";
	}
	
	@RequestMapping("/admin_fooba_privacy") // 개인정보 페이지
	public String admin_fooba_privacy() {
		return "admin/admin_fooba_privacy";
	}
	
	@RequestMapping("/admin_logout") // 로그아웃
	public String admin_logout(HttpSession session) {
		session.removeAttribute("loginAdmin");
		return "admin/admin_login";
	}
	
	@RequestMapping("/admin_loginForm") // 로그인폼 이동
	public String admin_loginForm(HttpSession session) {
		session.removeAttribute("loginAdmin");
		return "admin/admin_login";
	}

	@RequestMapping("/admin_login") // 로그인
	public String admin_login(	HttpSession session, Model model,
	@RequestParam("ADMINID") String ADMINID, @RequestParam("ADMINPW") String ADMINPW) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ADMINID", ADMINID);
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
	
	@RequestMapping("/adminList") // 어드민 리스트 조회 (레스토랑, 오더, 멤버, qna, 배너)
	public String adminList(HttpServletRequest request, HttpSession session, Model model, @RequestParam("table") String table) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("table", table);
		prm.put("request", request);
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
	
	@RequestMapping("/adminDetail") // qna view, res detail 조회 병합 메서드
	public String adminDetail(HttpSession session, Model model,
	@RequestParam("procedure") String procedure, @RequestParam("SEQ") int SEQ ) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("procedure", procedure);
		prm.put("SEQ", SEQ);
		as.adminDetail(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object> vo = list.get(0);
		model.addAttribute("vo", vo);
		if (procedure.equals("res")) return "admin/admin_resDetail";
		if (procedure.equals("qnaUp")) return "admin/admin_qnaUpdate";
		if (procedure.equals("bannerUp")) return "admin/admin_bannerUpdate";
		else return "admin/admin_qnaDetail";
	}
	
	@RequestMapping("/admin_resOx") // 레스토랑 승인
	public String admin_resOx( HttpSession session, @RequestParam("ox") int ox, @RequestParam("RSEQ") int RSEQ ) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login";
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ox", ox);
		prm.put("RSEQ", RSEQ);
		as.admin_resOx(prm);
		return "redirect:/adminList?table=r";
	}
	
	@RequestMapping("/admin_orderLR") // 주문 상태 변경
	public String admin_orderLR(	HttpSession session, @RequestParam("result") int result, @RequestParam("OSEQ") int OSEQ) {
		System.out.println(1122);
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("result", result);
		prm.put("OSEQ", OSEQ);
		as.admin_orderLR(prm);
		return "redirect:/adminList?table=o";
	}
	
	@RequestMapping("/admin_qnaWriteForm") // qna 작성 폼 
	public String admin_qnaWriteForm(HttpSession session) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		return "admin/admin_qnaWrite";
	}
	
	@RequestMapping("/adminQna") // qna write, delete, update 병합 메서드
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
	
	@RequestMapping("/admin_bupdown") // 배너 순서 변경
	public String admin_bupdown(HttpSession session, @RequestParam("BSEQ") int BSEQ, @RequestParam("num") int num) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BSEQ", BSEQ);
		prm.put("num", num);
		as.admin_bupdown(prm);
		
		return "redirect:/adminList?table=b";
	}
	
	@RequestMapping("/admin_bannerWriteForm") // 배너 작성 폼
	public String admin_bannerWriteForm(HttpSession session) {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login"; // 로그인체크
		return "admin/admin_bannerWrite";
	}
	 
	@RequestMapping(value="/bannerFileup", method=RequestMethod.POST) // 배너 사진 업로드
	@ResponseBody
	public HashMap<String,Object> fileup(HttpServletRequest request) throws IOException {
		String path = context.getRealPath("images");
		HashMap<String, Object> prm = new HashMap<>();
		MultipartRequest multi = new MultipartRequest (
				request,path,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy()
		);
		if (!multi.getFilesystemName("bannerImage").equals("")) prm.put("STATUS", 1);
		prm.put("FILENAME", multi.getFilesystemName("bannerImage"));
		return prm;
	}
	
	@RequestMapping("/admin_bannerWrite") // 배너 작성
	public String admin_bannerWrite(@ModelAttribute("vo") @Valid BannerVO bvo, BindingResult result, HttpSession session, Model model) throws IOException {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/login";
		if( result.getFieldError("BNAME")!=null ) model.addAttribute("message","배너 이름을 입력하세요");
		else if( result.getFieldError("BIMAGE")!=null ) model.addAttribute("message","배너 이미지를 등록하세요");
		else {
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("vo", bvo);
			as.admin_bannerWrite(prm);
			model.addAttribute("result", 1);
		}
		return "admin/admin_bannerWrite";
	}
	
	@RequestMapping("/admin_bannerUpdate") // 배너 업데이트
	public String admin_bannerUpdate(@Valid BannerVO bvo, BindingResult result, @RequestParam("OLDBIMAGE") String OLDBIMAGE,
	HttpSession session, Model model) throws IOException {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		String NEWBIMAGE = bvo.getBIMAGE();
		if( bvo.getBIMAGE().equals("") ) bvo.setBIMAGE(OLDBIMAGE);
		else model.addAttribute("NEWBIMAGE", NEWBIMAGE);
		if( result.getFieldError("BNAME")!=null ) { model.addAttribute("message","배너 이름을 입력하세요");
			if( !NEWBIMAGE.equals("")  ) 	bvo.setBIMAGE(OLDBIMAGE);
		} else {
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("vo", bvo);
			as.admin_bannerUpdate(prm);;
		}
		model.addAttribute("result", 1);
		model.addAttribute("vo", bvo);
		return "admin/admin_bannerUpdate";
	}
	
	@RequestMapping("/admin_bannerDelete") // 배너 삭제
	public String admin_bannerDelete( HttpSession session, @RequestParam("BSEQ") int BSEQ ) throws IOException {
		if(session.getAttribute("loginAdmin")==null) return "redirect:/admin_loginForm";
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BSEQ", BSEQ );
		as.admin_bannerDelete(prm);
		return "redirect:/adminList?table=b";
	}
	
}
	

