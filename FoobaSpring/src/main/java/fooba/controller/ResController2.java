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
				@RequestParam("fseq") int fseq) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";

		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("fseq", fseq);
		paramMap.put("ref_cursor", null);
		rs.selectFood(paramMap);
		ArrayList<HashMap<String, Object>> list
		= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
				
		model.addAttribute("vo", list.get(0));		 
		return "restaurant/res_foodmenuUpdateForm";  
	}
	
	@RequestMapping("/res_foodmenuUA")
		public String res_foodmenuUpdate(@ModelAttribute("vo") @Valid FoodmenuVO vo, BindingResult result,
			HttpSession session, Model model, @RequestParam("procedure") String procedure,
			@RequestParam(value="oldImage", required=false) String oldImage) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		
		String url = "restaurant/res_foodMenuAdd";
		if(procedure.equals("update")) {
			if(vo.getFIMAGE()==null||vo.getFIMAGE().equals("")) vo.setFIMAGE(oldImage);
			url = "retaurant/res_foodmenuUpdateForm";
		}
		
		if(result.getFieldErrors()!= null) model.addAttribute("messagex","빈칸을 채워주세요.");
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
			@RequestParam("fseq") int fseq) {
		if(session.getAttribute("loginRes")==null) return "restaurant/res_login";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fseq", fseq);
		rs.deleteFoodMenu(paramMap);
		return "redirect:/res_foodmenu";
	}
	
	
}
