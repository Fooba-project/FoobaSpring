package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao2;
import fooba.dto.RestaurantVO;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;

	public void getMember(HashMap<String, Object> prm) {
		
		mdao.getMember(prm);
		
	}

	public void SearchResList(HashMap<String, Object> prm) {
		HttpServletRequest request	= (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();		
		
		String search = "";
		if( request.getParameter("search") != null ) search = request.getParameter("search");
		prm.put("searchtext", search);
		
		mdao.SearchResList(prm);
		
		ArrayList< HashMap<String,Object> > list 
		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
		for(HashMap<String,Object> a : list) {
			int rseq=Integer.parseInt(a.get("RSEQ")+"");
			prm.put("rseq", rseq);
			prm.put("fimage", "" );
			mdao.FimagebyRseq(prm);
			String fimage=(String)prm.get("fimage");
			a.put("RIMAGE",fimage);
		}
		
		String hash = "";
		if( request.getParameter("hash") != null ) search = request.getParameter("hash");
		prm.put("searchtext", search);
		
		mdao.SearchResList(prm);
	}
	
}
