<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
		 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="top ">
   <div class="top_middle">
	<a href="${contextPath}">
		<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
		鸿兴首页
	</a>

	
	<c:if test="${!empty user}">
		<span>欢迎<a href="loginPage">${user.name}</a>来到鸿兴百货商城</span>
		
		<a href="forelogout">退出</a>
	</c:if>

	<c:if test="${empty user}">
		<a href="loginPage">请登录</a>
		<a href="registerPage">免费注册</a>
	</c:if>
      
	<span class="pull-right">
			<a href="forebought">我的订单</a>
			<a href="forecart">
			<span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
			购物车<strong>${cartTotalItemNumber}</strong>件</a>
		</span>
</div>
</nav>



