<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>鸿兴百货商城后台管理</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
		<li><a href="admin_product_list?cid=${c.id}">${c.name}</a></li>
		<li class="active">产品管理</li>
	    </ol>
	    
	    <a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newProductDialog" onclick="clearProduct()">新建</a>
		     <div class="modal fade" id="newProductDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<!--新增产品模态框 start-->
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
				<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增产品</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_product_add">
				<table class="addTable">
					<tr>
						<td>产品名称</td>
						<td><input id="name" name="name" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>产品小标题</td>
						<td><input id="subTitle" name="subTitle" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>原价格</td>
						<td><input id="originalPrice" value="99.98" name="originalPrice" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>优惠价格</td>
						<td><input id="promotePrice"  value="19.98" name="promotePrice" type="text"
								   class="form-control"></td>
					</tr>
					<tr>
						<td>库存</td>
						<td><input id="stock"  value="99" name="stock" type="text"
								   class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="cid" value="${c.id}">
							<button type="submit" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
			</div>
		</div>
	</div>
	<!--新增产品模态框 end-->
</div>
      <!-- 产品管理列表  start-->

	<div class="listDataTableDiv">
		<table
				class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
			<tr class="success">
				<th>ID</th>
				<th>图片</th>
				<th>产品名称</th>
				<th>产品小标题</th>
				<th width="53px">原价格</th>
				<th width="80px">优惠价格</th>
				<th width="80px">库存数量</th>
				<th width="80px">图片管理</th>
				<th width="80px">设置属性</th>
				<th width="42px">编辑</th>
				<th width="42px">删除</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ps}" var="p">
				<tr>
					<td>${p.id}</td>
					<td>

						<c:if test="${!empty p.firstProductImage}">
							<img width="40px" src="img/productSingle/${p.firstProductImage.id}.jpg">
						</c:if>

					</td>
					<td>${p.name}</td>
					<td>${p.subTitle}</td>
					<td>${p.originalPrice}</td>
					<td>${p.promotePrice}</td>
					<td>${p.stock}</td>
					<td><a href="admin_productImage_list?pid=${p.id}"><span
							class="glyphicon glyphicon-picture"></span></a></td>
					<td><a href="admin_propertyValue_edit?pid=${p.id}"><span
							class="glyphicon glyphicon-th-list"></span></a></td>

					<td><a href="admin_product_edit?id=${p.id}"><span
							class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true"
						   href="admin_product_delete?id=${p.id}"><span
							class="     glyphicon glyphicon-trash"></span></a></td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 产品管理列表  end-->

	<div class="pageDiv">
		<%@include file="../include/admin/adminPage.jsp"%>
	</div>

	

</div>
        </div>
    </div>
    <!-- 导航栏右侧显示部分 end-->
</div>
<!-- /. WRAPPER  -->
<!-- 引入js文件 -->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(function() {
        $("#addForm").submit(function() {
            if (!checkEmpty("name", "产品名称"))
                return false;
//          if (!checkEmpty("subTitle", "小标题"))
//              return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>


</body>
</html>
