package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import fooba.dao.IMemberDao2;
import fooba.dto.CartVO;
import fooba.dto.OrderViewVO;
import fooba.dto.Paging;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;
	
	 @Autowired
	   TransactionTemplate tt;
	

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
		int result = 1;
		try {
			tt.execute( new TransactionCallbackWithoutResult(){
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					
					mdao.cartList(prm);
					ArrayList<HashMap<String,Object>> cartList 
			         = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
					 int i = 0;
					 int size = cartList.size();
					 String oname = "";
					for(HashMap<String,Object> hvo : cartList) {
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
					prm.put("oname", oname);
					mdao.insertOrder(prm);
					mdao.lookupOseq(prm);
					int oseq=Integer.parseInt( prm.get("OSEQ")+"");
					prm.put("oseq", oseq);
					for(HashMap<String,Object> hvo : cartList) {
						prm.put("hvo",hvo);
						mdao.insertOrder_Detail( prm );
						mdao.delCart( hvo.get("CSEQ")+"" );
					}	
				}
			});
			System.out.println("Transaction Commit");
		}catch( Exception e) {
			result = 2;
			System.out.println("Transaction RollBack");
		}
		prm.put("result", result);	
	}

	public void memberOrderList(HashMap<String, Object> prm) {
		
		ArrayList<HashMap<String, Object>> orderList = new ArrayList<HashMap<String, Object>>();
		
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		int page=1;
		if( request.getParameter("page")!= null) {
			page = Integer.parseInt( request.getParameter("page") );
			session.setAttribute("page", page);
		}else if( session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		Paging paging = new Paging();
		paging.setPage(page);
		prm.put("paging", paging);
		prm.put("cnt", 0);	// 카운트 커서
		
		mdao.getOrderIngCount(prm); //아이디로 조회 
		
		int count = Integer.parseInt( prm.get("cnt")+"");
		paging.setTotalCount(count);
		
		prm.put("ref_cursor1", null);
		
		mdao.selectOrdersIngById(prm); 
				
		ArrayList<HashMap<String, Object>> odList	
		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor1"); //아이디로 조회한 진행중인 오더리스트를 담은?
				
		
		 for (HashMap<String,Object> rvo : list) { // 현재 주문배송중인 레스토랑수만큼 반복
        	 String oname = "";
        	 prm.put("ref_cursor2", null);
        	 
        	 mdao.selectOrderViewByOseq(rvo);
        	 
        		ArrayList<HashMap<String, Object>> list	
        		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor2");
        	 
        	 int i = 0;
        	 int size = ovList.size();
		 
		 for(HashMap<String,Object> hvo : ovList) {  // 주문한 메뉴별(odseq 수만큼)로 반복
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
		prm.put("oname", oname);
		
		
		
		
		
		
	}
	
	
}
	
