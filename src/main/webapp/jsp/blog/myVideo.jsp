<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>

    </style>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body style="background-color: #e4faff">
<div id="hade" class="container" >
    <ul class="t nav nav-tabs " style="height: 100px">
        <li style="margin-right: 11px;margin-top: 15px;font-size: 40px;font-style: italic;font-family: 楷体"><h1 style="color: #2aabd2">首页</h1></li>
        <ol class="breadcrumb navbar-right" style="padding-left: 17px;padding-right: 15px;margin-left: 40px;margin-top: 25px;margin-right: 4px;">
            <c:choose>
                <c:when test="true">
                    <li style="margin-right: 11px"><a style="text-decoration: none;" >admin</a></li>
                    <li style="margin-right: 11px"><a style="text-decoration: none;"  href="/user/logout">注销</a></li>
                </c:when>
                <c:when test="false">
                    <li style="margin-right: 11px"><a style="text-decoration: none;" href="/login">登录</a></li>
                    <li style="margin-right: 11px"><a style="text-decoration: none;"  href="/register">注册</a></li>
                </c:when>
            </c:choose>


        </ol>
    </ul>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/index">网站首页</a>
                </div>
                <ul class="nav navbar-nav">
                    <li style="margin-left: 30px;"><a href="blog/allBlog">全部博客</a></li>
                    <li style="margin-left: 30px;" class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">文章畅读<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="blog/selectBlogByType?type=0">抒情文</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="blog/selectBlogByType?type=1">记叙文</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="blog/selectBlogByType?type=2">说明文</a></li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="true">
                            <li style="margin-left: 30px;"><a href="/user/myBlog?username=admin?userid=5?page=1&size=2">我的文章</a></li>
                            <li style="margin-left: 30px;"><a href="/image/myImage">我的相册</a></li>
                            <li style="margin-left: 30px;"><a href="/myVideo">我的视频</a></li>
                            <li style="margin-left: 30px;"><a href="#">个人简历</a></li>
                        </c:when>
                    </c:choose>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <div class=" navbar-header dropdown">
                        <a style="size: 60px;margin-top: -2px;margin-left: 0px;padding-left: 15px;margin-right: -30px;font-size: 30px;
                background-color: #5b93be;padding-right: 12px;padding-top: 9px;padding-bottom: 11px;border-top-width: 0px;
                border-top-style: solid;margin-bottom: 2px; text-decoration:none" class="glyphicon glyphicon-search navbar-right "  data-toggle="dropdown">

                        </a>
                        <ul class="dropdown-menu container" style="background-color: #d2e8e9; margin-left: -783px;padding-right: -26px;margin-right: 5px;padding-left: 4px;left: -323px;">
                            <form action="/blog/selectBlogByTitleAndBody" method="post">
                                <div class="col-sm-5" id="so" style="margin-left: 353px;padding-left: 0px;margin-right: -1px;" >
                                    <div class="input-group">
                                        <input type="text" name="value" class="form-control" onkeydown="onKeyDown(event)"/>
                                        <span class="input-group-addon"><button><i class="glyphicon glyphicon-search"> <span >搜索   </span></i></button></span>
                                    </div>
                                </div>
                            </form>
                        </ul>
                    </div>
                </ul>

            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="container col-md-12 " style="padding-left: -49px;left: -60px;">
    <div class="embed-responsive embed-responsive-16by9 " style="margin-left: 166px;">
        <embed class="embed-responsive-item text-center"  style="width: 1000px;height: 600px" src="//player.bilibili.com/player.html?aid=840306899&bvid=BV1C54y197yw&cid=179433430&page=1"></embed>
    </div>

</div>



<div id="foot">
    <div class="navbar-collapse collapse navbar-fixed-bottom" style="background-color: #9bc2d2">
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