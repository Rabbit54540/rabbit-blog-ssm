<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script  type="text/javascript">
        // $(document).ready(function(){
        //     $("a#blog0").click(function () {
        //         $("div#way").empty();
        //     });
        // });
        $(function () {
            $("#blog0").click(function () {
                $.post("blog/selectBlogByBlogTypeFive?blogtype=0",function (data) {
                    console.log(data);
                    var html = ""
                    for (var i=0;i<data.length;i++){
                        html+="<div class=\"col-md-4\"style=\"margin-top: 14px;margin-left: -24px;margin-right: 116px;\">\n"
                            +"<div class=\"row\" id=\"way\"\">"
                            +"<div class=\"col-sm-6 col-md-12\" style=\"margin-left: -85px;padding-right: 0px;\">\n"
                            +"<div class=\"thumbnail\" style=\"margin-top: 4px;margin-bottom: 2px;padding-bottom: 106px;padding-left: 4px;margin-left: 0px;margin-right: -315px;\">\n"
                            +"<img src=\""
                            +data[i].blogImage
                            +"\" style=\"width: 100px; height: 100px;padding-left: 4px;padding-right: 1px;\"class=\"col-md-4\">"
                            +"<div class=\"col-md-8\">\n"
                            +"<a href=\"/blog/blogContentForIndex?blogId="
                            +data[i].blogId
                            +"\" style=\"font-size: 15px;text-decoration: none;\">"
                            +data[i].blogTitle
                            +"</a>"
                            +"<p>"
                            +data[i].blogBody
                            +"</p>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                    }
                   // $("#content").remove();
                    $("div#way").remove();
                    $("#content").html(html);
                })

            })
        })
        $(function () {
            $("#blog1").click(function () {
                $.post("blog/selectBlogByBlogTypeFive?blogtype=1",function (data) {
                    console.log(data);
                    var html = ""
                    for (var i=0;i<data.length;i++){
                        html+="<div class=\"col-md-4\"style=\"margin-top: 14px;margin-left: -24px;margin-right: 116px;\">\n"
                            +"<div class=\"row\" id=\"way\"\">"
                            +"<div class=\"col-sm-6 col-md-12\" style=\"margin-left: -85px;padding-right: 0px;\">\n"
                            +"<div class=\"thumbnail\" style=\"margin-top: 4px;margin-bottom: 2px;padding-bottom: 106px;padding-left: 4px;margin-left: 0px;margin-right: -315px;\">\n"
                            +"<img src=\""
                            +data[i].blogImage
                            +"\" style=\"width: 100px; height: 100px;padding-left: 4px;padding-right: 1px;\"class=\"col-md-4\">"
                            +"<div class=\"col-md-8\">\n"
                            +"<a href=\"/blog/blogContentForIndex?blogId="
                            +data[i].blogId
                            +"\" style=\"font-size: 15px;text-decoration: none;\">"
                            +data[i].blogTitle
                            +"</a>"
                            +"<p>"
                            +data[i].blogBody
                            +"</p>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                    }
                    // $("#content").remove();
                    $("div#way").remove();
                    $("#content").html(html);
                })

            })
        })
        $(function () {
            $("#blog2").click(function () {
                $.post("blog/selectBlogByBlogTypeFive?blogtype=2",function (data) {
                    console.log(data);
                    var html = ""
                    for (var i=0;i<data.length;i++){
                        html+="<div class=\"col-md-4\"style=\"margin-top: 14px;margin-left: -24px;margin-right: 116px;\">\n"
                            +"<div class=\"row\" id=\"way\"\">"
                            +"<div class=\"col-sm-6 col-md-12\" style=\"margin-left: -85px;padding-right: 0px;\">\n"
                            +"<div class=\"thumbnail\" style=\"margin-top: 4px;margin-bottom: 2px;padding-bottom: 106px;padding-left: 4px;margin-left: 0px;margin-right: -315px;\">\n"
                            +"<img src=\""
                            +data[i].blogImage
                            +"\" style=\"width: 100px; height: 100px;padding-left: 4px;padding-right: 1px;\"class=\"col-md-4\">"
                            +"<div class=\"col-md-8\">\n"
                            +"<a href=\"/blog/blogContentForIndex?blogId="
                            +data[i].blogId
                            +"\" style=\"font-size: 15px;text-decoration: none;\">"
                            +data[i].blogTitle
                            +"</a>"
                            +"<p>"
                            +data[i].blogBody
                            +"</p>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                            +"</div>"
                    }
                    // $("#content").remove();
                    $("div#way").remove();
                    $("#content").html(html);
                })

            })
        })
    </script>

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
<div id="body" class="row" >
    <div id="myCarousel1" class="carousel slide col-xs-6 col-md-12" >
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel1" data-slide-to="1"></li>
            <li data-target="#myCarousel1" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner" >
            <div class="item active" >
                <a href="#" class="thumbnail">
                    <img src="image/slide1.jpg" style="width: 1250px; height: 600px " alt="First slide">
                </a>
            </div>
            <div class="item">
                <a href="#" class="thumbnail">
                    <img src="image/slide2.jpg" style="width: 1250px; height: 600px" alt="Second slide">
                </a>
            </div>
            <div class="item">
                <a href="#" class="thumbnail">
                    <img src="image/slide3.jpg" style="width: 1250px; height: 600px" alt="Second slide">
                </a>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left"  href="#myCarousel1"
           data-slide="prev" style="background-image:linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0, 0, 0, 0.13) 100%);margin-bottom: 22px;">‹</a>
        <a class="carousel-control right" href="#myCarousel1"
           data-slide="next" style="background-image:linear-gradient(to left,rgba(0,0,0,.0001) 0,rgba(0, 0, 0, 0.13) 100%);margin-bottom: 22px;">›</a>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- Contextual button for informational alert messages -->
                <div>
                    <h1 style="margin-bottom: 17px;padding-top: 19px;">精选文章</h1>

                </div>

                <c:forEach items="${optimumBlog}" var="blogs">
                <div class="row">
                    <div class="col-sm-6 col-md-12">
                        <div class="thumbnail">
                            <img src="${blogs.blogImage}" style="width: 350.167px;height: 541px" class="rounded" alt="lalalalala">
                            <div class="caption">
                                <a href="/blog/blogContentForIndex?blogId=${blogs.blogId}" style="font-size: 30px;text-decoration: none;" >${blogs.blogTitle}</a>
                                <p>${blogs.blogBody}</p>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="col-md-4"style="margin-top: 44px;margin-left: 71px;">
                <a style="margin-left: 245px;margin-bottom: 0px;padding-bottom: 0px;padding-top: 0px;">
                    <a type="button" class="btn btn-default col-md-3" id="blog0"  href="#">抒情文</a>
                    <a type="button" class="btn btn-default col-md-3" id="blog1"  href="#" style="margin-left: 4px;margin-top: -20px;">记叙文</a>
                    <a type="button" class="btn btn-default col-md-3" id="blog2"  href="#" style="margin-left: 4px;margin-top: -20px;">说明文</a>
                </a>
                <table id="content">
                    <c:forEach items="${QueryFive}" var="blogs">
                        <div class="row" id="way">
                            <div class="col-sm-6 col-md-12" style="margin-left: -85px;padding-right: 0px;">
                                <div class="thumbnail" style="margin-top: 19px;margin-bottom: 0px;padding-bottom: 106px;padding-left: 3px;padding-right: 0px;margin-right: -38px;margin-left: -10px;">
                                    <img src="${blogs.blogImage}" style="width: 100px; height: 100px;padding-left: 4px;padding-right: 1px;"class="col-md-4">
                                    <div class="col-md-8">
                                        <a href="/blog/blogContentForIndex?blogId=${blogs.blogId}" style="font-size: 15px;text-decoration: none;">${blogs.blogTitle}</a>
                                        <p>${blogs.blogBody}</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </table>
            </div>

        </div>
            <div class="col-md-4 navbar-right" style="margin-top: -689px;">
                <div class="row">
                    <div class="col-sm-6 col-md-12">
                        <div class="thumbnail"style="padding-top: 217px;padding-bottom: 126px;margin-left: 9px;margin-bottom: 20px;margin-top: -36px;">
                            <img src="image/pose%20(10).jpg" style="width: 350px; height: 220px" class="rounded" alt="lalalalala">
                            <div class="caption" style="padding-bottom: 56px;">
                                <a href="#" style="font-size: 30px;text-decoration: none;">Thumbnail label</a>
                                <p>aaaaaaaaaaaaaaaaaa...</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
    </div>

</div>
<div id="foot">
    <div class="container" >
            <div class="row">
                <c:forEach items="${TheFirstFour}" var="blogs">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${blogs.blogImage}" style="height: 500px" alt="...">
                        <div class="caption">
                            <h3>${blogs.blogTitle}</h3>
                            <p>${blogs.blogBody}</p>
                            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>

    </div>
    <c:forEach items="${blogs.list}" var="blogs">
        <div class="container">
            <div class="col-sm-6 col-md-12">
                <div class="thumbnail">
                    <img class="col-sm-6 col-md-4" src="${blogs.blogImage}" style="width:150px;height: 180px;padding-bottom: 56px;margin-bottom: 3px;padding-left: 0px;" alt="...">
                    <div class="caption">
                        <a style="text-decoration: none;">
                            <h3 style="margin-top: 8px;padding-top: 0px;margin-bottom: 34px;margin-left: 154px;">${blogs.blogTitle}</h3>
                        </a>
                        <p style="margin-top: -31px;margin-left: 177px;padding-bottom: 19px;">${blogs.blogBody}</p>
                        <a href="/blog/blogContentForIndex?blogId=${blogs.blogId}" target="_blank" class="read_more">阅读更多</a> </li>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="container">
        <nav aria-label="Page navigation" class="col-md-12 ">
            <ul class="pagination navbar-right  pagination-lg"  style="margin-top: -22px;margin-bottom: 65px;">
                <li>
                    <a href="/index?page=1&size=5" aria-label="Previous">
                        <span aria-hidden="true">首页</span>
                    </a>
                </li>
                <li>
                    <a href="/index?page=${blogs.pageNum-1}&size=5" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${blogs.pages}" var="pageNum" >
                    <li><a href="/index?page=${pageNum}&size=5">${pageNum}</a></li>
                </c:forEach>
                <%--<li><a href="#">1</a></li>--%>
                <%--<li><a href="#">2</a></li>--%>
                <%--<li><a href="#">3</a></li>--%>
                <%--<li><a href="#">4</a></li>--%>
                <%--<li><a href="#">5</a></li>--%>
                <li>
                    <a href="/index?page=${blogs.pageNum+1}&size=5" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <li>
                    <a href="/index?page=${blogs.pages}&size=5" aria-label="Next">
                        <span aria-hidden="true">尾页</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
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
</body>
</html>