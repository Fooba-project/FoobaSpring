<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
      .popup {
        position: absolute;
        width: 460px;
        height: 760px;
        top: 50%;
        left: 50%;
        margin: 0 auto;
        transform: translate(-50%, -50%);
        
        background-color: #fffcfd;
      }

      .popupheader {
        width: 460px;
        height: 60px;
        background-color: #fa6146;;
        color: white;
        opacity: 0.9;
        padding: 25px 0 0 0;
        z-index: 2;
        text-align: center;
        font-weight: 700;
        font-size: 21px;
      }
      .popupimgg {
        height: 200px;
        margin: auto;
        display: block;
        padding-top: 14px;
      }

      .popupcontext {
        padding-inline: 5%;
      }

      #contextsub {
        text-align: center;
      }
      .contextsub2 {
        line-height: 10%;
      }

      .contextprice {
        position: relative;
        height: 58.5px;
        font-weight: 700;
      }

      .contextprice1 {
        position: absolute;
        left: 0px;
        line-height: 58.5px;
      }
      .contextprice2 {
        position: absolute;
        right: 0px;
        line-height: 58.5px;
      }

      .contextoption {
        border: 1px solid black;
        position: relative;
        font-weight: 700;
        height: 120px;
      }

      .optionnn {
        position: relative;
        left: 0px;
        line-height: 30px;
      }

      .optionprice {
        position: absolute;
        top: 0px;
        right: 0px;
        font-size: 15px;
      }
      .popupchecks {
        margin-left: 10px;
        position: relative;
        margin-bottom: 10px;
        font-size: 14px;
      }

      .popupquantity {
        line-height: 58.5px;
        position: relative;
        height: 58.5px;
        font-weight: 700;
      }
      .pquantity {
        width: 100px;
      }

      .pbox {
        position: absolute;
        right: 5px;
        top: 10px;
        line-height: 32px;
      }

      .pbox_button {
        width: 30px;
        height: 30px;
        font-size: 15px;
        font-weight: 700;
        border-radius: 3px;
        border: none;
        background: #f2f0f1;
        cursor:pointer;
      }

      .pcount {
        outline: none;
        border: none;
        font-size: 17px;
        background-color: #fffcfd;
        text-align: center;
        width: 30px;
        height: 30px;
      }


      .popuptotal {
        position: relative;
        height: 58.5px;
        font-weight: 700;
      }
      .ptotal {
        position: absolute;
        left: 0px;
        line-height: 58.5px;
      }
      #sumprice{
        line-height: 50px;
        border:none;
        outline:none;
      }
      #sumwon{
        line-height: 55px;
        border:none;
      }

      .pwon {
        border:none;
        font-weight: bold;
        position: absolute;
        right: 0px;
        font-size: 23px;
        color: #d53651;
        text-align: center;
      }

      .popupbutton {
        position: fixed;
        width: 460px;
        border: none;
        font-size: 16px;
        font-weight: bold;
        margin: 0;
      }

      #plbutton {
        position: relative;
        float: left;
        height: 48px;
        width: 100%;
        background-color: #515050;
        cursor: pointer;
        font-weight: 700;
        border: none;
        color: white;
        font-size: 16px;
      }
      
    </style>
    <script src="../script/jquery-3.6.1.js"></script> 
    <script type="text/javascript">
        
        
        var menunum=1;
        var total=0;
        function menucount(x){
          if(x==-1&&menunum==1)return;
          if(x==1&&menunum==99)return;
          if(x==-1) {menunum--;
            document.getElementById("sumprice").value =
            parseInt(document.getElementById("sumprice").value) - parseInt(document.getElementById("nomal").value)
          }
          if(x==1) {menunum++;
            document.getElementById("sumprice").value =
            parseInt(document.getElementById("sumprice").value) + parseInt(document.getElementById("nomal").value)
          }
          document.getElementById("menusuryang").value=menunum;

          var summmmm=0;
            total = menunum*parseInt(document.getElementById("nomal").value);
            a = document.getElementsByClassName("c");
            for(i = 0; i < a.length; i++){
                if(a[i].checked == true){
                    summmmm += parseInt(a[i].value)*menunum;
                }
            }
          document.getElementById("sumprice").value = summmmm+total;
        }
        
        function calc(){
            var summmmm=0;
            total = menunum*parseInt(document.getElementById("nomal").value);
            a = document.getElementsByClassName("c");
            for(i = 0; i < a.length; i++){
                if(a[i].checked == true){
                    summmmm += parseInt(a[i].value)*menunum;
                }
            }
            document.getElementById("sumprice").value = summmmm+total;
        }
          
        function closee(){
        	document.jangbaguni.action = 'fooba.do?command=jangbaguni';
        	document.jangbaguni.submit();
        }
        
    </script>
  </head>
  <c:if test="${jangresult=='1' }">
  		<script type="text/javascript">
  				opener.location.href='fooba.do?command=restaurantDetail&rseq='+${rseq};
  		  		self.close();
  		</script>
  </c:if>
  <body>
  	  	
    <form method="post" name="jangbaguni">
    <input type="hidden" value="${FoodmenuVO.rseq}" name="rseq">
    <input type="hidden" value="${FoodmenuVO.fseq}" name="fseq">
    
    <div class="popup">
      <div class="popupheader">메뉴상세</div>
      <div class="popupcontext">
        <img class="popupimgg"
          src="images/foodmenu/${FoodmenuVO.fimage}"
        />
        <div id="contextsub">
        	<input type="hidden" name="fname" value="${FoodmenuVO.fname }">
          <h2 class="contextsub2">${FoodmenuVO.fname }</h2>
          <p>
				${FoodmenuVO.fcontent }
          </p>
        </div>
        <div class="contextprice">
          <div class="contextprice1">&nbsp; 가격</div>
          <div class="contextprice2">${FoodmenuVO.fprice}원 &nbsp;</div>
        </div>
        <div class="contextoption">
          <div class="optionnn">&nbsp; 옵션&nbsp;(추가선택 가능)</div>
          <input type="hidden" value="${FoodmenuVO.fprice}" id="nomal" name="fprice"><!--value 음식가격 -->
          <div class="popupchecks">
            <input type="checkbox"   
            class="c" onclick="calc()" value="${FoodmenuVO.fsideprice1 }" name="fsideprice1"/>
            <input type="hidden" value="${FoodmenuVO.fside1 }" name="fside1">
            ${FoodmenuVO.fside1 }
              <div class="optionprice">+${FoodmenuVO.fsideprice1 }원 &nbsp;</div>
          </div>

          <div class="popupchecks">
            
            <input type="checkbox" class="c" onclick="calc()" value="${FoodmenuVO.fsideprice2 }" name="fsideprice2"/>
            <input type="hidden" value="${FoodmenuVO.fside2 }" name="fside2">
           ${FoodmenuVO.fside2 }
              <div class="optionprice">+${FoodmenuVO.fsideprice2 }원 &nbsp;</div>
          </div>

          <div class="popupchecks">
            <input class="c" type="checkbox"  onclick="calc()" value="${FoodmenuVO.fsideprice3 }" name="fsideprice3"/>
             <input type="hidden" value="${FoodmenuVO.fside3 }" name="fside3">
            ${FoodmenuVO.fside3 }
              <div class="optionprice">+${FoodmenuVO.fsideprice3 }원 &nbsp;</div>
          </div>
        </div>

        <div class="popupquantity">
          <div class="pquantity">&nbsp; 수량</div>
          <div class="pbox">
            <input
              class="pbox_button"
              value="-"
              type="button" onclick="menucount(-1)"
            />
            <input type="text" class="pcount" value="1" maxlength="2" readonly id="menusuryang" name="quantity" />
            <!--읽기전용으로 readonly 표시-->
            <input
              class="pbox_button"
              value="+"
              type="button" onclick="menucount(1)"
            />
          </div>
        </div>

        <div class="popuptotal">
          <div class="ptotal">&nbsp; 총 주문금액</div>
          <input id="sumprice" value="${FoodmenuVO.fprice }" class="pwon" size="6" readonly name="totalprice">
          <a class="pwon" id="sumwon">원</a>
        </div>
      </div>

      <div class="popupbutton">
        <input type="button" id="plbutton" value="주문표에 추가"  onclick="closee()">

      </div>
    </div>
    </form>
        

   
  </body>
</html>
