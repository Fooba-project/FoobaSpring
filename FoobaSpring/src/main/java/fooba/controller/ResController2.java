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
import fooba.service.ResService;
import fooba.service.ResService2;

@Controller
public class ResController2 {
	
	@Autowired
	ResService2 rs;

	@Autowired
	ServletContext context;
	
	@RequestMapping("/res_foodmenu")
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
	
	@RequestMapping("/res_foodmenuUpdateForm")
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
	
	@RequestMapping("/res_foodmenuUA")
		public String res_foodmenuUA(@ModelAttribute("vo") @Valid FoodmenuVO vo, BindingResult result,
			HttpSession session, Model model, @RequestParam("procedure") String procedure,
			@RequestParam(value="OLDIMAGE", required=false) String OLDIMAGE) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		String url = "restaurant/res_foodMenuAdd";
		if(procedure.equals("update")) {
			if(vo.getFIMAGE()==null||vo.getFIMAGE().equals("")) vo.setFIMAGE(OLDIMAGE);
			url = "restaurant/res_foodmenuUpdateForm";
		}else {if(result.getFieldError("FIMAGE")!=null) model.addAttribute("messagex","내용을 입력하세요.");}
		if(result.getFieldError("FNAME")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FPRICE")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FCONTENT")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDE1")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDEPRICE1")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDE2")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDEPRICE2")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDE3")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else if(result.getFieldError("FSIDEPRICE3")!=null) model.addAttribute("messagex","내용을 입력하세요.");
		else {
			url = "redirect:/res_foodmenu";
			if(procedure.equals("update")) rs.updateFoodMenu(vo);
			else rs.addFoodMenu(vo);
		}
		return url;
	}
			
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
	
	
	@RequestMapping("/res_foodmenuAddForm")
		public String res_foodmenuAddForm(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		return "restaurant/res_foodMenuAdd";
	}

		
	@RequestMapping("/res_foodmenuDelete")
		public String res_foodmenuDelete(HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("FSEQ") int FSEQ) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("FSEQ", FSEQ);
		rs.deleteFoodMenu(paramMap);
		return "redirect:/res_foodmenu";
	}
	
	@RequestMapping("/res_fooba_tosAction")
		public String res_fooba_tosAction() {
		return "restaurant/res_fooba_tos";
	}
	
	@RequestMapping("/res_fooba_privacy")
		public String res_fooba_privacy() {
		return "restaurant/res_fooba_privacy";
	}
	
	@RequestMapping("/res_qnalist_footer")
		public String res_qnalist_footer() {
		return "restaurant/res_qnalist_footer";
	}
	
	@Autowired
	ResService rs1;
	
	@RequestMapping("/res_restaurantRestReturn") // 휴업으로 변경
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
		rs1.getRes(paramMap);
		ArrayList<HashMap<String,Object>> list
		=(ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
		session.setAttribute("loginRes",list.get(0));		
		return"redirect:/res_foodmenu";
	}	
	
}
