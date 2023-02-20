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
import fooba.dto.Paging;
import fooba.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@RequestMapping("/")
	public String main(Model model) {
		return "redirect:/index";
	}
	
	@RequestMapping("/index")
	public String index(Model model) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		prm.put("ref_cursor",null);
		ms.banner(prm);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		model.addAttribute("bannerList",list);
		model.addAttribute("size",list.size());
		return "main";
	}

	@RequestMapping("/memberIdCheck")
		public String member_id_check( 
				@RequestParam("ID") String ID,
				Model model, 
				HttpServletRequest request ) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", ID);
		paramMap.put("ref_cursor", null);
		ms.getMember( paramMap );
		
		ArrayList< HashMap<String,Object> > list 
			= (ArrayList< HashMap<String,Object> >) paramMap.get("ref_cursor");
		
		if( list.size()==0 ) model.addAttribute("result" , -1);
		else model.addAttribute("result" , 1);
		
		model.addAttribute("ID", ID);		
		return "member/memberIdCheck";
	}
	
	
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String method(@ModelAttribute("vo") @Valid MemberVO mvo, BindingResult result, 
		Model model ) {
		String url = "member/memberJoin"; 
		if (result.getFieldError("ID")!=null ) 	model.addAttribute("message", "아이디를 입력하세요" );
		else if (result.getFieldError("PWD")!=null ) 	model.addAttribute("message", "비밀번호를 입력하세요" );
		else if (result.getFieldError("NAME")!=null ) 	model.addAttribute("message", "이름을 입력하세요" );
		else if (result.getFieldError("PHONE")!=null ) 	model.addAttribute("message", "전화번호를 입력하세요" );
		else if (result.getFieldError("EMAIL")!=null ) 	model.addAttribute("message", "이메일을 입력하세요" );
		else if( mvo.getREID() == null || ( mvo.getREID() != null && !mvo.getREID().equals(mvo.getID() ) ) )
			model.addAttribute("message", "아이디 중복체크를 하지 않으셨습니다");
		else if( mvo.getUSERPWDCHK() == null || (  mvo.getUSERPWDCHK() != null && !mvo.getUSERPWDCHK().equals(mvo.getPWD() ) ) ) 
			model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
		else {
			ms.insertMember( mvo);
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
			url = "member/memberLogin";
		}
		return url;
	}
	
	@RequestMapping("/memberFindIdForm")
	public String memberFindIdForm() {
		return"member/memberFindId";
	}
	
	@RequestMapping(value="memberFindId")
	public String memberFindId(
			@RequestParam(value="NAME" ,required=false)String NAME,
			@RequestParam(value="PHONE",required=false)String PHONE, Model model) {
		HashMap<String,Object>prm =new HashMap<String,Object>();
		prm.put("NAME",NAME);
		prm.put("ref_cursor",null);
		ms.memberFindId(prm);
		
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		
		if(list.size()==0) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "member/memberFindId";
		}else {
			HashMap<String,Object> mvo=list.get(0);
			if(!mvo.get("PHONE").equals(PHONE)) {
				model.addAttribute("message","휴대폰 번호가 틀렸습니다. 다시 입력하세요.");
				return "member/memberFindId";
			}
			else {
				model.addAttribute("message","귀하의 아이디는 '"+mvo.get("ID")+"'입니다.");
				return  "member/memberLogin";
			}
		}
	}
	
	@RequestMapping("/memberFindPwForm")
	public String memberFindPwForm() {
		return"member/memberFindPw";
	}
	
	@RequestMapping(value="memberFindPw")
	public String memberFindPw(
			@RequestParam(value="ID" ,required=false)String ID,
			@RequestParam(value="NAME" ,required=false)String NAME,
			@RequestParam(value="PHONE",required=false)String PHONE, Model model) {
		HashMap<String,Object>prm =new HashMap<String,Object>();
		
		prm.put("ID",ID);
		prm.put("ref_cursor",null);
		ms.memberFindPw(prm);
		
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		
		if(list.size()==0) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "member/memberFindPw";
		}else {
			HashMap<String,Object> mvo=list.get(0);
			if(!mvo.get("PHONE").equals(PHONE)||!mvo.get("NAME").equals(NAME)) {
				model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
				return "member/memberFindPw";
			}
			else {
				model.addAttribute("message","귀하의 비밀번호는 '"+mvo.get("PWD")+"'입니다.");
				return  "member/memberLogin";
			}
		}
	}
	
	@RequestMapping("/memberQnalist")
	public String memberQnalist(Model model) {
		
		HashMap<String, Object> prm = new HashMap<String, Object>();
		
		prm.put("ref_cursor", null);
		ms.memberQnaList(prm);
		
		ArrayList<HashMap<String,Object>> list = 		
				(ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		
		model.addAttribute("qnaList", list);
		return"member/memberQnalist";
	}
	
	
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm() {
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(HttpSession session,
			@ModelAttribute("vo") @Valid MemberVO mvo, BindingResult result, Model model ) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		
		if (result.getFieldError("PWD")!=null ) 	model.addAttribute("message", "비밀번호를 입력하세요" );
		else if (result.getFieldError("NAME")!=null ) 	model.addAttribute("message", "이름을 입력하세요" );
		else if (result.getFieldError("PHONE")!=null ) 	model.addAttribute("message", "전화번호를 입력하세요" );
		else if (result.getFieldError("EMAIL")!=null ) 	model.addAttribute("message", "이메일을 입력하세요" );
		else if( mvo.getUSERPWDCHK() == null || (  mvo.getUSERPWDCHK() != null && !mvo.getUSERPWDCHK().equals(mvo.getPWD() ) ) ) 
			model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
		else {
			HashMap<String, Object> prm = new HashMap<String, Object>();		
			
			prm.put("mvo", mvo);
			mvo.setID( mvo.getID().replace("id : ", "").replace(" (수정 불가)", "") );
			mvo.setNAME( mvo.getNAME().replace("이름 : ", "").replace(" (수정 불가)", "") );
			prm.put("ref_cursor",null);
			ms.memberUpdate( prm);
			ArrayList<HashMap<String,Object>> list 
			= (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			if(list.size()!=0) {
			HashMap<String,Object> loginUser = list.get(0);
			session.setAttribute("loginUser", loginUser);
			return "member/memberUpdate";
			}
			}
		return "member/memberUpdate";
	}
	
	@RequestMapping("/withdrawalMember")
	public String res_withdrawal(HttpSession session,Model model) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		HashMap<String , Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
		ms.withdrawalMember((String)loginUser.get("ID"));
		session.removeAttribute("loginUser");
		model.addAttribute("message","아이디가 정지 되었습니다. 복구요청은 고객센터에 전화주세요");
		return "member/memberLogin";
	}
	
	@RequestMapping("/memberOrderDetail")
	public String memberOrderDetail(HttpSession session,Model model,@RequestParam("OSEQ")int OSEQ) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		HashMap<String, Object> prm = new HashMap<String, Object>();		
		prm.put("OSEQ", OSEQ);
		prm.put("ref_cursor1",null);
		prm.put("ref_cursor2",null);
		prm.put("ref_cursor3",null);
		
		ms.getOrderDetail(prm);
		
		ArrayList<HashMap<String,Object>> list1 
		= (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor1");
		ArrayList<HashMap<String,Object>> list2 
		= (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor2");
		ArrayList<HashMap<String,Object>> list3 
		= (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor3");
		model.addAttribute("ovo", list1.get(0));
		model.addAttribute("ovList", list2);
		if(list3.size()!=0)model.addAttribute("review", list3.get(0));
		return "member/memberOrderDetail";
	}
	
	
	
	
	
}
