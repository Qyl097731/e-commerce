<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/11/3
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css"
          href="/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="/jquery/jquery-3.5.1.min.js"></script>
    <script src="/jquery/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>
    <link rel="stylesheet" type="text/css" href="/css/admin/dashboard.css">
    <link rel="stylesheet" type="text/css" href="/css/admin/main.css">
    <script>
        function showMenu(id) {
            $(".menu").hide().eq(id).css("display","block")
        }

        function hideMenu() {
            $(".menu").hidden;
        }
        $(document).ready(function () {
            if (${not empty msg}) {
                alert("${msg}")
            }
            if ($(".nav-sidebar li").mousemove(function () {
                const id = $(this).index();
                showMenu(id);
            })) ;
            if ($(".nav-sidebar li").mouseout(function () {
                hideMenu();
            })) ;
        })
    </script>
</head>

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
                <li>
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
                        <li><a href="adminNotice/selectNotice?act=deleteNotice">公告删除</a> </li>
                    </ul>
                </li>
                <li class="active"><a href="adminType/toManagerType">类型管理</a></li>
                <li><a href="adminUser/userInfo">用户管理</a></li>
                <li><a href="adminOrder/orderInfo">订单管理</a></li>
                <li><a href="admin/exit">安全退出</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="sub-header">商品列表</h2>
            <div class="table-responsive">
                <c:if test="${allTypes.size() == 0}">
                    您还没有商品。
                </c:if>
                <c:if test="${allTypes.size() != 0}">
                <table border="1" bordercolor="PaleGreen">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th width="100px">ID</th>
                            <th width="200px">名称</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${allTypes}" var="type">
                            <tr>
                                <td>${type.id}</td>
                                <td>${type.typename}</td>
                                <td><a href="adminType/deleteType?id=${type.id}">删除</a></td>
                            </tr>
                        </c:forEach>
                        <form:form modelAttribute="goodsType" action="adminType/addType">
                        <tr>
                                <td>#</td>
                                <td><form:input path="typename"/></td>
                                <td><input type="submit" value="添加" class="btn-success"></td>
                        </tr>
                        </form:form>
                        </tbody>
                    </table>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
</div>


</body>
</html>