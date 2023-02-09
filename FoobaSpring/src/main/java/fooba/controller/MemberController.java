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
	
	@RequestMapping(value="/member_join_send_form", method=RequestMethod.POST)
	public String method(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(value="userreid") String userreid,
			@RequestParam(value="userpwdchk") String userpwdchk) {
	
		if( result.getFieldError("id")!=null)
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage() );
		else if( result.getFieldError("pwd")!=null)
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage() );
		else if( result.getFieldError("name")!=null)
			model.addAttribute("message", result.getFieldError("name").getDefaultMessage() );
		else if( result.getFieldError("phone")!=null)
			model.addAttribute("message", result.getFieldError("phone").getDefaultMessage() );
		else if( result.getFieldError("email")!=null)
			model.addAttribute("message", result.getFieldError("email").getDefaultMessage() );
		else if( userreid == null || (   userreid != null && !userreid.equals(mvo.getId() ) ) )
			model.addAttribute("message", "아이디 중복체크를 하지 않으셨습니다");
		else if( userpwdchk == null || (  userpwdchk != null && !userpwdchk.equals(mvo.getPwd() ) ) ) 
			model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
		else {
			ms.insertMember( mvo );
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
			}
			return "member/memberLogin";	
		}	

	
	
	
}
