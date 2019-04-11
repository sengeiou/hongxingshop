<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
		 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>鸿兴百货商城后台管理</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->



    </head>

    <body>

        <div class="page-container">
             <h1>Login</h1>
             		<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
            <form action="${pageContext.request.contextPath }/admin_loginadmining" method="post">
                <input id="aName" name="aName" placeholder="账号" type="text">
                <input id="aPassword" name="aPassword" type="password" placeholder="密码" type="text">
                <button  class="btn btn-block redButton" type="submit">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>其他登录方式:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"> Dr. Huang 版权所有</div>

        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>

