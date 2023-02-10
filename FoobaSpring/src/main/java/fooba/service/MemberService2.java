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
		String search="";
		String searchtext = "";
		if( request.getParameter("searchtext") != null ) {
			searchtext = request.getParameter("searchtext");
			search=searchtext;
		}
				
		String hash = "";
		if( request.getParameter("hash") != null ) {
			searchtext = request.getParameter("hash");
			search="#"+searchtext;
		}
		prm.put("search", search);
		prm.put("searchtext", searchtext);
		
		mdao.SearchResList(prm);
		
		ArrayList< HashMap<String,Object> > list 
		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
		
		insertFimageByRseq(list);
		
		prm.put("list", list);
		
	}

	public void searchKind(HashMap<String, Object> prm) {
		HttpServletRequest request	= (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();		
		
		int kind =Integer.parseInt(request.getParameter("kind")); 
		prm.put("kind",kind);
		
		mdao.searchKind(prm);
		
		ArrayList< HashMap<String,Object> > klist 
		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
		
		insertFimageByRseq(klist);
		
		prm.put("list", klist);
	}

	private void insertFimageByRseq(ArrayList<HashMap<String, Object>> list) {
		for(HashMap<String,Object> a : list) {
			HashMap<String, Object> hm = new HashMap<>();
			int rseq=Integer.parseInt(a.get("RSEQ")+"");
			hm.put("rseq", rseq);
			mdao.FimagebyRseq(hm);
			ArrayList< HashMap<String,Object> > fimageList 
			= (ArrayList<HashMap<String, Object>>) hm.get("ref_cursor");
			HashMap<String,Object> one = fimageList.get(0);
			String fimage=(String)one.get("FIMAGE");
			a.put("FIMAGE",fimage);	
		}	
	}
	
}
