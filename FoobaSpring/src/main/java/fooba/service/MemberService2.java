package fooba.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao2;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;

	public void getMember(HashMap<String, Object> prm) {
		mdao.getMember(prm);
		
	}

	public void resList(HashMap<String, Object> prm) {
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		
		if( request.getParameter("first")!=null) 
			session.removeAttribute("search");
		
		String search = "";
		if( request.getParameter("search") != null ) {
			search = request.getParameter("search");
			session.setAttribute("search", search);
		} else if( session.getAttribute("search")!= null ) {
			search = (String)session.getAttribute("search");
		} else {
			session.removeAttribute("search");
		}
		
		HashMap<String, Object> sMap = new HashMap<>();
		sMap.put(search, sMap);
		
	}
	
}
