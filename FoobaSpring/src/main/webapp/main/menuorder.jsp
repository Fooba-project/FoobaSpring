<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style type=text/css>
.gumaeinput_text{opacity:70%;}
</style>
<form name="member_join_send_form" id="member_join_send_form" method="post" >
<input type="hidden" value="order" name="command">
<input type="hidden" value="${RSEQ }" name="RSEQ">
<input type="hidden" value="${RTIP }" id="RTIP">

<div id="realjenche2">
        <div id="jenche2">
            <div id="gumae">구매하기</div>
            <div id="juso">
                <div class="juso" id="jusotabb" onclick="jusomove(-1);">주소</div>
                <div class="newjuso" id="newjusotabb" onclick="jusomove(1);">배송지 변경</div>
            </div>
            <div id="tul2">
                <div id="juso1">
                    <a class="grayy2">우편번호</a>
                    &nbsp; ${loginUser.ZIP_NUM }<br>
                    <a class="grayy2">주소</a>
                    &nbsp;${loginUser.ADDRESS1 }<br>
                    <a class="grayy2">상세주소</a>
                    &nbsp;${loginUser.ADDRESS2 }

                    <br>
                    <a class="grayy2">전화번호</a>&nbsp; ${loginUser.PHONE }
    
                </div>
                <div id="juso2">
                    <input type="text" class="gumaeinput_text" style="width: 490px;" name="userzip_num" placeholder="우편번호 : ${loginUser.ZIP_NUM}" readonly/>
                    <input type="button" id="oopyon" value="우편번호 검색" onclick="post_zip()"> 
                    <input type="text" class="gumaeinput_text" name="useraddress1" placeholder="주소 : ${loginUser.ADDRESS1 }" readonly/>
                    <input type="text" class="gumaeinput_text" name="useraddress2" placeholder="상세 주소 : ${loginUser.ADDRESS2 }"/>
                    <input type="text" class="gumaeinput_text" name="phone" placeholder="전화번호 : ${loginUser.PHONE }" onkeyup="chkPhoneCode(event)" maxlength="13" />

                </div>    
            </div>
            
        </div>
        
        <div id="xxxx">
        	<div class="toggle1">
				&nbsp;배달/포장 &nbsp;
				<input type="radio" id="toggle1-1" name="rideryn" value="0" checked onclick="baedal('${RTIP}')" class="pointer">
				<label for="toggle1-1">배달</label>&nbsp;&nbsp;
				<input type="radio" id="toggle1-2" name="rideryn" value="1" onclick="pojang('${RTIP}');" class="pointer">
				<label for="toggle1-2">포장</label>
			</div>
		
			<div class="toggle2">
				&nbsp;일회용품 &nbsp;&nbsp;
				<input type="radio" id="toggle2-1" name="plasticyn" value="1" checked class="pointer">
				<label for="toggle2-1">사용</label>&nbsp;&nbsp;
				<input type="radio" id="toggle2-2" name="plasticyn" value="0" class="pointer">
				<label for="toggle2-2">미사용</label>
			</div>  
		
			<div class="toggle3">
				&nbsp;카드/현금 &nbsp;
				<input type="radio" id="toggle3-1" name="payment" value="0" checked class="pointer">
				<label for="toggle3-1">카드</label>&nbsp;&nbsp;
				<input type="radio" id="toggle3-2" name="payment" value="1" class="pointer">
				<label for="toggle3-2">현금</label>
			</div>
	
        </div>

        <div id="jangbagunitul2">
            <div id="jbtitle2">주문표</div>
            <c:forEach items="${ list }" var="CartVO">
            <div class="jbitem2" id="jb">
                <a class="jbitemname">${CartVO.CFNAME} x ${CartVO.QUANTITY }&nbsp;&nbsp;&nbsp;</a><a class="jbitemsub">${CartVO.SIDEYN1}&nbsp;&nbsp; ${CartVO.SIDEYN2} &nbsp;&nbsp;${CartVO.SIDEYN3}</a><br>
                <div class="jbitemprice">
                   ${CartVO.CPRICE} 원&nbsp;
                </div>
            </div>
            </c:forEach>
            <input type="hidden" value="0" id="bdjs" name="bdjs">
            <div class="baedaltip"><input type="text" value="배달요금 : 1000원 별도&nbsp;&nbsp;&nbsp;" id="badal" readonly></div>
            <div class="jbtotal">합계 : <input type="text" value="${carttotalprice }" id="jbtotalprice" name="totalprice" readonly>원&nbsp;&nbsp;</div>
            <input type="submit" value="결제" class="jbwanryo2" onclick="return jusochoice();">
			
        </div>
    </div>
</form>

<%@ include file="../footer.jsp"%>