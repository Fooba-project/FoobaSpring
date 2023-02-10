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
import fooba.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
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
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	@RequestMapping("/memberIdCheckForm")
		public String member_id_check_form( 
				@RequestParam("id") String id,
				Model model, 
				HttpServletRequest request ) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("ref_cursor", null);
		ms.getMember( paramMap );
		
		ArrayList< HashMap<String,Object> > list 
			= (ArrayList< HashMap<String,Object> >) paramMap.get("ref_cursor");
		
		if( list.size()==0 ) model.addAttribute("result" , -1);
		else model.addAttribute("result" , 1);
		
		model.addAttribute("id", id);		
		return "member/memberIdCheck";
	}
	
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String method(@ModelAttribute("mvo") @Valid MemberVO mvo, BindingResult result, 
			 HttpSession session, Model model ) {
		String url = "member/memberJoin"; 
		if (result.getFieldErrors()!=null ) 	model.addAttribute("message", "빈칸 없이 입력하세요" );
		else if( mvo.getReid() == null || ( mvo.getReid() != null && !mvo.getReid().equals(mvo.getId() ) ) )
			model.addAttribute("message", "아이디 중복체크를 하지 않으셨습니다");
		
		else if( mvo.getUserpwdchk() == null || (  mvo.getUserpwdchk() != null && !mvo.getUserpwdchk().equals(mvo.getPwd() ) ) ) 
			model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
		else {
			ms.insertMember( mvo);
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
			url = "member/memberLogin";
		}
		return url;
	}	

	
}
