<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>

<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script src = "../script/jquery-3.6.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

function readURL(obj) {
    let reader = new FileReader();
    if(!obj.files.length) {
        return;
    }
    $('#previewDiv').empty();
    reader.readAsDataURL(obj.files[0]);
    reader.onload = function (e) {
        let img = $('<img />');
        $(img).attr('src', e.target.result);
        $('#previewDiv').append(img);
    }
}

function review_write() {
	if(document.review_form.reviewStar.value.length==0) {
		alert('별점을 눌러주세요');
		history.scrollRestoration = "auto";
		return false;
	}
	else if (document.review_form.reviewContent.value.length==0) {
		alert('내용을 입력해주세요');
		document.review_form.reviewContent.focus();
		history.scrollRestoration = "auto";
		return false;
	} else return true;
}


</script>
<div id="menuorderdetail">
    <div class="menuorderdetaildiv" id="menuorderdetaildiv1" >
        <div id="menuorderdetaildiv1_1">
            <c:choose>
                <c:when test="${ovo.RESULT==0}">
                    주문확인중
                </c:when>
                <c:when test="${ovo.RESULT==1}">
                    배달중
                </c:when>
                <c:when test="${ovo.RESULT==2}">
                    배달완료
                </c:when>
                <c:when test="${ovo.RESULT==3}">
                    후기작성완료
                </c:when>
            </c:choose>
        </div>
        <div id="menuorderdetaildiv1_2">${ovo.RNAME}</div>
        <div id="menuorderdetaildiv1_3">주문번호 : ${ovo.OSEQ}</div>
        <div id="menuorderdetaildiv1_3">주문일시 : <fmt:formatDate value="${ovo.INDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        <div id="menuorderdetaildiv1_3">총주문가격 : <fmt:formatNumber value="${ovo.TOTALPRICE}" pattern="#,###원"/></div>
        <div id="menuorderdetaildiv1_4">(음식가격 : <fmt:formatNumber value="${ovo.TOTALPRICE-ovList[0].RTIP}" pattern="#,###원"/>, 배달팁 : <fmt:formatNumber value="${ovList[0].rtip}" pattern="#,###원"/>)
        </div>
    </div>
<br>
	<c:forEach  items="${ovList }" var="ovvo">
	    <div class="menuorderdetaildiv">
	        <div id="menuorderdetaildiv2_1">${ovvo.FNAME} <fmt:formatNumber value="${ovvo.FPRICE}" pattern="#,###원"/></div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.SIDEYN1==1}">
	            	${ovvo.FSIDE1} (+<fmt:formatNumber value="${ovvo.FSIDEPRICE1 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.SIDEYN2==1}">
	            	${ovvo.FSIDE2} (+<fmt:formatNumber value="${ovvo.FSIDEPRICE2 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.SIDEYN3==1}">
	            	${ovvo.FSIDE3} (+<fmt:formatNumber value="${ovvo.FSIDEPRICE3 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2" style="font-size: 16px; font-weight: bold;">주문 수량 : ${ovvo.QUANTITY}개</div>
	    </div>
	<br>
    </c:forEach>

    <div class="menuorderdetaildiv">
    	<div id="menuorderdetaildiv3">닉네임 : ${ovList[0].NICK}</div>
        <div id="menuorderdetaildiv3">배달주소 : ${ovo.ADDRESS1}&nbsp;${ovo.ADDRESS2}</div>
        <div id="menuorderdetaildiv3">전화번호 : ${ovo.PHONE}</div>
        <div id="menuorderdetaildiv3">배달/포장여부 : 
            <c:if test="${ovo.RIDERYN==0}">
                배달 (배달료 : + ${ovList[0].RTIP}원)
            </c:if>
            <c:if test="${ovo.RIDERYN==1}">
                포장
            </c:if>
        </div>
        <div id="menuorderdetaildiv3">일회용품 여부 : 
            <c:if test="${ovo.PLASTICYN==0}">
                미포함
            </c:if>
            <c:if test="${ovo.PLASTICYN==1}">
                포함
            </c:if>
        </div>
        <div id="menuorderdetaildiv3">결제방법 : 
            <c:if test="${ovo.PAYMENT==0}">
                카드결제
            </c:if>
            <c:if test="${ovo.PAYMENT==1}">
                현금결제
            </c:if>
        </div>
    </div>
<br>
    <c:if test="${ovo.RESULT==2}">
        <form class="review" name="review_form" id="review_form" method="post" action="memberReviewWrite">
            <input type="hidden" name="ID" value="${loginUser.ID}">
            <input type="hidden" name="NICK" value="${loginUser.NICK }">
            <input type="hidden" name="OSEQ" value="${ovo.OSEQ }">
            <input type="hidden" name="RSEQ" value="${ovList[0].RSEQ }">
            <fieldset>
                <span class="star_text" id="star_text">
                    별점을 선택해주세요
                </span>
                <div id="star_box">
                        <input type="radio" name="STAR" value="5" id="rate5">
                        <label for="rate5">★</label>
                        <input type="radio" name="STAR" value="4" id="rate4">
                        <label for="rate4">★</label>
                        <input type="radio" name="STAR" value="3" id="rate3">
                        <label for="rate3">★</label>
                        <input type="radio" name="STAR" value="2" id="rate2">
                        <label for="rate2">★</label>
                        <input type="radio" name="STAR" value="1" id="rate1">
                        <label for="rate1">★</label>
                    </div>
            </fieldset>
            <div id="review_img">
            	<label for="imgInput" >리뷰 이미지 첨부</label>
            	<input type="file" name="reviewImage" id="imgInput" onchange="readURL(this)" value="리뷰 이미지 첨부" style="display:none;" accept="image/*" />
            </div>
    		<div id="previewDiv"></div>
            <div>
                <textarea class="review" type="text" id="reviewContent" name="reviewContent"
                    placeholder="음식에 대한 솔직한 리뷰를 남겨주세요!"></textarea>
            </div>
            <input type="submit" value="리뷰 작성" id="reviewWriteButton" onclick="return review_write()">
        </form>
        
    </c:if>
	
	
    <c:if test="${ovo.RESULT==3}">
    	
        <form class="review" name="review_form" id="review_form">
            <fieldset>
                <div id="star_box">
                <div style="font-size:20px; font-weight:bold">내가 작성한 리뷰</div>
                	<label style="text-shadow: 0 0 0 rgba(255, 111, 44);">
                		<c:if test="${review.STAR==1}">★</c:if>
                		<c:if test="${review.STAR==2}">★★</c:if>
                		<c:if test="${review.STAR==3}">★★★</c:if>
                		<c:if test="${review.STAR==4}">★★★★</c:if>
                		<c:if test="${review.STAR==5}">★★★★★</c:if>                      
                    </label>
                </div>
            </fieldset>
            <div id="previewDiv">
            	<c:if test="${not empty review.IMAGE}">
            		<img style="width:250px; height:250px;" src="images/review/${review.IMAGE}">
            	</c:if>
            </div>
            <div>
                <textarea class="review" id="reviewContent" readonly style="height:100px;" >${review.CONTENT}</textarea><br><br>
                
                <c:if test="${review.REPLYYN==1}">
                	<div id="res_dap">
                		<div style="font-size:20px; font-weight:bold">사장님 답글</div><br>
                		<textarea class="review" id="reviewContent"  readonly style="height:100px;">${review.REPLY }</textarea>
                	</div>
                </c:if>
                
            </div>
        </form>
    </c:if>
    
    
    
    
</div>

<%@ include file="../footer.jsp"%>
