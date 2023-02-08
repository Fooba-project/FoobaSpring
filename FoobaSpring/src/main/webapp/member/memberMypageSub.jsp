<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<nav id="sub_menu">
	<ul>
		<li><a href="fooba.do?command=memberOrderList&page=1">진행중인 주문내역</a></li>
		<li><a href="fooba.do?command=memberOrderAll&page=1">전체 주문내역</a></li>		
		<li><a href="fooba.do?command=memberUpdateForm">회원정보수정</a></li>
		<li><a onclick="withdrawalMember()" a href="#">회원탈퇴</a></li>
	</ul>
</nav>