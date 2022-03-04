<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>

    </style>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script  type="text/javascript">
        $(document).ready(function(){
            $("button#like").click(function(){
                $("button#like").css("background-color","#2e6da4");
                var num = Number($("span.badge").text()) + Number(1)
                $("span.badge").text(num);
                $("button#like").unbind("click");
                $( this ).attr( "disabled" , "disabled" );

            });
        });

        function a1() {
            $.post({
                url:"/like/addLike",
                data:{"badge":${blogLikeQuantity},"blogId":${blogId}},
                success:function (data) {
                    alert(data)
                }
            });
        }
    </script>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Summernote</title>


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
<div class="container panel panel-default">
    <div class="panel-body">
        <input type="hidden" name="blogId" value="${blogId}">
        <form action="/index">
            <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable center"
                   align="center">
                <tr>
                    <td>
                        <div class="input-group input-group-lg">
                            <input value="${blogTitle}" name="blogTitle" readonly type="text" class="form-control" aria-describedby="sizing-addon1" style="outline: none;cursor: pointer; border: none;padding-right: 356px;background-color: white">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="mdl-textfield mdl-js-textfield">
                           <textarea  autoHeight="true" readonly="readonly"  style="outline: none;cursor: pointer; border: none;width: 100%;height: 100%;resize: none;width: 1120px;height: 300px;margin-top: 8px;margin-bottom: 3px;" class="mdl-textfield__input " type="text" name="boardDesc"
                                      id="boardDesc" rows="3" maxrows="3">${boardDesc}</textarea>
                            <label class="mdl-textfield__label" for="boardDesc"></label>
                        </div>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <button class="btn btn-success" type="button" onclick="a1()" href="#" id="like" >
                            点赞 <span class="badge">${blogLikeQuantity}</span>
                        </button>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <button type="submit" style="text-align: center;background-color: #94bed2 " class="btn btn-default col-sm-offset-2 col-sm-10 navbar-right">注册</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div id="foot">
    <div class="navbar-collapse collapse  navbar-fixed-bottom" style="background-color: #9bc2d2">
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