<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
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
                    <a href="admin_category_list"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="admin_user_list"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a class="active-menu" href="admin_order_list"><i class="fa fa-list-alt"></i> 订单管理</a>
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
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">订单管理</h1>                   
                </div>
            </div>
            
            <!-- 分类管理列表  start-->

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">订单管理表</div>
                        <div class="panel-body">
                            		<table class="table table-striped table-bordered table-hover1  table-condensed">
			<thead>
			<tr class="success">
				<th>ID</th>
				<th>状态</th>
				<th>金额</th>
				<th width="100px">商品数量</th>
				<th width="100px">买家名称</th>
				<th>创建时间</th>
				<th>支付时间</th>
				<th>发货时间</th>
				<th>确认收货时间</th>
				<th width="120px">操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${os}" var="o">
				<tr>
					<td>${o.id}</td>
					<td>${o.statusDesc}</td>
					<td>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td>
					<td align="center">${o.totalNumber}</td>
					<td align="center">${o.user.name}</td>

					<td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

					<td>
						<button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看/关闭</button>

						<c:if test="${o.status=='waitDelivery'}">
							<a href="admin_order_delivery?id=${o.id}">
								<button class="btn btn-primary btn-xs">发货</button>
							</a>
						</c:if>
					</td>
				</tr>
				<tr class="orderPageOrderItemTR"  oid=${o.id}>
					<td colspan="10" align="center">

						<div  class="orderPageOrderItem">
							<table width="800px" align="center" class="orderPageOrderItemTable">
								<c:forEach items="${o.orderItems}" var="oi">
									<tr>
										<td align="left">
											<img width="40px" height="40px" src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
										</td>

										<td>
											<a href="foreproduct?pid=${oi.product.id}">
												<span>${oi.product.name}</span>
											</a>
										</td>
										<td align="right">

											<span class="text-muted">${oi.number}个</span>
										</td>
										<td align="right">

											<span class="text-muted">单价：￥${oi.product.promotePrice}</span>
										</td>

									</tr>
								</c:forEach>

							</table>
						</div>

					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

                        </div>
                        <div class="pageDiv"><%@include file="../include/admin/adminPage.jsp" %></div>
                    </div>
                   
                </div>
            </div>
            <!-- 分类管理列表  end-->

        </div>
        <%@include file="../include/admin/adminFooter.jsp"%>
    </div>
    <!-- 导航栏右侧显示部分 start-->
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
    $(function(){
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });

</script>
<!-- Custom Js -->
<script src="assets/js/custom-scripts.js"></script>


</body>
</html>
