<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/11/8
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="jquery/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>
    <link rel="stylesheet" type="text/css" href="css/admin/dashboard.css">
    <link rel="stylesheet" type="text/css" href="css/admin/main.css">
</head>
<script>
    function showMenu(id) {
        $(".menu").hide().eq(id).css("display","block")
    }

    function hideMenu() {
        $(".menu").hidden;
    }
    $(document).ready(function () {

        if ($(".nav-sidebar li").mousemove(function () {
            const id = $(this).index();
            showMenu(id);
        })) ;
        if ($(".nav-sidebar li").mouseout(function () {
            hideMenu();
        })) ;
     })
</script>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--            实现个人信息页面跳转--%>
            <a class="navbar-brand" href="admin/toUpdateInfo">${sessionScope.auser.aname}</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="admin/toPageMain">Dashboard</a></li>
                <li><a href="admin/toUpdateInfo">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active">
                    <a href="adminGoods/selectGoods" >商品管理</a>
                    <ul class="nav nav-sidebar menu" hidden >
                        <li><a href="adminGoods/selectGoods">商品列表</a></li>
                        <li><a href="adminGoods/toAddGoods">商品添加</a></li>
                        <li><a href="adminGoods/selectGoods?act=deleteSelect">商品删除</a></li>
                    </ul>
                </li>
                <li>
                    <a href="adminNotice/selectNotices">公告管理</a>
                    <ul class="nav nav-sidebar menu" hidden >
                        <li><a href="adminNotice/selectNotices">公告列表</a></li>
                        <li><a href="adminNotice/toAddNotice">公告添加</a></li>
                        <li><a href="adminNotice/selectNotices?act=deleteNotice">公告删除</a> </li>
                    </ul>
                </li>
                <li><a href="adminType/toManagerType">类型管理</a></li>
                <li><a href="adminUser/userInfo">用户管理</a></li>
                <li><a href="adminOrder/orderInfo">订单管理</a></li>
                <li><a href="admin/exit">安全退出</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
            <h2 class="sub-header">商品详情</h2>
            <form class="form-horizontal" style="margin:0 auto;width: 550px" >
                <div class="form-group" >
                    <label class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.gname}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">原价</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.goprice}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">折扣价</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.grprice}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">库存</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.gstore}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">图片</label>
                    <div class="col-sm-10" >
                        <c:if test="${not empty goods.gpicture}">
                            <img src="logos/${goods.gpicture}" width="40px" height="40px" alt="..." class="img-rounded">
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">原价</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.goprice}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${goods.typeName}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><a href="adminGoods/selectAGoods?id=${goods.id}&act=updateAGoods" class="btn btn-default">修改</a> </label>
                    <div class="col-sm-10">
                        <p class="form-control-static"><a href="adminGoods/deleteAGoods?id=${goods.id}" class="btn btn-default">删除</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>

</body>
</html>
