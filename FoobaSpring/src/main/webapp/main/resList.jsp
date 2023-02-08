<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_head.jsp"%>
<div class="row">
	<c:forEach items="${RList}" var="RestaurantVO">
   		<div class="resList">        	<a href="fooba.do?command=restaurantDetail&rseq=${RestaurantVO.rseq }&search=&hash=" class="rimage">                
	          	<div class="res_imgbox">
          	 	<img src="images/foodmenu/${RestaurantVO.fimage}" alt="${RestaurantVO.fimage}" id="rtitle">
    	        </div>
       
             	<div class="rtext">
                <p class="res_name">${RestaurantVO.rname}</p>
                <p class="res_kind">
                 	<c:choose>
	                  	<c:when test="${RestaurantVO.kind==1}">한식</c:when>
	                  	<c:when test="${RestaurantVO.kind==2}">중식</c:when>
	                  	<c:when test="${RestaurantVO.kind==3}">양식</c:when>
	                  	<c:when test="${RestaurantVO.kind==4}">일식</c:when>
	                  	<c:when test="${RestaurantVO.kind==5}">피자</c:when>
	                  	<c:when test="${RestaurantVO.kind==6}">치킨</c:when>
	                  	<c:when test="${RestaurantVO.kind==7}">분식</c:when>
	                  	<c:otherwise>디저트</c:otherwise>
                 	</c:choose>
                 </p>
                 <p class="res_tag">#${RestaurantVO.hash}</p>
             </div>
        	</a>
    	</div>
	</c:forEach> 
</div>


<%@ include file="../footer.jsp"%>