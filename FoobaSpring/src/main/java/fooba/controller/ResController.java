package fooba.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.mshop.dto.MemberVO;

import fooba.service.MemberService2;
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
	public Sring res_login(@ModelAttribute("dto")@Valid RestaurantVO rvo,)
	
	
	
	
}
