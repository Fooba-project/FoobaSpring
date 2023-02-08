<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script type="text/javascript">
$(function() {
	$("#searchtext").keypress(function(e){
		//검색어 입력 후 엔터키 입력하면 조회버튼 클릭
		if(e.keyCode && e.keyCode == 13){
			$("#btn").trigger("click");
			return false;
		}
		//엔터키 막기
		if(e.keyCode && e.keyCode == 13){
			  e.preventDefault();	
		}
	});
	$("#btn").click(function(){
		
	});
});
</script>	
<div id="maintextbox">
	<img src="images/background1.jpg">
    <span id="maintext">음식은 푸바, 
        배달은 푸바!
     </span>
</div>
     
<div id="hash">
    <div class="hashboxes">
    	<a href="#" onclick="go_search('푸짐해요')">
	        <div class="hashbox">
	        	<span class="hashtext">#푸짐해요</span>
	        </div>
        </a>
        
        <a href="#" onclick="go_search('매워요')">
	        <div class="hashbox">
		        <span class="hashtext">#매워요</span>
	        </div>
        </a>
        
        <a href="#" onclick="go_search('소울푸드')">
	        <div class="hashbox">
		        <span class="hashtext">#소울푸드</span>
	        </div>
        </a>
        
        <a href="#" onclick="go_search('건강한맛집')">
	        <div class="hashbox">
		        <span class="hashtext">#건강한맛집</span>
	        </div>
	    </a>
        
        <a href="#" onclick="go_search('가성비')">
	        <div class="hashbox">
		        <span class="hashtext">#가성비</span>
	        </div>
        </a>
        
        <a href="#" onclick="go_search('나눠먹어요')">
	        <div class="hashbox">
		        <span class="hashtext">#나눠먹어요</span>
	        </div>
        </a>
        
    </div>
</div>

<div id="main">

    <form id="search" name="search" method="post" action="fooba.do?command=search">
        <input type="text" name="searchtext" id="searchtext"  placeholder="검색어를 입력하세요"  size="30px" value="${search}"/>
        <div id="searchicon1">
        	<button type="button" title="search" id="btn" name="btn" onClick="go_search2()" style="cursor:pointer"><img src="images/search.png"></button>
   		</div>
   		<input type="submit" style="display:none;">
    </form>

    <div id="kindboxes">
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

<%@ include file="footer.jsp"%>