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

<c:if test="${size==1}">
	
<div id="maintextbox">
	<div id="imgss" 
		style="position:absolute; left:0px; top:0px; width:1920px;text-align:left;">
			<c:forEach items="${bannerList }"  var="bannerVO">
				<img src="images/${bannerVO.IMAGE}" style="width:1920px;height:500px;" >
			</c:forEach>
		    <span id="maintext">음식은 푸바, 
		        배달은 푸바!
		    </span>
     </div>
</div>
</c:if>


<c:if test="${size==2}">	
<div id="maintextbox">
	<div id="imgss" 
		style="position:absolute; left:0px; top:0px; width:3842px;text-align:left; height:500px"><c:forEach items="${bannerList }"  var="bannerVO"><img src="images/${bannerVO.BIMAGE}" style="width:1920px; height:500px" ></c:forEach></div>
     	<span id="maintext">음식은 푸바, 
		        배달은 푸바!
		    </span>
</div>
<script type="text/javascript">
$(function(){
	var num=0;
	setInterval(function(){
        $('#imgss').animate({ left : num * -1920 },2000);
            num++;
            if(num==2)num=0;
    }, 4000);
});
</script>	
</c:if>


<c:if test="${size==3}">
	
<div id="maintextbox">
	<div id="imgss" 
		style="position:absolute; left:0px; top:0px; width:5763px;text-align:left; height:500px"><c:forEach items="${bannerList }"  var="bannerVO"><img src="images/${bannerVO.BIMAGE}" style="width:1920px; height:500px" ></c:forEach></div>
     	<span id="maintext">음식은 푸바, 
		        배달은 푸바!
		    </span>
</div>
<script type="text/javascript">
$(function(){
	var num=0;
	setInterval(function(){
        $('#imgss').animate({ left : num * -1920 },2000);
            num++;
            if(num==3)num=0;
    }, 6000);
});
</script>	
</c:if>

     
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

    <form id="search" name="search" method="post" action="search">
        <input type="text" name="searchtext" id="searchtext"  placeholder="검색어를 입력하세요"  size="30px" value="${search}"/>
        <div id="searchicon1">
        	<button type="button" title="search" id="btn" name="btn" onClick="go_search2()" style="cursor:pointer"><img src="images/search.png"></button>
   		</div>
   		<input type="submit" style="display:none;">
    </form>

    <div id="kindboxes">
	        <a href="category?KIND=1&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">한식</span><br>
	                <img src="images/korean.png">
	            </div>
			</a>
		    <a href="category?KIND=2&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">중식</span><br>
	                <img src="images/china.png">
	            </div>
            </a>
            <a href="category?KIND=3&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">양식</span><br>
	                <img src="images/western.png">
	            </div>
            </a>
            <a href="category?KIND=4&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">일식</span><br>
	                <img src="images/japan.png">
	            </div>
            </a>
            <a href="category?KIND=5&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">피자</span><br>
	                <img src="images/pizza.png">
	            </div>
            </a>
            <a href="category?KIND=6&search=&HASH=">
	             <div class="kindbox">
	                   <span class="kindtext">치킨</span><br>
	                   <img src="images/chicken.png">
	             </div>
             </a> 
             <a href="category?KIND=7&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">분식</span><br>
	                <img src="images/bunsic.png">
	            </div>
            </a>
            <a href="category?KIND=8&search=&HASH=">
	            <div class="kindbox">
	                <span class="kindtext">디저트</span><br>
	                <img src="images/dessert.png">
	            </div>
            </a>
        </div>
</div>

<%@ include file="footer.jsp"%>