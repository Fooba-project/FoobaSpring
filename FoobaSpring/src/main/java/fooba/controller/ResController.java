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
	
	@RequestMapping("/res_loginForm")
	public String res_loginForm(HttpSession session) {
		if(session.getAttribute("loginRes")!=null) return "redirect:/res_foodmenu";
		return "restaurant/res_login";
	}
	
	@RequestMapping(value="/res_login",method=RequestMethod.POST)
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
	
	@RequestMapping(value="/res_logout")
	public String res_logout(HttpSession session) {
		session.removeAttribute("loginRes");
		session.removeAttribute("intstar");
		session.removeAttribute("doublestar");
		return "redirect:/res_loginForm";
	}
	
	@RequestMapping("/res_FindIdForm")
	public String res_FindIdForm() {
		return"restaurant/res_FindId";
	}
	
	@RequestMapping(value="res_FindId")
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
	
	@RequestMapping("/res_FindPwForm")
	public String res_FindPwForm() {
		return"restaurant/res_FindPw";
	}
	
	@RequestMapping(value="/res_FindPw",method=RequestMethod.POST)
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
	
	@RequestMapping("/res_show")
	public String res_show(HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		return "restaurant/res_show";
		
	}
	@RequestMapping("/res_joinForm")
	public String res_joinForm() {
		return"restaurant/res_join";
	}
	@Autowired
	ServletContext context;
	
	
	
	@RequestMapping(value="/res_idCheckForm")
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
	
	@RequestMapping(value="/res_join",method=RequestMethod.POST)
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
	
	@RequestMapping("/res_updateForm")
	public String res_updateForm(HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		return "restaurant/res_updateForm";
	}
	
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
	
	@RequestMapping(value="/res_update",method=RequestMethod.POST)
	public String res_update(HttpSession session,@ModelAttribute("loginRes")@Valid RestaurantVO vo,
			BindingResult result,Model model ,@RequestParam("oldImage")String oldImage) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		System.out.println(vo.getRIMAGE());
		
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
			System.out.println("xx  "+vo.getRIMAGE());
			
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
	@RequestMapping("/res_withdrawal")
	public String res_withdrawal(HttpSession session,Model model) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		HashMap<String , Object> loginRes = (HashMap<String , Object>)session.getAttribute("loginRes");
		rs.withdrawal((String)loginRes.get("RID"));
		session.removeAttribute("loginRes");
		model.addAttribute("message","아이디가 정지 되었습니다. 복구요청은 고객센터에 전화주세요");
		return "restaurant/res_login";
	}
		
		@RequestMapping("/res_review")
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

		@RequestMapping(value="res_reviewReplyWrite",method=RequestMethod.POST)
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
		
}

