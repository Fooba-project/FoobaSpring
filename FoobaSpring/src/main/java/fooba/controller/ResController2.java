package fooba.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fooba.dto.RestaurantVO;
import fooba.service.ResService2;

@Controller
public class ResController2 {
	
	@Autowired
	ResService2 rs;
	
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
	@RequestMapping("/res_foodmenu")
		public String res_foodmenu(HttpServletRequest request, HttpSession session, Model model
		) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		else {	
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		RestaurantVO rvo=(RestaurantVO)session.getAttribute("loginRes");
		paramMap.put("rseq",rvo.getRseq());
		paramMap.put("ref_cursor", null);

		rs.foodList( paramMap );
		ArrayList<HashMap<String, Object>> list
			=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		model.addAttribute("FoodList",list);
		}
		return "restaurant/res_foodmenu";  
	}
	
	@RequestMapping("/res_foodmenuUpdateForm")
		public String res_foodmenuUpdateForm(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		return "";  
	}
	
}
