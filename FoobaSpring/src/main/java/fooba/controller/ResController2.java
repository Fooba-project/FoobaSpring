package fooba.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
				@RequestParam("fseq") int fseq) {
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
	
		return "restaurant/res_foodmenuUpdateForm";  
	}
	
	
	
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="fileup", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> fileup(Model model, HttpServletRequest request){

		String path = context.getRealPath("/images/foodmenu");
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

	@RequestMapping("/res_foodemenuAdd")
	public String res_foodemenuUpdate(HttpServletRequest request, HttpSession session) {
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
