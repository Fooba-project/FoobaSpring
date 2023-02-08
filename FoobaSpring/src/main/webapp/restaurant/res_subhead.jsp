<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div id="res_main">
	<div id="res_name">
		<form  method="post" name="frmm">
			
      		<c:if test="${RestaurantVO.ryn==1}">
      			${RestaurantVO.rname}&nbsp;&nbsp;<input type="button" value="휴업신청" name="ryn" onClick="update_ryn('${RestaurantVO.rseq}');" style="border:none; background-color:rgb(248, 246, 138); width:80px; height:30px; border-radius: 5px; box-shadow: 1px 1px rgb(185, 181, 181); cursor:pointer;">
      		</c:if>
      		<c:if test="${RestaurantVO.ryn==3}">
      			${RestaurantVO.rname}&nbsp;&nbsp;<input type="button" value="영업개시" name="ryn" onClick="return_ryn('${RestaurantVO.rseq}');"  style="border:none; background-color:rgb(248, 246, 138); width:80px; height:30px; border-radius: 5px; box-shadow: 1px 1px rgb(185, 181, 181); cursor:pointer;">
      		</c:if>
      		<c:if test="${RestaurantVO.ryn==2}">
      			${RestaurantVO.rname}&nbsp;&nbsp;<input type="button" value="영업정지중" name="ryn" style="border:none; background-color:rgb(248, 246, 138); width:80px; height:30px; border-radius: 5px; box-shadow: 1px 1px rgb(185, 181, 181);">
      		</c:if>
      	</form>
	</div>
	<div id="res_info">
		<img class="res_logo"src="images/title/${RestaurantVO.rimage}" ></img>
	    <div id="res_basic">
	    	<a class="basic">별점</a>&nbsp;&nbsp;<a class="starr">
	    		<c:choose>
            		<c:when test="${intstar==0}">없음</c:when>
            		<c:when test="${intstar==1}">★☆☆☆☆</c:when>
            		<c:when test="${intstar==2}">★★☆☆☆</c:when>
            		<c:when test="${intstar==3}">★★★☆☆</c:when>
            		<c:when test="${intstar==4}">★★★★☆</c:when>
            		<c:otherwise>★★★★★</c:otherwise>
            	</c:choose>${doublestar}</a>
	    	<br> 
			<a class="basic">배달팁</a>&nbsp;&nbsp;  ${RestaurantVO.rtip}<br>
			<a class="basic">결제</a>&nbsp;&nbsp; 신용카드, 현금<br>            
			<a class="basic">해시태그</a>&nbsp;&nbsp; #${RestaurantVO.hash}<br>
	    </div>
	</div>
	<br>