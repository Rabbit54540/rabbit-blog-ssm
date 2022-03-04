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
                <c:when test="${username != null}">
                    <li style="margin-right: 11px"><a style="text-decoration: none;" >${username}</a></li>
                    <li style="margin-right: 11px"><a style="text-decoration: none;"  href="/user/logout">注销</a></li>
                </c:when>
                <c:when test="${username == null}">
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
                    <li style="margin-left: 30px;"><a href="/blog/allBlog">全部博客</a></li>
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
                        <c:when test="${username != null}">
                            <li style="margin-left: 30px;"><a href="/user/myBlog?username=${username}?userid=${userid}?page=1&size=2">我的文章</a></li>
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
<div class="container">
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="../../image/pose%20(10).jpg" style="width: 242px;height: 200px" alt="...">
            <div class="caption">
                <h3>抒情文</h3>
                <p><a href="/addBlog?username=${username}?userid=${userid}" class="btn btn-primary" role="button">添加</a></p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="../../image/pose%20(10).jpg" style="width: 242px;height: 200px" alt="...">
            <div class="caption">
                <h3>记叙文</h3>
                <p><a href="/addBlogSecond?username=${username}?userid=${userid}" class="btn btn-primary" role="button">添加</a></p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
            <img src="../../image/pose%20(10).jpg" style="width: 242px;height: 200px" alt="...">
            <div class="caption">
                <h3>说明文</h3>
                <p><a href="/addBlogThirdly?username=${username}?userid=${userid}" class="btn btn-primary " role="button">添加</a></p>
            </div>
        </div>
    </div>
</div>
<c:forEach items="${blogs.list}" var="blogs">
    <form >
        <div class="container panel panel-default">
            <div class="panel-body">
                <img class="col-sm-6 col-md-4" style="width:240px;height: 200px;padding-bottom: 13px;margin-bottom: 3px;padding-left: 0px;padding-right: 1px;margin-top: 10px;padding-top: 5px;left: -12px;top: -5px;" alt="..."  src="${pageContext.request.contextPath}${blogs.blogImage}">
                <a href="/blog/blogContent?blogId=${blogs.blogId}" style="text-decoration: none;margin-left: 0px;padding-left: 13px;padding-bottom: 83px;padding-top: 5px;margin-top: 31px;">
                    <h3 style="margin-top: -22px;padding-top: 16px;margin-bottom: 34px;margin-left: 154px;padding-left: 107px;">${blogs.blogTitle}</h3>
                </a>
                <p style="margin-top: -28px;margin-left: 290px;padding-bottom: 19px;padding-left: 11px;">${blogs.blogBody}</p>
                <a class="btn btn-primary  navbar-right" href="/blog/deleteBlogById?blogId=${blogs.blogId}"  style="margin-left: 932px;margin-top: -41px;margin-bottom: -19px;">删除</a>
                <a class="btn btn-primary  navbar-right" href="/blog/updateBlog?blogId=${blogs.blogId}"   style="margin-left: -12px;margin-right: 57px;margin-bottom: -1px;margin-top: -41px;">修改</a>
            </div>
        </div>
    </form>

</c:forEach>


<div id="foot">

    <div class="container">
        <nav aria-label="Page navigation" class="col-md-12 ">
            <ul class="pagination navbar-right  pagination-lg" style="margin-top: -22px;">
                <li>
                    <a href="/user/myBlog?page=1&size=2" aria-label="Previous">
                        <span aria-hidden="true">首页</span>
                    </a>
                </li>
                <li>
                    <a href="/user/myBlog?page=${blogs.pageNum-1}&size=2" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${blogs.pages}" var="pageNum" >
                    <li><a href="/user/myBlog?page=${pageNum}&size=2">${pageNum}</a></li>
                </c:forEach>
                <%--<li><a href="#">1</a></li>--%>
                <%--<li><a href="#">2</a></li>--%>
                <%--<li><a href="#">3</a></li>--%>
                <%--<li><a href="#">4</a></li>--%>
                <%--<li><a href="#">5</a></li>--%>
                <li>
                    <a href="/user/myBlog?page=${blogs.pageNum+1}&size=2" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li>
                    <a href="/user/myBlog?page=${blogs.pages}&size=2" aria-label="Next">
                        <span aria-hidden="true">尾页</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="navbar-collapse collapse " style="background-color: #9bc2d2">
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