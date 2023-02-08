<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="memberMypageSub.jsp"%>
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
    <div class="menuorderdetaildiv" id="menuorderdetaildiv1">
        <div id="menuorderdetaildiv1_1">
            <c:choose>
                <c:when test="${ovo.result==0}">
                    주문확인중
                </c:when>
                <c:when test="${ovo.result==1}">
                    배달중
                </c:when>
                <c:when test="${ovo.result==2}">
                    배달완료
                </c:when>
                <c:when test="${ovo.result==3}">
                    후기작성완료
                </c:when>
            </c:choose>
        </div>
        <div id="menuorderdetaildiv1_2">${ovo.rname}</div>
        <div id="menuorderdetaildiv1_3">주문번호 : ${ovo.oseq}</div>
        <div id="menuorderdetaildiv1_3">주문일시 : <fmt:formatDate value="${ovo.indate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
        <div id="menuorderdetaildiv1_3">총주문가격 : <fmt:formatNumber value="${ovo.totalprice}" pattern="#,###원"/></div>
        <div id="menuorderdetaildiv1_4">(음식가격 : <fmt:formatNumber value="${ovo.totalprice-ovList[0].rtip}" pattern="#,###원"/>, 배달팁 : <fmt:formatNumber value="${ovList[0].rtip}" pattern="#,###원"/>)
        </div>
    </div>
<br>
	<c:forEach  items="${ovList }" var="ovvo">
	    <div class="menuorderdetaildiv">
	        <div id="menuorderdetaildiv2_1">${ovvo.fname} <fmt:formatNumber value="${ovvo.fprice }" pattern="#,###원"/></div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.sideyn1==1}">
	            	${ovvo.fside1} (+<fmt:formatNumber value="${ovvo.fsideprice1 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.sideyn2==1}">
	            	${ovvo.fside2} (+<fmt:formatNumber value="${ovvo.fsideprice2 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2">
	            <c:if test="${ovvo.sideyn3==1}">
	            	${ovvo.fside3} (+<fmt:formatNumber value="${ovvo.fsideprice3 }" pattern="#,###원"/>) 추가
	            </c:if>
	        </div>
	        <div id="menuorderdetaildiv2_2" style="font-size: 16px; font-weight: bold;">주문 수량 : ${ovvo.quantity}개</div>
	    </div>
	<br>
    </c:forEach>

    <div class="menuorderdetaildiv">
    	<div id="menuorderdetaildiv3">닉네임 : ${ovList[0].nick}</div>
        <div id="menuorderdetaildiv3">배달주소 : ${ovo.address1}&nbsp;${ovo.address2}</div>
        <div id="menuorderdetaildiv3">전화번호 : ${ovo.phone}</div>
        <div id="menuorderdetaildiv3">배달/포장여부 : 
            <c:if test="${ovo.rideryn==0}">
                배달 (배달료 : + ${ovList[0].rtip }원)
            </c:if>
            <c:if test="${ovo.rideryn==1}">
                포장
            </c:if>
        </div>
        <div id="menuorderdetaildiv3">일회용품 여부 : 
            <c:if test="${ovo.plasticyn==0}">
                미포함
            </c:if>
            <c:if test="${ovo.plasticyn==1}">
                포함
            </c:if>
        </div>
        <div id="menuorderdetaildiv3">결제방법 : 
            <c:if test="${ovo.payment==0}">
                카드결제
            </c:if>
            <c:if test="${ovo.payment==1}">
                현금결제
            </c:if>
        </div>
    </div>
<br>
    <c:if test="${ovo.result==2}">
        <form class="review" name="review_form" id="review_form" method="post" action="fooba.do?command=memberReviewWrite&rseq=${ovList[0].rseq }&oseq=${ovo.oseq }" enctype="multipart/form-data" >
            <fieldset>
                <span class="star_text" id="star_text">
                    별점을 선택해주세요
                </span>
                <div id="star_box">
                        <input type="radio" name="reviewStar" value="5" id="rate5">
                        <label for="rate5">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate4">
                        <label for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3">
                        <label for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate2">
                        <label for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="1" id="rate1">
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
	
	
    <c:if test="${ovo.result==3}">
    	
        <form class="review" name="review_form" id="review_form">
            <fieldset>
                <div id="star_box">
                <div style="font-size:20px; font-weight:bold">내가 작성한 리뷰</div>
                	<label style="text-shadow: 0 0 0 rgba(255, 111, 44);">
                		<c:if test="${review.star==1}">★</c:if>
                		<c:if test="${review.star==2}">★★</c:if>
                		<c:if test="${review.star==3}">★★★</c:if>
                		<c:if test="${review.star==4}">★★★★</c:if>
                		<c:if test="${review.star==5}">★★★★★</c:if>                      
                    </label>
                </div>
            </fieldset>
            <div id="previewDiv">
            	<c:if test="${not empty review.image }">
            		<img style="width:250px; height:250px;" src="images/review/${review.image }">
            	</c:if>
            </div>
            <div>
                <textarea class="review" type="text" id="reviewContent" readonly style="height:100px;" >${review.content }</textarea><br><br>
                
                <c:if test="${review.replyyn==1}">
                	<div id="res_dap">
                		<div style="font-size:20px; font-weight:bold">사장님 답글</div><br>
                		<textarea class="review" id="reviewContent"  readonly style="height:100px;">${review.reply }</textarea>
                	</div>
                </c:if>
                
            </div>
        </form>
    </c:if>
    
    
    
</div>

<%@ include file="../footer.jsp"%>
