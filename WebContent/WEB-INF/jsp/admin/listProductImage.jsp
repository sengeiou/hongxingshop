<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
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
       	<ol class="breadcrumb">
		<li><a href="admin_category_list">所有分类</a></li>
		<li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
		<li class="active">${p.name}</li>
		<li class="active">产品图片管理</li>
	    </ol>
            <a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newaddFormSingleDialog" onclick="addFormSingle()">新建</a>	
		            <div class="modal fade" id="newaddFormSingleDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<!--新增单个产品图片模态框 start-->
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
				<div class="panel panel-warning addPictureDiv">
						<div class="panel-heading">新增产品<b class="text-primary"> 单个 </b>图片</div>
						<div class="panel-body">
							<form method="post" class="addFormSingle" action="admin_productImage_add" enctype="multipart/form-data">
								<table class="addTable">
									<tr>
										<td>请选择本地图片 尺寸400X400 为佳</td>
									</tr>
									<tr>
										<td>
											<input id="filepathSingle" type="file" name="image" />
										</td>
									</tr>
									<tr class="submitTR">
										<td align="center">
											<input type="hidden" name="type" value="type_single" />
											<input type="hidden" name="pid" value="${p.id}" />
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
	<!--新增单个产品图片模态框 end-->
</div>	     
            <!-- 单个产品图片管理列表  start-->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">单个产品图片管理表</div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover  table-condensed">
						<thead>
						<tr class="success">
							<th>ID</th>
							<th>产品单个图片缩略图</th>
							<th>删除</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pisSingle}" var="pi">
							<tr>
								<td>${pi.id}</td>
								<td>
									<a title="点击查看原图" href="img/productSingle/${pi.id}.jpg"><img height="50px" src="img/productSingle/${pi.id}.jpg"></a>
								</td>
								<td><a deleteLink="true"
									   href="admin_productImage_delete?id=${pi.id}"><span
										class=" 	glyphicon glyphicon-trash"></span></a></td>

							</tr>
						</c:forEach>
						</tbody>
					</table>

                            </div>

                        </div>
                    </div>
                   
                </div>
            </div>
            <!-- 单个产品图片管理列表  end-->
            
            
                        <a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newaddFormDetailDialog" onclick="addFormDetail()">新建</a>	
		            <div class="modal fade" id="newaddFormDetailDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<!--新增产品图片详情模态框 start-->
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
					<div class="panel panel-warning addPictureDiv">
						<div class="panel-heading">新增产品<b class="text-primary"> 详情 </b>图片</div>
						<div class="panel-body">
							<form method="post" class="addFormDetail" action="admin_productImage_add" enctype="multipart/form-data">
								<table class="addTable">
									<tr>
										<td>请选择本地图片 宽度790  为佳</td>
									</tr>
									<tr>
										<td>
											<input id="filepathDetail"  type="file" name="image" />
										</td>
									</tr>
									<tr class="submitTR">
										<td align="center">
											<input type="hidden" name="type" value="type_detail" />
											<input type="hidden" name="pid" value="${p.id}" />
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
	<!--新增产品图片详情模态框 end-->
</div>	     
            <!-- 产品图片详情管理列表  start-->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">产品图片详情管理表</div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover  table-condensed">
						<thead>
						<tr class="success">
							<th>ID</th>
							<th>产品详情图片缩略图</th>
							<th>删除</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pisDetail}" var="pi">
							<tr>
								<td>${pi.id}</td>
								<td>
									<a title="点击查看原图" href="img/productDetail/${pi.id}.jpg"><img height="50px" src="img/productDetail/${pi.id}.jpg"></a>
								</td>
								<td><a deleteLink="true"
									   href="admin_productImage_delete?id=${pi.id}"><span
										class=" 	glyphicon glyphicon-trash"></span></a></td>

							</tr>
						</c:forEach>
						</tbody>
					</table>

                            </div>

                        </div>
                    </div>
                   
                </div>
            </div>
            <!-- 产品图片详情管理列表  end-->

        </div>
        <%@include file="../include/admin/adminFooter.jsp"%>
    </div>
    <!-- 导航栏右侧显示部分 end-->
</div>
<!-- /. WRAPPER  -->
<!-- 引入js文件 -->
<!-- jQuery Js -->
<script src="./assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(function(){
        $(".addFormSingle").submit(function(){
            if(checkEmpty("filepathSingle","图片文件")){
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $(".addFormDetail").submit(function(){
            if(checkEmpty("filepathDetail","图片文件"))
                return true;
            return false;
        });
    });

</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>


</body>
</html>
