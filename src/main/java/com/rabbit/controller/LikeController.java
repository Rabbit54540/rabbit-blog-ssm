package com.rabbit.controller;

import com.rabbit.pojo.Blog;
import com.rabbit.pojo.Like;
import com.rabbit.service.BlogService;
import com.rabbit.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;

@Controller
@RequestMapping("/like")
public class LikeController {
    private final LikeService likeService;
    private final BlogService blogService;

    @Autowired
    public LikeController(LikeService likeService, BlogService blogService) {
        this.likeService = likeService;
        this.blogService = blogService;
    }

    @RequestMapping("/addLike")
    public void addLike(String badge, String blogId, HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String msg = "点赞成功";
        Blog blog = new Blog();
        blog.setBlogId(Integer.parseInt(blogId));
        blog.setBlogLikeQuantity(Integer.parseInt(badge)+1);
        blogService.updateBlog(blog);
        Like like = new Like();
        Object userid = request.getSession().getAttribute("userid");
        if (userid!=null){
            like.setUserId(Integer.parseInt(userid.toString()));
        }
        like.setBlogId(Integer.parseInt(blogId));
        likeService.addLike(like);
        response.getWriter().print(msg);
    }
    @RequestMapping("/addLike2")
    public String addLike2(String badge, String blogId, HttpServletResponse response,HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String msg = "";
        Object userid = request.getSession().getAttribute("userid");
        if (userid!=null){
            Like like1 = likeService.selectLikeForUserIdAndBlogId(Integer.parseInt(userid.toString()), Integer.parseInt(blogId));
            if (like1==null){
                Blog blog = new Blog();
                blog.setBlogId(Integer.parseInt(blogId));
                blog.setBlogLikeQuantity(Integer.parseInt(badge)+1);
                blogService.updateBlog(blog);
                Like like = new Like();
                like.setUserId(Integer.parseInt(userid.toString()));
                like.setBlogId(Integer.parseInt(blogId));
                like.setState(1);
                likeService.addLike(like);
                msg="点赞成功";
            }else {
                msg="你已经点过啦";
            }

        }else {
            msg="请先登录后点赞";
        }
        return msg;
    }

//    @RequestMapping("/addLike")
//    public String addLike(String badge, String blogId, HttpServletResponse response,HttpServletRequest request) throws IOException {
//        Blog blog = new Blog();
//        blog.setBlogId(Integer.parseInt(blogId));
//        blog.setBlogLikeQuantity(Integer.parseInt(badge));
//        blogService.updateBlog(blog);
//        Like like = new Like();
//        Object userid = request.getSession().getAttribute("userid");
//        like.setUserId(Integer.parseInt(userid.toString()));
//        like.setBlogId(Integer.parseInt(blogId));
//        likeService.addLike(like);
//        return "redirect:/index";
//    }


}
