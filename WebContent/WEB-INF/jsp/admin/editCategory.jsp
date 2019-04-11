<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>鸿兴百货商城后台管理</title>
     <!-- 引入css样式文件 -->
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
</head>
<body>
<div id="wrapper">
<!-- 导航栏部分 -->
<!-- 导航栏左侧侧图标部分 -->
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="admin_category_list">HONGXING</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 用户信息和退出登录 start -->
        <ul class="nav navbar-top-links navbar-right">
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.aName}
				    </a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/admin_loginout">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		</ul>
		<!-- 用户信息和退出登录 start -->
    </nav>

    <!-- 导航栏左侧导航栏部分 -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="admin_category_list"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="admin_user_list"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a href="admin_order_list"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
                <li>
                    <a href="admin_admin_list"><i class="fa fa-link"></i> 管理员管理</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- 导航栏右侧显示部分 start-->
    <div id="page-wrapper">
        <div id="page-inner">
   <div class="workingArea">
	<ol class="breadcrumb">
		<li><a href="admin_category_list">所有分类</a></li>
		<li class="active">编辑分类</li>
	</ol>

	<div class="panel panel-warning editDiv">
		<div class="panel-heading">编辑分类</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_category_update"  enctype="multipart/form-data">
				<table class="editTable">
					<tr>
						<td>分类名称</td>
						<td><input  id="name" name="name" value="${c.name}" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>分类图片</td>
						<td>
							<input id="categoryPic" accept="image/*" type="file" name="image" />
						</td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="id" value="${c.id}">
							<button type="submit" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	 </div>
   </div>
 </div>
 <%@include file="../include/admin/adminFooter.jsp"%>
</div>
    <!-- 导航栏右侧显示部分 end-->
</div>
<!-- /. WRAPPER  -->
<!-- 引入js文件 -->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $(function(){

        $("#editForm").submit(function(){
            if(!checkEmpty("name","分类名称"))
                return false;

            return true;
        });
    });

</script>
</body>
</html>
