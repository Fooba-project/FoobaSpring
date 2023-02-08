<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    
	<div id="mainlist">
		
		
		
	<form id="search" name="search" method="post" action="fooba.do?command=search&hash=">
        <c:choose>
	    	<c:when test="${search!=null && search!=''}">
	        	<input type="text" name="searchtext" id="searchtext" placeholder="${search }" size="30px"/>
	        </c:when>
	        <c:otherwise>
	        	<input type="text" name="searchtext" id="searchtext" placeholder="검색어를 입력하세요" size="30px"/>
	        </c:otherwise>
        </c:choose>
        
        <div id="searchicon1">
        	<button type="button" title="search" id="btn" name="btn" onClick="go_search2()" style="cursor:pointer"><img src="images/search.png"></button>
   		</div>
   		<input type="submit" style="display:none;">
    </form>
		
    	
        <div id="kindboxeslist">
	        <a href="fooba.do?command=category&kind=1&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">한식</span><br>
	                <img src="images/korean.png">
	            </div>
			</a>
		    <a href="fooba.do?command=category&kind=2&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">중식</span><br>
	                <img src="images/china.png">
	            </div>
            </a>
            <a href="fooba.do?command=category&kind=3&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">양식</span><br>
	                <img src="images/western.png">
	            </div>
            </a>
            <a href="fooba.do?command=category&kind=4&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">일식</span><br>
	                <img src="images/japan.png">
	            </div>
            </a>
            <a href="fooba.do?command=category&kind=5&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">피자</span><br>
	                <img src="images/pizza.png">
	            </div>
            </a>
            <a href="fooba.do?command=category&kind=6&search=&hash=">
	             <div class="kindbox">
	                   <span class="kindtext">치킨</span><br>
	                   <img src="images/chicken.png">
	             </div>
             </a> 
             <a href="fooba.do?command=category&kind=7&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">분식</span><br>
	                <img src="images/bunsic.png">
	            </div>
            </a>
            <a href="fooba.do?command=category&kind=8&search=&hash=">
	            <div class="kindbox">
	                <span class="kindtext">디저트</span><br>
	                <img src="images/dessert.png">
	            </div>
            </a>
        </div>
	</div>