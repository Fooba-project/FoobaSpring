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

import fooba.dto.FoodmenuVO;
import fooba.dto.OrderVO;
import fooba.dto.RestaurantVO;
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
	
	@RequestMapping("/res_loginForm")  //레스토랑 로그인 창 이동
	public String res_loginForm(HttpSession session) {
		if(session.getAttribute("loginRes")!=null) return "redirect:/res_foodmenu";
		return "restaurant/res_login";
	}
	
	@RequestMapping(value="/res_login",method=RequestMethod.POST) //레스토랑 로그인 
	public String res_login(@ModelAttribute("loginRes")@Valid RestaurantVO vo,
			 BindingResult result, HttpSession session, Model model) { 
		
		String url="restaurant/res_login"; 
		if(result.getFieldError("RID")!=null)
			model.addAttribute("message",result.getFieldError("RID").getDefaultMessage());
		else if(result.getFieldError("RPWD")!=null)
			model.addAttribute("message",result.getFieldError("RPWD").getDefaultMessage());
		else {

			HashMap<String,Object>paramMap=new HashMap<String,Object>();
			paramMap.put("RID",vo.getRID());
			paramMap.put("ref_cursor",null);
			
			rs.getRes(paramMap);
		
			ArrayList<HashMap<String,Object>> list
			=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			
			if(list.size()==0) {
				model.addAttribute("message","아이디가 없습니다.");
				return url;
			}
			HashMap<String,Object>Rvo=list.get(0);
			if(!Rvo.get("RPWD").equals(vo.getRPWD()))
				model.addAttribute("message","비번이 틀립니다.");
			else if(Integer.parseInt(Rvo.get("RYN")+"")==4)
				model.addAttribute("message","정지계정입니다 관리자에게 문의하세요!");
			else if(Integer.parseInt(Rvo.get("RYN")+"")==0)
				model.addAttribute("message","등급심사중입니다. 조금만 기다려주세요.");
			else if(Rvo.get("RPWD").equals(vo.getRPWD())) {
				session.setAttribute("loginRes",Rvo);
				url="redirect:/res_foodmenu";
				
				paramMap.put("RSEQ",Rvo.get("RSEQ"));
				rs.starAvg(paramMap);
				System.out.println("123");
				session.setAttribute("intstar",paramMap.get("intstar")); //별 개수
				session.setAttribute("doublestar",paramMap.get("doublestar")); //별점(소수점까지)
				/**/
				session.removeAttribute("message");
				
			}			
		}
		return url;
	}
	
	@RequestMapping(value="/res_logout") //로그아웃
	public String res_logout(HttpSession session) {
		session.removeAttribute("loginRes");
		session.removeAttribute("intstar");
		session.removeAttribute("doublestar");
		return "redirect:/res_loginForm";
	}
	
	@RequestMapping("/res_FindIdForm") //아이디 찾기 창 이동
	public String res_FindIdForm() {
		return"restaurant/res_FindId";
	}
	
	@RequestMapping(value="res_FindId") //아이디 찾기
	public String res_FindId(@RequestParam(value="rname" ,required=false)String rname,@RequestParam(value="rphone",required=false)String rphone,Model model) {
		HashMap<String,Object>paramMap=new HashMap<String,Object>();
		paramMap.put("rname",rname);
		paramMap.put("ref_cursor",null);
		rs.resFindId(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		if(list.size()==0) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요1.");
			return "restaurant/res_FindId";
		}else {
			HashMap<String,Object> rvo=list.get(0);
			if(!rvo.get("RPHONE").equals(rphone)) {
				model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요2.");
				return "restaurant/res_FindId";
			}
			else {
				model.addAttribute("message","귀하의 아이디는 '"+rvo.get("RID")+"'입니다.");
				return  "restaurant/res_login";
			}
		}
	}
	
	@RequestMapping("/res_FindPwForm") //비밀번호 찾기 창 이동
	public String res_FindPwForm() {
		return"restaurant/res_FindPw";
	}
	
	@RequestMapping(value="/res_FindPw",method=RequestMethod.POST) //비밀번호 찾기
	public String res_FindPw(@RequestParam(value="rname",required=false)String rname,@RequestParam(value="rphone",required=false)String rphone,
			@RequestParam("rid")String rid,Model model) {
		HashMap<String,Object>paramMap=new HashMap<String,Object>();
		paramMap.put("rid",rid);
		paramMap.put("ref_cursor",null);
		rs.getRes(paramMap);
		
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		if(list.size()==0) {
			model.addAttribute("message","아이디가 없습니다.");
			return "restaurant/res_FindPw";
		}
		HashMap<String,Object> rvo=list.get(0);
		if(!rvo.get("RPHONE").equals(rphone)||!rvo.get("RNAME").equals(rname)) {
			model.addAttribute("message","일치하는 정보가 없습니다. 다시 입력하세요.");
			return "restaurant/res_FindPw";
		}
		else {
			model.addAttribute("message","귀하의 비밀번호는 '"+rphone+"'로 전송되었습니다.");
			return "restaurant/res_login";
		}
	}
	
	@RequestMapping("/res_show") //레스토랑 현황 창 이동
	public String res_show(HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		return "restaurant/res_show";
		
	}
	@RequestMapping("/res_joinForm") //레스토랑 회원가입 창 이동
	public String res_joinForm() {
		return"restaurant/res_join";
	}
	@Autowired
	ServletContext context;
	
	
	
	@RequestMapping(value="/res_idCheckForm") //아이디 중복 확인
	public String res_idCheckForm(@RequestParam("RID")String rid,Model model) {
		HashMap<String,Object>paramMap=new HashMap<String,Object>();
		paramMap.put("RID",rid);
		paramMap.put("ref_cursor",null);
		rs.getRes(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		if(list.size()==0)
			model.addAttribute("result",-1);
		else model.addAttribute("result",1);
		model.addAttribute("RID",rid);
		return "restaurant/res_idcheck";
	}
	
	@RequestMapping(value="/res_join",method=RequestMethod.POST) //레스토랑 회원가입
	public String res_join(@ModelAttribute("vo")@Valid RestaurantVO vo,BindingResult result,
			@RequestParam(value="reid",required=false)String reid, 
			@RequestParam(value="respwdchk",required=false)String respwdchk,Model model) {
		
		model.addAttribute("reid",reid);
		model.addAttribute("respwdchk",respwdchk);
		
		if(result.getFieldError("RID")!=null) {
			model.addAttribute("message",result.getFieldError("RID").getDefaultMessage());			
		}else if(result.getFieldError("RPWD")!=null) {
			model.addAttribute("message",result.getFieldError("RPWD").getDefaultMessage());			
		}else if(result.getFieldError("OWNERNAME")!=null) {
			model.addAttribute("message",result.getFieldError("OWNERNAME").getDefaultMessage());					
		}else if(result.getFieldError("RNAME")!=null) {
			model.addAttribute("message",result.getFieldError("RBIZNUM").getDefaultMessage());	
		}else if(result.getFieldError("RBIZNUM")!=null) {
			model.addAttribute("message",result.getFieldError("RNAME").getDefaultMessage());
		}else if(result.getFieldError("RPHONE")!=null) {
			model.addAttribute("message",result.getFieldError("RPHONE").getDefaultMessage());
		}else if(result.getFieldError("ZIP_NUM")!=null) {
			model.addAttribute("message",result.getFieldError("ZIP_NUM").getDefaultMessage());
		}else if(result.getFieldError("RADDRESS")!=null) {
			model.addAttribute("message",result.getFieldError("RADDRESS").getDefaultMessage());
		}else if(result.getFieldError("RADDRESS2")!=null) {
			model.addAttribute("message",result.getFieldError("RADDRESS2").getDefaultMessage());
		}else if(result.getFieldError("KIND")!=null) {
			model.addAttribute("message",result.getFieldError("KIND").getDefaultMessage());
		}else if(result.getFieldError("CONTENT")!=null) {
			model.addAttribute("message",result.getFieldError("CONTENT").getDefaultMessage());
		}else if(result.getFieldError("RTIP")!=null) {
			model.addAttribute("message",result.getFieldError("RTIP").getDefaultMessage());
		}else if(result.getFieldError("HASH")!=null) {
			model.addAttribute("message",result.getFieldError("HASH").getDefaultMessage());
		}else if(result.getFieldError("RIMAGE")!=null) {
			model.addAttribute("message",result.getFieldError("RIMAGE").getDefaultMessage());
		}else if(!reid.equals(vo.getRID())){
			model.addAttribute("message","아이디 중복확인을 하세요.");	
		}else if(!respwdchk.equals(vo.getRPWD())){
			model.addAttribute("message","비밀번호가 일치하지 않습니다.");	
		}else {
			rs.joinRes(vo);
			model.addAttribute("message","회원가입이 완료되었습니다.");
			return "restaurant/res_login";
		}
		return "restaurant/res_join";
	}
	
	@RequestMapping("/res_updateForm") //레스토랑 회원 정보 변경 창 이동
	public String res_updateForm(HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		return "restaurant/res_updateForm";
	}
	
	//파일업로드를 위한 메서드
	@RequestMapping(value="fileup2",method=RequestMethod.POST)
	@ResponseBody	
	public HashMap<String , Object>fileup2(Model model,HttpServletRequest request){
		
		String path=context.getRealPath("images/title/");
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
	
	@RequestMapping(value="/res_update",method=RequestMethod.POST) //레스토랑 회원 정보 변경
	public String res_update(HttpSession session,@ModelAttribute("loginRes")@Valid RestaurantVO vo,
			BindingResult result,Model model ,@RequestParam("oldImage")String oldImage) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		
		String NEWRIMAGE = vo.getRIMAGE();
		if( vo.getRIMAGE().equals("") ) vo.setRIMAGE(oldImage);
		else model.addAttribute("NEWRIMAGE", NEWRIMAGE);
		
		if(result.getFieldError("CONTENT")!=null) {
			model.addAttribute("message",result.getFieldError("CONTENT").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("RPHONE")!=null) {
			model.addAttribute("message",result.getFieldError("RPHONE").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("RPHONE")!=null) {
			model.addAttribute("message",result.getFieldError("RPHONE").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("ZIP_NUM")!=null) {
			model.addAttribute("message",result.getFieldError("ZIP_NUM").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("RADDRESS")!=null) {
			model.addAttribute("message",result.getFieldError("RADDRESS").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("RADDRESS2")!=null) {
			model.addAttribute("message",result.getFieldError("RADDRESS2").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("RTIP")!=null) {
			model.addAttribute("message","배달팁을 입력하세요");
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else if(result.getFieldError("HASH")!=null) {
			model.addAttribute("message",result.getFieldError("HASH").getDefaultMessage());
			if( !NEWRIMAGE.equals("")  ) 	vo.setRIMAGE(oldImage);
		}else{
			rs.updateRes(vo);
			
			session.removeAttribute("loginRes");
			
			HashMap<String,Object>paramMap=new HashMap<String,Object>();
			paramMap.put("RID",vo.getRID());
			paramMap.put("ref_cursor",null);
			rs.getRes(paramMap);
			ArrayList<HashMap<String,Object>> list
			=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			session.setAttribute("loginRes",list.get(0));
			
			return "restaurant/res_show";
			
		}
		return "restaurant/res_updateForm";
	}
	@RequestMapping("/res_withdrawal") //레스토랑 회원 탈퇴
	public String res_withdrawal(HttpSession session,Model model) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
		rs.withdrawal((String)loginRes.get("RID"));
		session.removeAttribute("loginRes");
		model.addAttribute("message","아이디가 정지 되었습니다. 복구요청은 고객센터에 전화주세요");
		return "restaurant/res_login";
	}
		
		@RequestMapping("/res_review") //주문 리뷰 확인 
		public String res_review( HttpSession session, Model model, @ModelAttribute("key")int key) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		
		paramMap.put("ref_cursor", null);
		paramMap.put("RSEQ",loginRes.get("RSEQ"));
		paramMap.put("key", key);
		rs.selectReview(paramMap); 
		ArrayList<HashMap<String, Object>> list
		=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		model.addAttribute("list",list);
		if(session.getAttribute("x")!=null) {model.addAttribute("message","답글을 입력해주세요");
		session.removeAttribute("x");
		}
		return "restaurant/res_reviewList";
	}

		@RequestMapping(value="res_reviewReplyWrite",method=RequestMethod.POST) //주문 리뷰에 답글 작성
		public String res_reviewReplyWrite(@RequestParam(value="REVIEW_SEQ",required=false)String r_seq, 
				@RequestParam(value="REPLY",required=false)String reply, Model model,HttpSession session) {
			HashMap<String , Object> paramMap = new HashMap<String , Object>();
			paramMap.put("r_seq",r_seq);
			paramMap.put("reply",reply);
			System.out.println(reply+"yyyy");
			if (reply==null||reply.equals("")) session.setAttribute("x", 1);
			else rs.updateReply(paramMap);
			return "redirect:/res_review?key=2";
			
		}
		

		@RequestMapping("/res_order") //주문 확인 창
			public String res_order( HttpSession session, Model model, OrderVO ovo){
			HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
			if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
			HashMap<String , Object> paramMap = new HashMap<String , Object>();	
			paramMap.put("RSEQ", loginRes.get("RSEQ"));
			paramMap.put("ref_cursor",null);
			rs.selectOrdersIngByRseq(paramMap);
			ArrayList<HashMap<String,Object>> list
			=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			model.addAttribute("res_OrderList",list);
		
			return "restaurant/res_orderList";		
		}
		
		
		@RequestMapping("/res_orderAll") //전체 주문 확인 창
			public String res_orderAll(HttpSession session, Model model){
			HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
			if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
			HashMap<String , Object> paramMap = new HashMap<String , Object>();	
			paramMap.put("RSEQ", loginRes.get("RSEQ"));
			paramMap.put("ref_cursor",null);
			rs.selectOrdersAllByRseq(paramMap);
			ArrayList<HashMap<String,Object>> list
			=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			model.addAttribute("res_OrderList",list);
			
			return "restaurant/res_orderList";
			
		}
		
		
		@RequestMapping("/res_orderComplete") //주문 단계 변경 (주문 확인, 배달중, 배달완료)
			public String res_orderComplete(HttpSession session, Model model, 
					@RequestParam("OSEQ") int OSEQ){
			HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
			if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("OSEQ", OSEQ);
			rs.nextOrderStatement(OSEQ);
			return "redirect:/res_order";	
		}
		
		@RequestMapping("/res_foodmenu") //레스토랑 메뉴 창
		public String res_foodmenu(HttpSession session, Model model) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("ref_cursor", null);
		paramMap.put("RSEQ", loginRes.get("RSEQ"));
		rs.foodList( paramMap );
		ArrayList<HashMap<String, Object>> list
			=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		model.addAttribute("list",list);
		return "restaurant/res_foodmenu";  
	}
		

	@RequestMapping("/res_foodmenuAddForm") //메뉴 추가 창 이동
		public String res_foodmenuAddForm(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		return "restaurant/res_foodMenuAdd";
	}

	@RequestMapping("/res_foodmenuUpdateForm") //메뉴 변경 창 이동
		public String res_foodmenuUpdateForm(HttpSession session, Model model,
				@RequestParam("FSEQ") int FSEQ) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";

		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("FSEQ", FSEQ);
		paramMap.put("ref_cursor", null);
		rs.selectFood(paramMap);
		ArrayList<HashMap<String, Object>> list
		= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
				
		model.addAttribute("vo", list.get(0));		 
		return "restaurant/res_foodmenuUpdateForm";  
	}
	
	
	@RequestMapping("/res_foodmenuUA") //레스토랑 메뉴 추가,변경
		public String res_foodmenuUA(@ModelAttribute("vo") @Valid FoodmenuVO vo, BindingResult result,
			HttpSession session, Model model, @RequestParam("procedure") String procedure,
			@RequestParam(value="OLDIMAGE", required=false) String OLDIMAGE) {
		
			String NEWFIMAGE = vo.getFIMAGE();
			
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		String url = "restaurant/res_foodMenuAdd";
		
		if(procedure.equals("update")) {
			if(vo.getFIMAGE()==null||vo.getFIMAGE().equals("")) vo.setFIMAGE(OLDIMAGE);
			else model.addAttribute("NEWFIMAGE",NEWFIMAGE);
			
			url = "restaurant/res_foodmenuUpdateForm";
		}else {if(result.getFieldError("FIMAGE")!=null) {model.addAttribute("messagex","이미지를 넣어주세요.");
			return "restaurant/res_foodMenuAdd";}
		 
		}

		if(result.getFieldError("FNAME")!=null) { model.addAttribute("messagex","이름을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FPRICE")!=null) { model.addAttribute("messagex","가격을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FCONTENT")!=null) { model.addAttribute("messagex","내용을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDE1")!=null)  { model.addAttribute("messagex","메뉴를 추가하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDEPRICE1")!=null)  { model.addAttribute("messagex","가격을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDE2")!=null)  { model.addAttribute("messagex","메뉴를 추가하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDEPRICE2")!=null)  { model.addAttribute("messagex","가격을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDE3")!=null)  { model.addAttribute("messagex","메뉴를 추가하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}
		else if(result.getFieldError("FSIDEPRICE3")!=null)  { model.addAttribute("messagex","가격을 입력하세요.");
			if (!NEWFIMAGE.equals(""))vo.setFIMAGE(OLDIMAGE);}

		else {
			url = "redirect:/res_foodmenu";
			if(procedure.equals("update")) rs.updateFoodMenu(vo);
			else rs.addFoodMenu(vo);
		}
		return url;
	}
	
	//레스토랑 메뉴 이미지 추가 메서드
	@RequestMapping(value="ResImgfileUp", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> ResImgfileUp(Model model, HttpServletRequest request) throws IOException{

		String path = context.getRealPath("images/foodmenu");
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		MultipartRequest multi = new MultipartRequest(
			request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy() 	);
		
		result.put("STATUS", 1);
		result.put("FILENAME", multi.getFilesystemName("fileimage"));
		
		return result; 
	}
	

		
	@RequestMapping("/res_foodmenuDelete") //메뉴 삭제
		public String res_foodmenuDelete(HttpServletRequest request, HttpSession session,
			@RequestParam("FSEQ") int FSEQ) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("FSEQ", FSEQ);
		rs.deleteFoodMenu(paramMap);
		return "redirect:/res_foodmenu";
	}
	
	@RequestMapping("/res_fooba_tos") // 이용약관 창 이동
		public String res_fooba_tosAction() {
		return "restaurant/res_fooba_tos";
	}
	
	@RequestMapping("/res_fooba_privacy") //개인정보 처리방침 창 이동
		public String res_fooba_privacy() {
		return "restaurant/res_fooba_privacy";
	}
	
	@RequestMapping("/res_qnalist_footer") //QNA 창 이동
		public String res_qnalist_footer() {
		return "restaurant/res_qnalist_footer";
	}
	
	
	
	@RequestMapping("/res_restaurantRestReturn") // 레스토랑 상태(영업중, 휴업) 변경
		public String res_restaurantRestReturn(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("RSEQ", loginRes.get("RSEQ"));
		int ryn=0;
		if(Integer.parseInt(loginRes.get("RYN")+"")==1) ryn=3;
		else if(Integer.parseInt(loginRes.get("RYN")+"")==3) ryn=1;
		paramMap.put("RYN", ryn);
		rs.restRes( paramMap );
		
		session.removeAttribute("loginRes");
		paramMap.put("RID",loginRes.get("RID"));
		paramMap.put("ref_cursor",null);
		rs.getRes(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		session.setAttribute("loginRes",list.get(0));		
		return"redirect:/res_foodmenu";
	}	
	
		
}

