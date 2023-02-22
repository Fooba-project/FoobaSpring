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

	@RequestMapping("/") // 메인화면으로 이동
	public String main(Model model) {
		return "redirect:/index";
	}

	@RequestMapping("/index") // 메인화면으로 이동
	public String index(Model model) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		ms.rollingBanner(prm);
		ArrayList<HashMap<String,Object>> list =(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		model.addAttribute("bannerList",list);
		model.addAttribute("size",list.size());
		return "main";
	}
	
	@RequestMapping("/fooba_tos") // 이용약관 페이지로 이동
	public String fooba_tos(HttpServletRequest request) {
		 return "etc/fooba_tos";
	}
	 
	@RequestMapping("/fooba_privacy") // 개인정보처리방침 페이지로 이동
	public String fooba_privacy(HttpServletRequest request) {
		return "etc/fooba_privacy";
	}
	
	@RequestMapping("/loginForm") // 회원 로그인 폼 이동
	public String loginForm() {
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST) // 회원 로그인, validation 적용
	public String login(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result, HttpSession session, Model model) {
		String url = "member/memberLogin";
		if(result.getFieldError("ID")!=null) model.addAttribute("message", result.getFieldError("ID").getDefaultMessage());
		else if (result.getFieldError("PWD")!=null) model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
		else {
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("ID", mvo.getID());
			ms.getMember(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			if(list.size()==0) model.addAttribute("message","아이디가 없습니다.");
			else { HashMap<String, Object> hvo = list.get(0);
				if(!hvo.get("PWD").equals(mvo.getPWD())) model.addAttribute("message","비밀번호가 틀렸습니다.");
				else if (hvo.get("PWD").equals(mvo.getPWD())) {
					session.setAttribute("loginUser", hvo);
					url = "redirect:/";
				}
			}
		}
		return url;
	}
	
	@RequestMapping("/logout") // 회원 로그아웃
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	 
	@RequestMapping("/memberJoinForm") // 회원가입폼 이동
	public String memberJoinForm() {
		return "member/memberJoin";
	}

	@RequestMapping("/memberIdCheck") // 회원가입 아이디 중복체크
		public String member_id_check( @RequestParam("ID") String ID, Model model, HttpServletRequest request ) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", ID);
		ms.getMember( paramMap );
		ArrayList< HashMap<String,Object> > list = (ArrayList< HashMap<String,Object> >) paramMap.get("ref_cursor");
		if( list.size()==0 ) model.addAttribute("result" , -1);
		else model.addAttribute("result" , 1);
		model.addAttribute("ID", ID);		
		return "member/memberIdCheck";
	}
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST) // 회원가입, validation 적용
	public String method(@ModelAttribute("vo") @Valid MemberVO mvo, BindingResult result, Model model ,HttpServletRequest request) {
		String url = "member/memberJoin";
		if (result.getFieldError("ID")!=null ) 	model.addAttribute("message", result.getFieldError("ID").getDefaultMessage());
		else if (result.getFieldError("PWD")!=null ) 	model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
		else if (result.getFieldError("NAME")!=null ) 	model.addAttribute("message",result.getFieldError("NAME").getDefaultMessage());
		else if (result.getFieldError("PHONE")!=null ) 	model.addAttribute("message", result.getFieldError("PHONE").getDefaultMessage());
		else if (result.getFieldError("EMAIL")!=null ) 	model.addAttribute("message", result.getFieldError("EMAIL").getDefaultMessage());
		else if (mvo.getZIP_NUM()==null||mvo.getZIP_NUM().equals("") ) 	model.addAttribute("message", "우편번호를 검색해주세요");
		else if (mvo.getADDRESS2()==null||mvo.getADDRESS2().equals("") ) 	model.addAttribute("message", "상세주소 1을 입력해주세요");
		else if( mvo.getREID() == null || !mvo.getREID().equals(mvo.getID() ) ) model.addAttribute("message", "아이디 중복체크를 하지 않으셨습니다");
		else if( mvo.getUSERPWDCHK() == null || !mvo.getUSERPWDCHK().equals(mvo.getPWD() ) ) model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
		else if(request.getParameter("useragree")==null) model.addAttribute("message", "약관에 동의하지 않았습니다.");
		else {
			if (mvo.getNICK()==null||mvo.getNICK().equals("")) mvo.setNICK(mvo.getNAME());
			ms.insertMember( mvo);
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
			return "member/memberLogin";
		}
		return "member/memberJoin";
	}
	
	@RequestMapping("/memberFindIdForm") // 회원 아이디 찾기 폼으로 이동
	public String memberFindIdForm() {
		return"member/memberFindId";
	}
	
	@RequestMapping(value="memberFindId") // 회원 아이디 찾기
	public String memberFindId( @RequestParam(value="NAME", required=false) String NAME, 
			@RequestParam(value="PHONE", required=false)String PHONE, Model model) {
		HashMap<String,Object>prm =new HashMap<String,Object>();
		prm.put("NAME", NAME);
		ms.memberFindId(prm);
		ArrayList<HashMap<String,Object>> list =(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		if(list.size()==0) model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
		else {
			HashMap<String,Object> mvo=list.get(0);
			if(!mvo.get("PHONE").equals(PHONE)) model.addAttribute("message","휴대폰 번호가 틀렸습니다. 다시 입력하세요.");
			else {
				model.addAttribute("message","귀하의 아이디는 '"+mvo.get("ID")+"'입니다.");
				return  "member/memberLogin";
			}
		}
		return "member/memberFindId";
	}
		
	@RequestMapping("/memberFindPwForm") // 회원 비밀번호 찾기 폼으로 이동
	public String memberFindPwForm() {
		return"member/memberFindPw";
	}
	
	@RequestMapping(value="memberFindPw") // 회원 비밀번호 찾기
	public String memberFindPw(
			@RequestParam(value="ID" ,required=false)String ID,
			@RequestParam(value="NAME" ,required=false)String NAME,
			@RequestParam(value="PHONE",required=false)String PHONE, Model model) {
		HashMap<String,Object>prm =new HashMap<String,Object>();
		prm.put("ID", ID);
		ms.memberFindPw(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		if(list.size()==0) model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
		else {
			HashMap<String,Object> mvo=list.get(0);
			if(!mvo.get("PHONE").equals(PHONE)||!mvo.get("NAME").equals(NAME)) model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			else {
				model.addAttribute("message","귀하의 비밀번호는 '"+mvo.get("PWD")+"'입니다.");
				return  "member/memberLogin";
			}
		}
		return "member/memberFindPw";
	}
	
	@RequestMapping("/memberQnalist") // 자주묻는 질문 조회 및 이동
	public String memberQnalist(Model model) {
		HashMap<String, Object> prm = new HashMap<String, Object>();
		ms.memberQnaList(prm);
		ArrayList<HashMap<String,Object>> list = 	(ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("list", list);
		return"member/memberQnalist";
	}
	
	@RequestMapping("/memberUpdateForm") // 회원 정보 수정 폼으로 이동
	public String memberUpdateForm(HttpSession session) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		return "member/memberUpdate";
	}
	
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST) // 회원 정보 수정, validation 적용
	public String memberUpdate( @ModelAttribute("loginUser") @Valid MemberVO mvo, BindingResult result, Model model, HttpSession session ) {
		if (session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		if (result.getFieldError("PWD")!=null ) model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
		else if (result.getFieldError("NAME")!=null ) model.addAttribute("message", result.getFieldError("NAME").getDefaultMessage());
		else if (result.getFieldError("PHONE")!=null ) model.addAttribute("message", result.getFieldError("PHONE").getDefaultMessage());
		else if (result.getFieldError("EMAIL")!=null ) model.addAttribute("message", result.getFieldError("EMAIL").getDefaultMessage());
		else if (mvo.getUSERPWDCHK().equals("") || mvo.getUSERPWDCHK() == null || !mvo.getUSERPWDCHK().equals(mvo.getPWD() ) ) model.addAttribute("message", "비밀번호가 일치하지 않습니다");
		else {
			HashMap<String, Object> prm = new HashMap<String, Object>();		
			prm.put("mvo", mvo);
			ms.memberUpdate( prm ); // 업데이트 후, 갱신된 정보로 로그인 유저 조회
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			HashMap<String,Object> loginUser = list.get(0);
			session.setAttribute("loginUser", loginUser); // 갱신된 정보 세션에 저장
			model.addAttribute("message", "정보 수정 완료");
		}
		return "redirect:/index";
	}
	
	@RequestMapping("/withdrawalMember") // 회원 탈퇴
	public String res_withdrawal(HttpSession session,Model model) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		HashMap<String , Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
		ms.withdrawalMember((String)loginUser.get("ID"));
		session.removeAttribute("loginUser");
		model.addAttribute("message","아이디가 삭제 되었습니다. 동일한 아이디로 가입가능합니다.");
		return "member/memberLogin";
	}
	
	@RequestMapping("/search") // 검색어 및 해쉬태그로 레스토랑 검색
	public String search(HttpServletRequest request,HttpSession session,Model model){
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("request", request);
		ms.SearchResList(prm);
		String search = (String)prm.get("search");
		model.addAttribute("search",search);
		ArrayList< HashMap<String,Object> > list = (ArrayList<HashMap<String, Object>>) prm.get("list");
		model.addAttribute("list",list);
		return "main/resList";
	}
	 
	@RequestMapping("/category") // 카테고리별 레스토랑 검색
	public String category(HttpServletRequest request, HttpSession session, Model model){
	HashMap<String, Object> prm = new HashMap<>();
		prm.put("request", request);
		ms.searchKind(prm);
		ArrayList< HashMap<String,Object> > list = (ArrayList<HashMap<String, Object>>) prm.get("list");
		model.addAttribute("list", list);
		return "main/resList";
	}

	@RequestMapping("/restaurantDetail") // 레스토랑 디테일 조회, (레스토랑기본정보, 메뉴리스트, 리뷰리스트, 카트리스트)
	public String restaurant_detail(HttpServletRequest request, HttpSession session,
	Model model, @RequestParam("RSEQ")int RSEQ) {
		int carttotalprice=0;
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("RSEQ", RSEQ);

		ms.resInf(prm); // 레스토랑 기본 정보 조회
		ArrayList<HashMap<String,Object>> resList = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object> rvo = resList.get(0); // 레스토랑 기본 정보 조회해서, rvo에 저장
		
		rs.foodList(prm); // 레스토랑 음리스트 조회
		ArrayList<HashMap<String, Object>> foodList = (ArrayList<HashMap<String, Object>>)prm.get("ref_cursor"); // 푸드리스트 저장
		
		ms.reviewList(prm); // 레스토랑의 리뷰리스트 조회
		ArrayList<HashMap<String,Object>> reviewList = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor"); // 리뷰 리스트
		
		int listsize = 4;
		if ( listsize < reviewList.size()) listsize = reviewList.size();
		if ( listsize < foodList.size()) listsize = foodList.size();
		HashMap<String,Object> mvo = (HashMap<String,Object>)session.getAttribute("loginUser");
		if(mvo != null) {
			prm.put("ID", mvo.get("ID")+"");
			int sum = 0;
			ms.cartList(prm); // 카트 내역 조회
			ArrayList<HashMap<String,Object>> cartList = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			for (HashMap<String,Object> cvo : cartList) sum += Integer.parseInt(cvo.get("CPRICE")+"");
			model.addAttribute("clist", cartList);
			if (listsize < cartList.size() ) listsize = cartList.size();
			model.addAttribute("carttotalprice", sum + Integer.parseInt(rvo.get("RTIP")+""));
		}

		rs.starAvg(prm); // 가게 별점 계산
		session.setAttribute("intstar", prm.get("intstar")); //별 개수
		session.setAttribute("doublestar",prm.get("doublestar")); //별점(소수점까지)]
		model.addAttribute("FoodmenuList",foodList);
		model.addAttribute("RestaurantVO",rvo);
		model.addAttribute("ReviewList",reviewList);		
		model.addAttribute("listsize",listsize);
		return "main/restaurantDetail";
	}

	@RequestMapping("/menupopup") // 카트에 메뉴추가를 위한 팝업창
	public String memu_popup(HttpServletRequest request, HttpSession session, Model model, @RequestParam("FSEQ")int FSEQ) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("FSEQ", FSEQ);		
		ms.getFoodDetail(prm);
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)prm.get("ref_cursor");
		HashMap<String, Object> fvo = list.get(0);
		model.addAttribute("vo", fvo);
		return "main/popupMenu";
	}
	
	@RequestMapping("/miniLoginForm") // 카트추가 메뉴팝업 실행시, 로그인을 하지 않았을 경우 띄워지는 미니로그인창
	public String mini_login_form( HttpServletRequest request) {
		if(request.getParameter("check")==null) request.setAttribute("message", "로그인이 필요합니다.");
		return "member/memberMiniLogin";
	}
	 
	@RequestMapping("/miniLogin") // 미니 로그인
	public String miniLogin(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, 
	HttpServletRequest request, Model model, @RequestParam("FSEQ") String FSEQ) {
		String url="member/memberMiniLogin"; 
		model.addAttribute("check", "1");
		model.addAttribute("FSEQ",FSEQ);
		if(result.getFieldError("ID")!=null) model.addAttribute("message", result.getFieldError("ID").getDefaultMessage());
		else if (result.getFieldError("PWD")!=null) model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
		else {
			HashMap<String, Object> prm = new HashMap<String, Object>();
			prm.put("ID", membervo.getID());
			ms.getMember(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			if(list.size()==0) model.addAttribute("message","아이디가 없습니다."); 
			else {
				HashMap<String, Object> loginUser = list.get(0);
				if(!loginUser.get("PWD").equals(membervo.getPWD()))
					model.addAttribute("message","비밀번호가 틀렸습니다.");
				else {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					url = "redirect:/menupopup?FSEQ="+FSEQ;
				}
			}
		}
		return url;
	}
	 
	@RequestMapping("/jangbaguni")
	public String jangbaguni(CartVO cvo, FoodmenuVO fvo, HttpSession session, Model model) {
		HashMap<String,Object> loginUser =  (HashMap<String,Object>)session.getAttribute("loginUser");
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
		HashMap<String,Object> loginUser = (HashMap<String,Object>)session.getAttribute("loginUser");
		if(loginUser==null) return "member/memberLogin";
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("CSEQ", CSEQ);
		prm.put("RSEQ", RSEQ);
		ms.deletecart(prm);
		return "redirect:/restaurantDetail?RSEQ="+RSEQ;
	}

	@RequestMapping("orderForm") // 주문표 폼으로 이동
	public String orderForm(HttpServletRequest request, MemberVO mvo, CartVO cvo, HttpSession session,Model model,
	@RequestParam("RSEQ")int RSEQ, @RequestParam("carttotalprice")int carttotalprice, @RequestParam("RTIP")int RTIP, @RequestParam("ID")String ID) {
		HashMap<String,Object> loginUser=(HashMap<String,Object>) session.getAttribute("loginUser");
		if(session.getAttribute("loginUser")==null) return "member/memberLogin";
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("RSEQ", RSEQ);
		prm.put("ID",ID);
		ms.cartList(prm);
		ArrayList<HashMap<String,Object>> cartList = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("RTIP", RTIP);
		model.addAttribute("RSEQ", RSEQ);
		model.addAttribute("list", cartList);
		model.addAttribute("carttotalprice", carttotalprice);
		return "main/menuorder";
	}
	
	@RequestMapping("order") // 주문 입력
	public String order(HttpServletRequest request,HttpSession session,Model model, OrderVO ovo, CartVO cvo) {
		if(session.getAttribute("loginUser")==null) return "member/memberLogin";
		HashMap<String,Object> prm = new HashMap<String,Object>();
		if(Integer.parseInt(request.getParameter("bdjs"))==0) {
			ovo.setADDRESS1(request.getParameter("ORADD1"));
			ovo.setADDRESS2(request.getParameter("ORADD2"));
			ovo.setPHONE(request.getParameter("ORP"));
		}
		prm.put("RSEQ", ovo.getRSEQ());
		prm.put("ID", ovo.getID());
		prm.put("ovo", ovo);
		ms.insertOrders(prm);
		int result = Integer.parseInt(prm.get("result") + "");
        if(result  == 2) return "redirect:/orderForm";
		return "redirect:/memberOrderList?page=1&oa=";
	}
	
	@RequestMapping("memberOrderList") // 주문내역 조회
	public String memberOrderList(HttpServletRequest request,HttpSession session,Model model, OrderVO ovo, @RequestParam("oa") String oa ) {
		session.setAttribute("oa", oa);
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null) return "member/memberLogin";
		HashMap<String,Object> prm = new HashMap<String,Object>();
		prm.put("ID", loginUser.get("ID")+"");
		prm.put("oa", oa);
		prm.put("request", request);
		ms.memberOrderList(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("list", list);
		model.addAttribute("paging", (Paging)prm.get("paging"));
		return "member/memberOrderList";
	}
	
	@RequestMapping("/memberOrderDetail") // 오더 디테일
	public String memberOrderDetail(HttpSession session,Model model,@RequestParam("OSEQ")int OSEQ) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		HashMap<String, Object> prm = new HashMap<String, Object>();
		prm.put("OSEQ", OSEQ);
		ms.getOrderDetail(prm);
		ArrayList<HashMap<String,Object>> list1 = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor1");
		ArrayList<HashMap<String,Object>> list2 = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor2");
		ArrayList<HashMap<String,Object>> list3 = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor3");
		model.addAttribute("ovo", list1.get(0));
		model.addAttribute("ovList", list2);
		if(list3.size()!=0)model.addAttribute("review", list3.get(0));
		return "member/memberOrderDetail";
	}
	
	@RequestMapping(value="/memberReviewWrite", method=RequestMethod.POST) // 리뷰 쓰기
	public String memberReviewWrite(HttpServletRequest request, HttpSession session, Model model ) throws IOException {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		String path=context.getRealPath("images/review");
        MultipartRequest multi = new MultipartRequest(
                 request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
        );
		HashMap<String, Object> prm = new HashMap<String, Object>();
		prm.put("ID", multi.getParameter("ID"));
		prm.put("RSEQ", multi.getParameter("RSEQ"));
		prm.put("STAR", multi.getParameter("STAR"));
		prm.put("IMAGE", multi.getFilesystemName("IMAGE"));
		prm.put("CONTENT", multi.getParameter("CONTENT"));
		prm.put("OSEQ", multi.getParameter("OSEQ"));
		prm.put("NICK", multi.getParameter("NICK"));
		ms.memberReviewWrite(prm);
		return "redirect:/memberOrderDetail?OSEQ="+prm.get("OSEQ");
	}
	
}
