package com.rabbit.controller;

import com.github.pagehelper.PageInfo;
import com.rabbit.pojo.Blog;
import com.rabbit.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController {
    private final BlogService blogService;

    @Autowired
    public MainController(BlogService blogService) {
        this.blogService = blogService;
    }

    @RequestMapping("/index")
    public String index(@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "5") int size, HttpServletRequest request){
        List<Blog> AllBlogPaging = blogService.listAllBlogPaging(page,size);
        PageInfo blogs = new PageInfo(AllBlogPaging);
        request.setAttribute("blogs",blogs);
        List<Blog> TheFirstFour = blogService.selectTheFirstFour();
        request.setAttribute("TheFirstFour",TheFirstFour);
        List<Blog> QueryFive = blogService.QueryFive();
        request.setAttribute("QueryFive",QueryFive);
        List<Blog> optimumBlog = blogService.selectBlogeBylike();
        System.out.println(optimumBlog);
        request.setAttribute("optimumBlog",optimumBlog);
//        request.setAttribute("optimumBlogImag",blog.getBlogImage());
//        request.setAttribute("optimumBlogTitle",blog.getBlogTitle());
//        request.setAttribute("optimumBlogBody",blog.getBlogBody());
        return "index";
    }

    @RequestMapping("/login")
    public String logIn(){
        return "jsp/logIn";
    }

    @RequestMapping("/register")
    public String register(){
        return "jsp/register";
    }

    @RequestMapping("/addBlog")
    public String addBlog(){
        return "jsp/blog/addBlog";
    }

    @RequestMapping("/addBlogSecond")
    public String addBlogSecond(){
        return "jsp/blog/addBlogSecond";
    }

    @RequestMapping("/addBlogThirdly")
    public String addBlogThirdly(){
        return "jsp/blog/addBlogThirdly";
    }

    @RequestMapping("/myBlog")
    public String myBlog(HttpServletRequest request){
        return "jsp/blog/myBlog";
    }

    @RequestMapping("/myVideo")
    public String myVideo(){
        return "jsp/blog/myVideo";
    }

}
