package fooba.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fooba.dao.IAdminDao;
import fooba.dto.Paging;
import fooba.dto.QnaVO;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;

	public void getAdmin(HashMap<String, Object> prm) {
		adao.getAdmin(prm);
	}

	public void adminList(HashMap<String, Object> prm) {
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		String key = "";
		 int page = 1;
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			session.removeAttribute("key");
			request.removeAttribute("page");
			request.removeAttribute("key");
		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
	        
	        if(request.getParameter("key")!=null) {
	           session.setAttribute("key", request.getParameter("key"));
	           key = request.getParameter("key");
	        } else if (session.getAttribute("key")!=null)
	           key = (String)session.getAttribute("key");
		}
		
		Paging paging = new Paging();
		paging.setPage(page);
		if ((prm.get("table")+"").equals("b")) paging.setDisplayRow(5);
		prm.put("cnt", 0);
		prm.put("key", key);
		adao.adminGetAllCount(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		adao.adminList(prm);
	}

	public void admin_resOx(HashMap<String, Object> prm) {
		adao.admin_resOx(prm);
	}

	public void admin_orderLR(HashMap<String, Object> prm) {
		adao.admin_orderLR(prm);
	}

	public void adminQna(HashMap<String, Object> prm) {
		adao.adminQna(prm);
	}

	public void adminDetail(HashMap<String, Object> prm) {
		adao.adminDetail(prm);
	}



	
}
