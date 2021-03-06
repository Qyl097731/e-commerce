<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/11/3
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="jquery/jquery-3.5.1.js"></script>
    <script src="css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="css/login.css" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $("#code").click(function () {
                $("#code").prop("src", "validateCode?" + new Date().getTime());
            })
        })
    </script>
</head>
<body>
<div class="container">

    <form:form action="before/login" method="post" class="form-signin" modelAttribute="buser">
        <label for="input_aname" class="sr-only">Email address</label>
        <form:input path="bemail" type="text" id="input_aname" class="form-control" placeholder="username"/>
        <label for="inputPassword" class="sr-only">Password</label>
        <div style="font-size: xx-small ;color: red">${empty bemailError ? '<br>':bemailError}</div>
        <form:input type="password" path="bpwd" id="inputPassword" class="form-control" placeholder="password"/>
        <div style="font-size: xx-small ;color: red">${empty passwordError ? '<br>':passwordError}</div>
        <input type="text" name="code" style="width: 225px" required/>
        <img id="code" src="validateCode"/>
        <div style="font-size: xx-small ;color: red" id="codeError">${empty codeError ?'<br>':codeError}</div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form:form>

</div>
</body>
</html>