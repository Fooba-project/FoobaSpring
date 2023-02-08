<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fooba</title>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
 
<script src = "../script/jquery-3.6.1.js"></script>
<script src="../script/fooba.js"></script>
</head>
<style type="text/css">
#admin_space{width:100%; height:730px;}
body {margin: 0; position:relative;}
.headback {width: 100%; height: 100px; background-color: rgb(23,55,94); margin: 0;}
#mainlogo {position: relative; text-align: center; width: 150px; height: 100px; margin: auto auto;}
#mainlogo img {width: 100px; height: 100px;}

.headbuttons {position:absolute; width: 380px; top:23px; left:calc(50% + 300px); }
.headbutton {width: 70px; height: 50px;border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 90%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color: #fff; line-height: 50px; color:#fff; background-color: transparent; border: 2px solid white; }
.headbutton:hover {background-color: white; color: rgb(23,55,94); cursor: pointer;}

.footerbox{position:relative; height: 100px; width: 100%; background-color: white; }
.footerbox #copy{position:absolute; top: 50px; text-align: center; right:20px; font-size: 15px; opacity: 80%; color: rgb(23,55,94);}
.footerbox  #logo{position:absolute; width:80px; height: 90px;  left: 15px; opacity: 60%; }
.footerbox #logotextbox{position:absolute; top:10px; left: 110px; line-height:25px; width: 500px; }
.footerbox #logotext{font-family: Verdana; font-weight: bold; color: rgb(23,55,94); }
.footerbox .linemenubox{width: 150px; height: 20px; cursor: pointer; float: right; margin:10px; font-weight: bold; color: rgb(23,55,94); text-align: center;}

.login_form {position: relative; width:100%; height:745px;}
#logspace {width: 100%; height: 100px;}
#loginmessage {width: 100%; height: 20px; margin-top: 30px; color: red; text-align: center; }
#Login_form_space {width:100%; height:150px;}
#loginmain_logo{position: relative; text-align: center; width: 150px; height: 100px; margin: 0 auto; border-radius:50%; width: calc(5.5em / 0.7); height: calc(5em / 0.7); background-color: rgb(23,55,94); opacity:90%;}
#loginmain_logo img{width: 100px; height: 100px;}
#login_box{position: relative; height:300px; width:500px; border:2px solid rgb(224, 133, 80); margin: 0 auto; border-radius: 20px; margin-top:50px; }
#text_button_box{position:relative; width: 500px;height: 190px; margin-top: 50px; margin-left:0 auto;}
#login_idpw_box{position:relative; height:75px; width:310px; margin-top:0 auto; margin-left:90px;}
#login_id{position: relative; width:300px;height:36px; border:1px solid #616161; padding-left:10px;}
#login_pw{position: relative; width:300px; height:36px; bottom:1px; border:1px solid #616161; padding-left:10px; margin-top:10px;}
#log_buttonbox{position: relative; width: 310px; height:40px; margin-top: 40px;margin-left:90px;}
#log_button{position: relative; width: 310px; height:40px; background-color:rgb(23,55,94); opacity:80%;border-color:rgb(23,55,94); border-radius:10px; cursor: pointer;}
#log_button span{position: relative;font-size: 20px; font-weight:bold;color: white; } 
#login_idpw_box input:enabled{background:white;}
#login_idpw_box input:focus{background: rgb(255, 209, 182); outline: none;}
#loginform_linetextbox{height:25px; width:450px; margin:0 auto;}
.loginform_linetext span{ position: relative; float: left; cursor: pointer; width:100px; margin-left: 45px; }

#logspace {font-size: 30px; font-weight:bold; text-align:center;}
    .admin_list{text-align: center; margin-top:30px;}
    #admin_searchres {margin:auto;  width:700px;}
    #admin_searchres td {font-weight: 700; }
    .admin_searchres_btn{height:35px; background-color: rgb(76, 94, 134); float: right; margin-right: 5px; border: 2px solid black ; color: white; box-shadow: 1px 1px black; border-radius: 4px;  }   
    #admin_list_table{margin: auto; border: 1px solid; width:810px;}
    #admin_list_table th{background-color:rgb(99, 123, 153); font-size: 17px; color: white;}

.keyy{border-radius:9px; height:20px; margin-top:10px; outline:none; border:2px solid rgb(76, 94, 134);}

.member_join {width: 700px; overflow: hidden; margin:50px auto;}
#input_warp { margin: 0; width: 700px;}
.join_list { position: relative; height: 44px; padding: 0; margin: 0; overflow: hidden;  margin: 10px;}

/*.join_list #id_btn {  position: absolute;  width: 180px;  height: 45px;  top: 0px; right: 0;  border: 0; border-radius: 3px;}-->
.join_list #id_btn:hover { outline: 0px solid #9191dfab; background-color: rgb(125, 114, 245);}*/
.member_join_title { text-align: left; font-size: 26px;font-weight: bold; }
.error_text { font-family: Verdana, Geneva, Tahoma, sans-serif; margin: 0; margin-left: 20px; font-size: 60%; padding: 0;}
.input_text {outline: none;overflow: hidden;position: relative;display: block; width: 100%;padding: 10px 13px; background: #ffffff;font-size: 15px;color: #616161;font-weight: 900;border-radius: 3px; border: 1px solid white;}

.input_text1 {outline: none;overflow: hidden;position: relative;display: block; width: 100%;padding: 10px 13px; background: #ffffff;font-size: 17px;color: black;font-weight: 900;border-radius: 3px; border: 1px solid white;}




#join_btn {margin-left: 200px;}
#join_btn .join_btn {width: 150px; height: 50px; border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 100%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color: #fa6146; line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#join_btn .join_btn:hover {background-color: white; color: #fa6146; cursor: pointer; border:2px solid #fa6146}
#join_agree_text {width: 680px; height: 120px; overflow-y: auto; border: 1px solid #ccc;  margin: 10px;}
#join_agree_btn {margin:10px;}
.res_join {width: 700px; overflow: hidden; margin:50px auto;}
#input_warp { margin: 0; width: 700px;}

#join_btn1{margin-left: 200px;}
#join_btn .join_btn1 {width: 150px; height: 50px; border-radius: 5px; text-decoration: none; font-weight: bold; font-size: 100%; font-family: Verdana, Geneva, Tahoma, sans-serif; background-color: #fa6146; line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#join_btn .join_btn1:hover {background-color: white; color: #859bd6; cursor: pointer; border:2px solid #859bd6;}


.qna_subject {margin: 30px;  font-weight: bold; font-family: verdana; font-size: 120%;}
.qna_content {margin: 30px; margin-top:20px; font-weight: bold; font-family: verdana; font-size: 100%; height:200px; line-height: 170%;}

.res_join_title { text-align: left; font-size: 26px;font-weight: bold; }
.error_text { font-family: Verdana, Geneva, Tahoma, sans-serif; margin: 0; margin-left: 20px; font-size: 60%; padding: 0;}
.input_text {overflow: hidden;position: relative;display: block; width: 100%;padding: 10px 13px; background: #ffffff;box-sizing: border-box;-moz-box-sizing: border-box;-webkit-box-sizing: border-box;font-size: 15px;color: #616161;font-weight: 900;-webkit-transition: all .3s;transition: all .3s;border-radius: 3px;-webkit-border-radius: 3px; border-bottom: 1px solid #BCBCBC;}
#res_select_box{ margin-left: 10px; margin-top: 10px;}
#textarea_box{margin-left: 10px; margin-top: 10px; height: 100px; width: 100%;}
#textarea_box textarea{height: 90px; width: 675px; opacity: 70%;}
.res_text_boxs{margin-top: 10px;  padding-left: 10px;}

.qna_buttons{position: relative;  width: 210px; margin: auto; }
.qna_button{position: relative; margin: auto; margin-top: 11px; background-color: #304170; font-size: 16px; border-radius: 6px; color:white; height: 50px; width: 100px; border: 1px white;}
</style>
<body>
    <div class="headback" id="adminheadback">
        <div id="mainlogo">
            <a href="fooba.do?command=index"><img src="images/mainlogo1.png"></a>
        </div>
    </div>
    
    <div class="headbuttons" id="adminheadbuttons">
    	<c:choose>
    		<c:when test="${empty loginAdmin}">
	    		<input type="button" value="Res" class="headbutton" onclick="location.href='fooba.do?command=res_login'">
	    		<input type="button" value="Home" class="headbutton" onclick="location.href='fooba.do?command=index'">
    		</c:when>
    		<c:otherwise>
    			<input type="button" value="로그아웃" class="headbutton" onclick="location.href='fooba.do?command=admin_logout&page=1&search=&key='">
	    		<input type="button" value="가게관리" class="headbutton" onclick="location.href='fooba.do?command=admin_restaurantList&page=1&search=&key='">
	    		<input type="button" value="회원관리" class="headbutton" onclick="location.href='fooba.do?command=admin_memberList&page=1&search=&key='">
	    		<input type="button" value="주문관리" class="headbutton" onclick="location.href='fooba.do?command=admin_orderList&page=1&search=&key='">
	    		<input type="button" value="QnA" class="headbutton" onclick="location.href='fooba.do?command=admin_qnaList&page=1&search=&key='">
    		</c:otherwise>
    	</c:choose>
    </div>
    <div id="admin_space">