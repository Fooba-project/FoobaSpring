<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/restaurant/res_header.jsp"%>
<%@ include file="/restaurant/res_subhead.jsp"%>

<!-- 가게 정보 수정 폼  -->
        <div id="res_tab">
            <div class="res_infotab" 
             onclick="location.href='res_show'">돌아가기</div>
            <div class="res_infotab" onclick="res_editForm'" style="color:white;">정보수정</div>
        </div>

			<div id="res_menuall" style="overflow-x:hidden;">
			
				
           		
           		 <div id="info_rev">
           		 	<form id="res_menuall_a" name="food_menu" method="post" action="res_update">
					<input type="hidden" name="RSEQ" value="${loginRes.RSEQ}">	
					<input type="hidden" name="oldImage" value="${loginRes.RIMAGE}">
					<input type="hidden" name="RID" value="${loginRes.RID}">	
	       	    	<div id="rest_info">
                
	                    <div id="res_cont">
	                    	<br>
	                        <h3>사장님 알림 &nbsp;&nbsp;<span style="color:red;font-size:14px; ">${message }</span></h3><hr>
	                        <textarea name="CONTENT" rows="5" cols="50" style="border-radius:2px; resize:none" maxlength="100" >${loginRes.CONTENT}</textarea>
	                    </div><br>
                    	<div id="res_num">
	                        <h3>업체 정보</h3><hr>
	                        <a class="basic">사업자 번호</a>&nbsp;
	                        	<input type="text" value="${loginRes.RBIZNUM}" readonly style=" border:0;"><br><hr>                    
	                        <a class="basic">전화 번호</a>&nbsp;
	                        	<input type="text" name="RPHONE" style="border-radius:5px; width:170px; height:20px;"
	                        	 value="${loginRes.RPHONE}"  maxlength="13" id="rphone" onkeyup="chkPhoneCode(event)"/><br><hr>
	                        <input type="button" id="re_btn" onclick="sample6_execDaumPostcode()" class="dup" value="우편번호 찾기"> &nbsp; 
	                        <input type="text"  id="sample6_postcode"  style="width: 50px;  border:0;" name="ZIP_NUM" placeholder="우편번호" value="${loginRes.ZIP_NUM}" readonly/>
               				<br>
                			<a class="basic">사업자 주소&nbsp;</a> &nbsp; <input type="text"name="RADDRESS" style=" border:0;"
				                id="sample6_address"   value="${loginRes.RADDRESS}"
				                  readonly/>	<br>
				            <a class="basic">상세 주소 &nbsp;&nbsp;</a>&nbsp;  &nbsp;&nbsp;<input type="text"  name="RADDRESS2" 
				                  id="sample6_detailAddress"   value="${loginRes.RADDRESS2}"
				                /><br>
			                 &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" name="RADDRESS3" style=" border:0;"
				                 id="sample6_extraAddress" value="${loginRes.RADDRESS3}"
				                 readonly/>
			                 <hr>
                    	</div>
                    	
                    	<div id="res_cont">
	                    	<br>
	                        <h3>가게 정보</h3><hr>
	                        <a class="basic">결제 방법</a>&nbsp;&nbsp; 신용카드, 현금<br><hr>                    
	                        <a class="basic">배달 팁</a>&nbsp;&nbsp;&nbsp;
	                        	<input type="text" name="RTIP" style="border-radius:5px; width:100px; height:20px;"
	                        	 value="${loginRes.RTIP}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /> 원<br><hr>
	                        <a class="basic">해시태그</a>&nbsp; 
	                        	# <input type="text" name="HASH" style="border-radius:5px; width:100px; height:20px;"
	                        	value="${loginRes.HASH}"/><br><hr>
	                        <a class="basic">가게로고</a>&nbsp; 
	                        		            
                                <div id="images_upload_box" style="height:200px">
                                	<img src="images/title/${loginRes.RIMAGE}" height="150px" >
			                         <input type="hidden" name="RIMAGE" id="fileimage" value="${NEWRIMAGE }">
			                         <div id="filename">
				                         	<c:if test="${not empty NEWRIMAGE}">
								   				<br><img src='images/title/${NEWRIMAGE }' height='150'/>
								   			</c:if>
			                         </div>
	                        	
	                    </div><br>
	                    <input type="submit" value="수정 완료" class="res_infotab"  style="width:700px; position:absolute; bottom:-50px;">
	                    </div>
                    	
					</div>
				</form>
				
				<div style="position:absolute; bottom:-270px; left:10px;">
					<form name="fromm" id="fileupForm2" method="post" enctype="multipart/form-data">
								&nbsp;&nbsp;<input type="file" name="fileimage"><input type="button" id="myButton2" value="추가">
					</form>
				</div>
            </div>            
        </div>
       </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J) 
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
                
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>        
<%@ include file="/restaurant/res_footer.jsp"%>