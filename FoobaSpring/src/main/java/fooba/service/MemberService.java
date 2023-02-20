package fooba.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import fooba.dao.IMemberDao;
import fooba.dto.CartVO;
import fooba.dto.MemberVO;
import fooba.dto.Paging;
import fooba.dto.ReviewVO;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

	@Autowired
	TransactionTemplate tt;
	
	public void banner(HashMap<String, Object> prm) {
		mdao.banner(prm);
	}
	
	public void getMember(HashMap<String, Object> paramMap) {
		mdao.getMember(paramMap);
	}

	public void insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);
	}
	
	public void memberUpdate(HashMap<String, Object> prm) {
		mdao.memberUpdate(prm);
	}
	
	public void withdrawalMember(String ID) {
		mdao.withdrawalMember(ID);
	}
	
	public void memberFindId(HashMap<String, Object> prm) {
		mdao.memberFindId(prm);
	}

	public void memberFindPw(HashMap<String, Object> prm) {
		mdao.memberFindPw(prm);
	}

	public void memberQnaList(HashMap<String, Object> prm) {
		mdao.memberQnaList(prm);
	}

	public void SearchResList(HashMap<String, Object> prm) {
		HttpServletRequest request	= (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();		
		String search="";
		String searchtext = "";
		if( request.getParameter("searchtext") != null ) {
			searchtext = request.getParameter("searchtext");
			search=searchtext;
		} // 검색어가 존재할 경우 검색어를 searchtext에 저장

		String hash = "";
		if( request.getParameter("HASH") != null ) {
			searchtext = request.getParameter("HASH");
			search="#"+searchtext;
		} // 해쉬검색어가 존재할 경우 해쉬검색어를 searchtext에 저장
		
		prm.put("search", search); // 검색창까지 가져갈 서치값 미리 저장.
		prm.put("searchtext", searchtext); //  sql에서 조회할 searchtext 저장
		
		mdao.SearchResList(prm);
		
		ArrayList< HashMap<String,Object> > list = (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
		insertFimageByRseq(list); // 레스토랑의 대표 음식사진 조회 및 저장
		prm.put("list", list);
	}
	
	// 레스토랑 대표 음식 사진 조회 및 hash맵 리스트에 저장
	private void insertFimageByRseq(ArrayList<HashMap<String, Object>> list) {
		for(HashMap<String,Object> a : list) {
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("RSEQ", a.get("RSEQ"));
			mdao.FimagebyRseq(prm);
			ArrayList< HashMap<String,Object> > fimageList = (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
			HashMap<String,Object> one = fimageList.get(0);
			a.put("FIMAGE",one.get("FIMAGE"));
		}
	}

	public void searchKind(HashMap<String, Object> prm) {
		HttpServletRequest request	= (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();		
		int KIND =Integer.parseInt(request.getParameter("KIND")); 
		prm.put("KIND",KIND);
		mdao.searchKind(prm);
		ArrayList< HashMap<String,Object> > klist 
		= (ArrayList<HashMap<String, Object>>) prm.get("ref_cursor");
		insertFimageByRseq(klist);
		prm.put("list", klist);
	}

	// 레스토랑 정보 조회
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
						i++;
						oname=oname+hvo.get("CFNAME");
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
					prm.put("OSEQ", 0);
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
		ArrayList<HashMap<String, Object>> orderIngList = new ArrayList<HashMap<String, Object>>();
		
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
		paging.setDisplayRow(5);
		paging.setDisplayPage(10);
		prm.put("cnt", 0);
		
		mdao.getOrderCount(prm);
		
		int count = Integer.parseInt( prm.get("cnt")+"");
		paging.setTotalCount(count);
		paging.paging();
		prm.put("startNum", paging.getStartNum() );
		prm.put("endNum", paging.getEndNum() );
		prm.put("paging", paging);

		mdao.selectOrdersById(prm); 
	}
	
	public void getOrderDetail(HashMap<String, Object> prm) {
		mdao.getOrderbyOseq(prm);
		mdao.selectOrderViewByOseq(prm);
		mdao.getOrderReviewByOseq(prm);
	}
	
	public void writeReview(ReviewVO vo) {
		mdao.writeReview(vo);
	}

	public void reviewComplete(int oseq) {
		mdao.reviewComplete(oseq);
	}
}


