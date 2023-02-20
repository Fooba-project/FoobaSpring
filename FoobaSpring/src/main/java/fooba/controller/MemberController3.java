package fooba.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import fooba.dto.ReviewVO;
import fooba.service.MemberService3;

@Controller
public class MemberController3 {
	
	@Autowired
	MemberService3 ms;
	
	@Autowired
	ServletContext context;
	
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
		return "memberOrderDetail?OSEQ="+vo.getOSEQ();
	}
	
	
	
}
