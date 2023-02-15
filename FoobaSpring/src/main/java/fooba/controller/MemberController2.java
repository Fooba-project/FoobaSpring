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

import fooba.dto.CartVO;
import fooba.dto.FoodmenuVO;
import fooba.dto.MemberVO;
import fooba.dto.OrderVO;
import fooba.service.MemberService2;
import fooba.service.ResService;
import fooba.service.ResService2;

@Controller
public class MemberController2 {
	
	@Autowired
	MemberService2 ms;
	
	@Autowired
	ResService2 rs2;
	 
	@Autowired
	ResService rs;
	
	@RequestMapping("/index")
	public String index() {
		return "main";
	}
	
	/*
	// 기본 프레임
	@RequestMapping("/")
	public String method(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("인수1") String 인수1) {
		if(session.getAttribute("loginUser")==null) 
		return "redirect:/login"; // 로그인체크

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
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/memberLogin";
	}
	
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	   public String login(@ModelAttribute("dto") @Valid MemberVO mvo, 
			   BindingResult result, HttpSession session, Model model) {
	      
	      String url = "member/memberLogin";
	      if(result.getFieldError("ID")!=null)
	         model.addAttribute("message", result.getFieldError("ID").getDefaultMessage());
	      else if (result.getFieldError("PWD")!=null)
	         model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
	      else {
	         HashMap<String, Object> prm = new HashMap<>();
	         prm.put("ID", mvo.getID());
	         prm.put("ref_cursor", null);
	         
	         ms.getMember(prm);
	         
	         ArrayList<HashMap<String,Object>> list 
	         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
	         if(list.size()==0) {	
	            model.addAttribute("message","아이디가 없습니다.");
	            return "member/memberLogin";   
	         }
	         HashMap<String, Object> hvo = list.get(0);
	         if(!hvo.get("PWD").equals(mvo.getPWD()))
	            model.addAttribute("message","비번이 안맞습니다.");
	         else if (hvo.get("PWD").equals(mvo.getPWD())) {
	            session.setAttribute("loginUser", hvo);
	            url = "redirect:/";
	         }	   
	      }
	      return url;
	 }
	
	 @RequestMapping("/logout")
	 public String logout(HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 session.removeAttribute("loginUser");
		 return "redirect:/";
	 }
	 
	 @RequestMapping("/miniLoginForm")
	 public String mini_login_form( HttpServletRequest request) {
		 if(request.getParameter("check")==null)
			 request.setAttribute("message", "로그인이 필요합니다.");
		 return "member/memberMiniLogin";
	 }
	 
	 @RequestMapping("/miniLogin")
	 public String miniLogin(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, 
	         HttpServletRequest request, Model model,
	         @RequestParam("FSEQ") String FSEQ) {
		 
		 String url="member/memberMiniLogin";
		 
		 model.addAttribute("check", "1");
		 model.addAttribute("FSEQ",FSEQ);
		 
		 if(result.getFieldError("ID")!=null)
	         model.addAttribute("message", result.getFieldError("ID").getDefaultMessage());
	      else if (result.getFieldError("PWD")!=null)
	         model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
	      else {
	         HashMap<String, Object> prm = new HashMap<String, Object>();
	         prm.put("ID", membervo.getID());
	         prm.put("ref_cursor", null);
	         prm.put("FSEQ", FSEQ);
	         ms.getMember(prm);
	         
	         ArrayList<HashMap<String,Object>> list 
	         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
	         if(list==null) {	
	            model.addAttribute("message","아이디가 없습니다.");
	            return "member/memberLogin";   
	         }
	         HashMap<String, Object> mvo = list.get(0);
	         if(!mvo.get("PWD").equals(membervo.getPWD()))
	            model.addAttribute("message","비번이 안맞습니다.");
	         else if (mvo.get("PWD").equals(membervo.getPWD())) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginUser", mvo);
	            url = "redirect:/menupopup?FSEQ="+FSEQ;
	         }	   	 
	      }
		 return url;
	 }
	 	
	 
	 @RequestMapping("/search")
	 public String search(HttpServletRequest request,HttpSession session,Model model){
		 
		 HashMap<String, Object> prm = new HashMap<>();
		 prm.put("request", request);
		 prm.put("ref_cursor", null);
		 
		 ms.SearchResList(prm);
		 String search = (String)prm.get("search");
		 model.addAttribute("search",search);
		 
		 ArrayList< HashMap<String,Object> > list 
			= (ArrayList<HashMap<String, Object>>) prm.get("list");
		 
		 model.addAttribute("RList",list);
		 		 
		 return "main/resList";
	}
	 
	 @RequestMapping("/category")
	 public String category(HttpServletRequest request,HttpSession session,Model model){
		 HashMap<String, Object> prm = new HashMap<>();
		 prm.put("request", request);
		 prm.put("ref_cursor", null);
		 
		 ms.searchKind(prm);
		 ArrayList< HashMap<String,Object> > list 
			= (ArrayList<HashMap<String, Object>>) prm.get("list");
		 model.addAttribute("RList",list);
		 
		 return "main/resList";
	 }
	 
	 @RequestMapping("/fooba_tos")
	 public String fooba_tos(HttpServletRequest request) {
		 
		 return "etc/fooba_tos";
	 }
	 
	 @RequestMapping("/fooba_privacy")
	 public String fooba_privacy(HttpServletRequest request) {
		 
		 return "etc/fooba_privacy";
	 }
	 
	@RequestMapping("/restaurantDetail")
	public String restaurant_detail(HttpServletRequest request, HttpSession session,
	Model model, @RequestParam("RSEQ")int RSEQ) {
		 
		int carttotalprice=0; 
		 
		 HashMap<String, Object> prm = new HashMap<>();
		 prm.put("RSEQ", RSEQ);	 
		 prm.put("ref_cursor", null);
		 prm.put("ref_cursor1", null);
		 prm.put("ref_cursor2", null);
		 
		 rs2.foodList(prm);
		 ms.resInf(prm);
		 ms.reviewList(prm);
		 	 
		 ArrayList<HashMap<String, Object>> list
			=(ArrayList<HashMap<String, Object>>)prm.get("ref_cursor");
		 
		 ArrayList<HashMap<String,Object>>list1
			=(ArrayList<HashMap<String,Object>>)prm.get("ref_cursor1");
		 HashMap<String,Object> rvo =list1.get(0);
		 
		 ArrayList<HashMap<String,Object>>list2
			=(ArrayList<HashMap<String,Object>>)prm.get("ref_cursor2");
		 
		 HashMap<String,Object> vo=
				 (HashMap<String,Object>)session.getAttribute("loginUser");
				 
		 if(vo != null) {
			 prm.put("ID", vo.get("ID")+"");
			 int sum = 0;
			 prm.put("ref_cursor", null);
			 ms.cartList(prm);
			 ArrayList<HashMap<String,Object>> list3
				= (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			 for (HashMap<String,Object> cart : list3)
				sum += Integer.parseInt(cart.get("CPRICE")+"");
			 model.addAttribute("clist",list3);
			 model.addAttribute("carttotalprice",
					 sum + Integer.parseInt(rvo.get("RTIP")+""));
		 }
	
		 /*가게 별점*/
		rs.starAvg(prm);
		session.setAttribute("intstar",prm.get("intstar")); //별 개수
		session.setAttribute("doublestar",prm.get("doublestar")); //별점(소수점까지)
		
		 model.addAttribute("FoodmenuList",list);
		 model.addAttribute("RestaurantVO",rvo);
		 model.addAttribute("ReviewList",list2);
		 
		 return "main/restaurantDetail";
	 }
	
	@RequestMapping("/menupopup")
	public String memu_popup(HttpServletRequest request, HttpSession session,
			Model model, @RequestParam("FSEQ")int FSEQ) {
	HashMap<String, Object> prm = new HashMap<>();
	prm.put("FSEQ", FSEQ);
	prm.put("ref_cursor", null);
	
	ms.getFoodDetail(prm);
	
	ArrayList<HashMap<String, Object>> list
	=(ArrayList<HashMap<String, Object>>)prm.get("ref_cursor");
	HashMap<String, Object>fvo=list.get(0);
	
	model.addAttribute("vo", fvo);
		return "main/popupMenu";
	}
	
	@RequestMapping("/jangbaguni")
	public String jangbaguni(CartVO cvo, FoodmenuVO fvo, HttpSession session, Model model) {
		 HashMap<String,Object> loginUser=
				 (HashMap<String,Object>)session.getAttribute("loginUser");
		if(loginUser==null) return "member/memberMiniLogin";
		
		if(cvo.getSIDEYN1() != null) cvo.setSIDEYN1(cvo.getFSIDE1());
		else cvo.setSIDEYN1(" ");
		if(cvo.getSIDEYN2() != null) cvo.setSIDEYN2(cvo.getFSIDE2());
		else cvo.setSIDEYN2(" ");
		if(cvo.getSIDEYN3() != null) cvo.setSIDEYN3(cvo.getFSIDE3());
		else cvo.setSIDEYN3(" ");
		
		ms.insertCart(cvo);
		

		model.addAttribute("vo", cvo);
		return "main/popupMenuClose";
	}
	
	@RequestMapping("deleteCartmenu")
	public String delete_cartmenu(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam("CSEQ")int CSEQ,@RequestParam("RSEQ")int RSEQ) {
		HashMap<String,Object> loginUser=
				 (HashMap<String,Object>)session.getAttribute("loginUser");
		if(loginUser==null) return "member/memberLogin";
		
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("CSEQ", CSEQ);
		prm.put("RSEQ", RSEQ);
		
		ms.deletecart(prm);
		
		return "redirect:/restaurantDetail?RSEQ="+RSEQ;
	}
	
	@RequestMapping("orderForm")
	public String orderForm(HttpServletRequest request, MemberVO mvo, CartVO cvo, HttpSession session,Model model,
	@RequestParam("RSEQ")int RSEQ, @RequestParam("carttotalprice")int carttotalprice, @RequestParam("RTIP")int RTIP, @RequestParam("ID")String ID) {
		
		HashMap<String,Object> loginUser=(HashMap<String,Object>) session.getAttribute("loginUser");
		
		if(loginUser==null) return "member/memberLogin";
		
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("RSEQ", RSEQ);
		prm.put("ID",ID);
		prm.put("ref_cursor", null);

		ms.cartList(prm);
		
		 ArrayList<HashMap<String,Object>> list 
         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		 model.addAttribute("RTIP", RTIP);
		 model.addAttribute("RSEQ", RSEQ);
		 model.addAttribute("list", list);
		 model.addAttribute("carttotalprice", carttotalprice);
		 
		 return "main/menuorder";
	}
	
	@RequestMapping("order")
	public String order(HttpServletRequest request,HttpSession session,Model model,
			OrderVO ovo) {
		if(session.getAttribute("loginUser")==null) return "member/memberLogin";
		
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("ovo", ovo);
		
		ms.insertOrders(prm);
		
		return "member/memberOrderList";
	}
		
	
}
