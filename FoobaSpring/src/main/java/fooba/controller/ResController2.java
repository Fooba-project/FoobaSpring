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

	@RequestMapping("/res_foodmenu")
		public String res_foodmenu(HttpServletRequest request, HttpSession session, Model model
		) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
			HashMap<String , Object> paramMap = new HashMap<String , Object>();
			HashMap<String , Object> rvo=(HashMap<String, Object>)session.getAttribute("loginRes");
			paramMap.put("rseq",rvo.get("RSEQ"));
			paramMap.put("ref_cursor", null);

			rs.foodList( paramMap );
			ArrayList<HashMap<String, Object>> list
				=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			model.addAttribute("FoodList",list);
		return "restaurant/res_foodmenu";  
	}
	
	@RequestMapping("/res_foodmenuUpdateForm")
		public String res_foodmenuUpdateForm(HttpServletRequest request, HttpSession session, Model model,
				@RequestParam("fseq") int fseq,@RequestParam(value="message",required=false)String message) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
			HashMap<String , Object> paramMap = new HashMap<String , Object>();
			
			paramMap.put("fseq", fseq);
			paramMap.put("ref_cursor", null);
			rs.selectFood(paramMap);
			ArrayList<HashMap<String, Object>> list
			=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			HashMap<String , Object> rvo=(HashMap<String, Object>)session.getAttribute("loginRes");
			model.addAttribute("RestaurantVO",rvo);
			model.addAttribute("FoodmenuVO", list.get(0));		
			if(message!=null) model.addAttribute("messagex","빈칸을 채워주세요.");
		return "restaurant/res_foodmenuUpdateForm";  
	}
	
	@RequestMapping("/res_foodmenuUpdate")
	public String res_foodmenuUpdate(@ModelAttribute("FoodmenuVO") @Valid FoodmenuVO fvo, BindingResult result,
			HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		
		if(result.getFieldError("fname")!=null) {
		}else if(result.getFieldError("fprice")!=null) {
		}else if(result.getFieldError("fimage")!=null) {
		}else if(result.getFieldError("fcontent")!=null) {
		}else if(result.getFieldError("fside1")!=null) {
		}else if(result.getFieldError("fsideprice1")!=null) {
		}else if(result.getFieldError("fside2")!=null) {
		}else if(result.getFieldError("fsideprice2")!=null) {
		}else if(result.getFieldError("fside3")!=null) {
		}else if(result.getFieldError("fsideprice3")!=null) {
		}else {
	
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("fseq", Integer.parseInt(request.getParameter("fseq")));
		paramMap.put("fname", request.getParameter("fname"));
		paramMap.put("fprice", Integer.parseInt(request.getParameter("fprice")));
		paramMap.put("fcontent", request.getParameter("fcontent"));
		paramMap.put("fside1", request.getParameter("fside1"));
		paramMap.put("fsideprice1", Integer.parseInt(request.getParameter("fsideprice1")));
		paramMap.put("fside2", request.getParameter("fside2"));
		paramMap.put("fsideprice2", Integer.parseInt(request.getParameter("fsideprice2")));
		paramMap.put("fside3", request.getParameter("fside3"));
		paramMap.put("fsideprice3", Integer.parseInt(request.getParameter("fsideprice3")));
		if(request.getParameter("fimage")==null||request.getParameter("fimage").equals("")) paramMap.put("fimage",request.getParameter("oldImage"));
        else paramMap.put("fimage", request.getParameter("fimage")); 
		rs.updateFoodMenu(paramMap);
		return "redirect:/res_foodmenu";
		}
		return "redirect:/res_foodmenuUpdateForm?fseq="+fvo.getFseq()+"&message=1";
		
	}
	
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="ResImgfileUp", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> ResImgfileUp(Model model, HttpServletRequest request){

		String path = context.getRealPath("images/foodmenu");
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			result.put("STATUS", 1);
			result.put("FILENAME", multi.getFilesystemName("fileimage"));
		} catch (IOException e) {e.printStackTrace();
		}
		return result; 
	}
	
	
	@RequestMapping("/res_foodmenuAddForm")
	public String res_foodmenuAddForm(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		HashMap<String , Object> paramMap = new HashMap<String , Object>();
		paramMap.put("ref_cursor", null);
		ArrayList<HashMap<String, Object>> list
		=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		
		HashMap<String , Object> rvo=(HashMap<String, Object>)session.getAttribute("loginRes");
		model.addAttribute("RestaurantVO",rvo);	
		
		return "restaurant/res_foodMenuAdd";
	}

	@RequestMapping("/res_foodmenuAdd")
	public String res_foodmenuAdd(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
			
			HashMap<String , Object> paramMap = new HashMap<String , Object>();
			paramMap.put("rseq", Integer.parseInt(request.getParameter("rseq")));
			paramMap.put("fseq", Integer.parseInt(request.getParameter("fseq")));
			paramMap.put("fname", request.getParameter("fname"));
			paramMap.put("price", Integer.parseInt(request.getParameter("price")));
			paramMap.put("content", request.getParameter("content"));
			paramMap.put("fside1", request.getParameter("fside1"));
			paramMap.put("fsideprice1", Integer.parseInt(request.getParameter("fsideprice1")));
			paramMap.put("fside2", request.getParameter("fside2"));
			paramMap.put("fsideprice2", Integer.parseInt(request.getParameter("fsideprice2")));
			paramMap.put("fside3", request.getParameter("fside3"));
			paramMap.put("fsideprice3", Integer.parseInt(request.getParameter("fsideprice3")));
			paramMap.put("fimage", request.getParameter("fimage"));
			
			rs.addFoodMenu(paramMap);
		return "redirect:/res_foodmenu";	
	}
	
	@RequestMapping("/res_foodmenuDelete")
	public String res_foodmenuDelete(HttpServletRequest request, HttpSession session, Model model,
			@RequestParam("fseq") int fseq) {
		if(session.getAttribute("loginRes")==null) return "redirect:/res_loginForm";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fseq", fseq);
		rs.deleteFoodMenu(paramMap);
		return "redirect:/res_foodmenu";
	}
	
	
}
