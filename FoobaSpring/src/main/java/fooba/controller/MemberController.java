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

import fooba.dto.CartVO;
import fooba.dto.FoodmenuVO;
import fooba.dto.MemberVO;
import fooba.dto.OrderVO;
import fooba.dto.Paging;
import fooba.dto.ReviewVO;
import fooba.service.MemberService;
import fooba.service.ResService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	
	@Autowired
	ResService rs;
	
	@Autowired
	ServletContext context;
	
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
		 
		 rs.foodList(prm);
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
		
		 ArrayList<HashMap<String,Object>> cartList 
         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		 model.addAttribute("RTIP", RTIP);
		 model.addAttribute("RSEQ", RSEQ);
		 model.addAttribute("list", cartList);
		 model.addAttribute("carttotalprice", carttotalprice);
		 
		 return "main/menuorder";
	}
	
	@RequestMapping("order")
	public String order(HttpServletRequest request,HttpSession session,Model model,
			OrderVO ovo, CartVO cvo) {
		if(session.getAttribute("loginUser")==null) return "member/memberLogin";
		
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("RSEQ", ovo.getRSEQ());
		prm.put("ID", ovo.getID());
		prm.put("ovo", ovo);
		
		ms.insertOrders(prm);
		
		 int result = Integer.parseInt(prm.get("result") + "");
         if(result  == 2) return "redirect:/orderForm";
		
		return "redirect:/memberOrderList";
	}
	
	@RequestMapping("memberOrderList")
	public String memberOrderList(HttpServletRequest request,HttpSession session,Model model,
			OrderVO ovo, @RequestParam("oa") String oa ) {
		session.setAttribute("oa", oa);
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null) return "member/memberLogin";
		
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("ID", loginUser.get("ID")+"");
		prm.put("oa", oa);
		prm.put("request", request);
		ms.memberOrderList(prm);
		
		ArrayList<HashMap<String,Object>> list 	// 주문리스트
        = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		
		model.addAttribute("list", list);
		model.addAttribute("paging", (Paging)prm.get("paging"));
	
		return "member/memberOrderList";
	}
	
	@RequestMapping(value="reviewfileup",method=RequestMethod.POST)
	@ResponseBody	
	public HashMap<String , Object>reviewfileup(Model model,HttpServletRequest request){
		
		String path=context.getRealPath("images/review/");
		HashMap<String,Object>result=new HashMap<String,Object>();
		
		try {
			MultipartRequest multi =new MultipartRequest(
					request,path,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy()
			);
			result.put("STATUS",1);
			result.put("FILENAME", multi.getFilesystemName("fileimage"));
		} catch (IOException e) {	e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/memberReviewWrite", method=RequestMethod.POST)
	public String memberReviewWrite(HttpSession session,ReviewVO vo, Model model ) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		ms.writeReview(vo);
		ms.reviewComplete(vo.getOSEQ());
		return "redirect:/memberOrderDetail?OSEQ="+vo.getOSEQ();
	}
}
