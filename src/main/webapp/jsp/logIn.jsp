<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>

    </style>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body style="background-color: #e4faff">
<div class="container" >
    <ul class="t nav nav-tabs " style="height: 100px">
        <li style="margin-right: 11px;margin-top: 15px;font-size: 40px;font-style: italic;font-family: 楷体"><a  href="/index">首页</a></li>
        <ol class="breadcrumb navbar-right" style="padding-left: 17px;padding-right: 15px;margin-left: 40px;margin-top: 25px;margin-right: 4px;">
            <li style="margin-right: 11px"><a style="text-decoration: none;"  href="/register">注册</a></li>
        </ol>
    </ul>
</div>
<div class="container-fluid col-md-12">
    <h4 class="col-md-12" style="text-align: center;margin-left: -438px;margin-bottom: -8px; color: red">${Msg}</h4>
</div>
<div class="container-fluid col-md-12" >
    <form class="form-horizontal col-md-8 " action="/user/userLogin" method="post" style="margin-left: 204px;margin-top: 100px;">
        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userName" name="userName" placeholder="Text input">
            </div>
        </div>
        <div class="form-group">
            <label for="passWord" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="passWord" name="passWord" placeholder="Password">
            </div>
        </div>
        <button type="submit" style="text-align: center;background-color: #94bed2 " class="btn btn-default col-sm-offset-2 col-sm-10">登录</button>
    </form>
</div>


<div id="foot">
    <div class="navbar-collapse collapse navbar-fixed-bottom " style="background-color: #9bc2d2">
        <ul class="nav navbar-nav">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 用户管理</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-lock"></span> 管理员</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-list"></span> 栏目设置</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> 网站设置</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="#">
                    <span class="glyphicon glyphicon-log-out"></span> 退出
                </a>
            </li>
        </ul>
    </div>

</div>
</div>
</body>
</html>