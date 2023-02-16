package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IMemberDao2;
import fooba.dto.CartVO;
import fooba.dto.MemberVO;
import fooba.dto.OrderVO;

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
		if( request.getParameter("HASH") != null ) {
			searchtext = request.getParameter("HASH");
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
		
		int kind =Integer.parseInt(request.getParameter("KIND")); 
		prm.put("KIND",kind);
		
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
			hm.put("RSEQ", rseq);
			mdao.FimagebyRseq(hm);
			ArrayList< HashMap<String,Object> > fimageList 
			= (ArrayList<HashMap<String, Object>>) hm.get("ref_cursor");
			HashMap<String,Object> one = fimageList.get(0);
			String fimage=(String)one.get("FIMAGE");
			a.put("FIMAGE",fimage);	
		}	
	}

	public void resInf(HashMap<String, Object> prm) {
		mdao.resInf(prm);		
	}

	public void reviewList(HashMap<String, Object> prm) {
		mdao.reviewList(prm);
		
	}

	public void getFoodDetail(HashMap<String, Object> prm) {
		mdao.getFoodDetail(prm);
		
	}

	public void insertCart(CartVO cvo) {
		mdao.insertCart(cvo);
		
	}

	public void deletecart(HashMap<String, Object> prm) {
		mdao.deletecart(prm);		
	}

	public void cartList(HashMap<String, Object> prm) {
		mdao.cartList(prm);
	}

	public void insertOrders(HashMap<String, Object> prm) {
		mdao.cartList(prm);
		 ArrayList<HashMap<String,Object>> cartList 
         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		 String oname = "";
		 int i = 0;
		 int size = cartList.size();
		 for(HashMap<String,Object> hvo : cartList) {
			 i++;
			 oname=oname+hvo.get("CFNAME")+"";
			 if ( !(""+hvo.get("SIDEYN1")+hvo.get("SIDEYN2")+hvo.get("SIDEYN3")).trim().equals("") ) {
				 oname = oname + " 사이드(";
        		 if (!(""+hvo.get("SIDEYN1")).trim().equals("")) {
        			 oname = oname + hvo.get("SIDEYN1");
        			 if (!(""+hvo.get("SIDEYN2")+hvo.get("SIDEYN3")).trim().equals("")) {
        				 oname = oname + ", ";
        			 }
        		 }
        		 if (!(""+hvo.get("SIDEYN2")).trim().equals("")) {
        			 oname = oname + hvo.get("SIDEYN2");
        			 if (!(""+hvo.get("SIDEYN3")).trim().equals("")) {
        				 oname = oname + ", ";
        			 }
        		 }
        		 if (!(""+hvo.get("SIDEYN3")).trim().equals("")) {
        			 oname = oname + hvo.get("SIDEYN3");
        		 }
        		 if(size==i) oname=oname+") "+hvo.get("QUANTITY")+"개"; // 주문한메뉴갯수==반복횟수 일때
        		 else oname = oname + ") "+hvo.get("QUANTITY")+"개, "; // 주문한메뉴갯수>반복횟수일 때
		 	}else if (size!=i) oname = oname+" "+hvo.get("QUANTITY")+"개, ";// 주문한메뉴갯수>반복횟수일 때
		 	else oname = oname+" "+hvo.get("QUANTITY")+"개";
		 }
		 prm.put("oname",oname);
		mdao.insertOrders(prm);		
	}


	
}
