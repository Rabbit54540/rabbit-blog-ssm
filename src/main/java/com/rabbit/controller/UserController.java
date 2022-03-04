package com.rabbit.controller;

import com.github.pagehelper.PageInfo;
import com.rabbit.pojo.Blog;
import com.rabbit.pojo.User;
import com.rabbit.service.BlogService;
import com.rabbit.service.UserService;
import com.rabbit.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final BlogService blogService;
    @Autowired
    public UserController(UserService userService, BlogService blogService) {
        this.userService = userService;
        this.blogService = blogService;
    }

    @RequestMapping(value = "register",method = RequestMethod.POST)
    public String register(User userRegister, HttpServletRequest request){
        User user = userRegister;
        if (user!=null){
            try {
                String userName = user.getUserName();
                if (userService.selectUserByUserName(userName)!=null){
                    request.setAttribute("Msg","注册失败，用户名已被占用！");
                    return "jsp/register";
                }else if (user.getUserEmail()==null||user.getUserEmail()==""){
                    request.setAttribute("Msg","注册失败，邮箱不能为空！");
                    return "jsp/register";
                }else if (user.getPassWord()==null||user.getPassWord()==""){
                    request.setAttribute("Msg","注册失败，密码不能为空！");
                    return "jsp/register";
                }else if (user.getUserName()==null||user.getUserName()==""){
                    request.setAttribute("Msg","注册失败，用户名不能为空！");
                    return "jsp/register";
                }else {
                    userService.addUser(user);
                    request.setAttribute("username",userName);
                    return "redirect:/index";
                }
            }catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("Msg", "发生未知错误！");
                return "jsp/error";
            }

        }
        request.setAttribute("Msg", "发生未知错误！");
        return "jsp/error";
    }
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    public String userLogin(User userLogin, HttpServletRequest request){
        User user = userService.selectUserByUserName(userLogin.getUserName());
        String password = "";
        if (user!=null){
            password = userService.selectPasswordByUserName(user.getUserName());
        }
        if (user!=null && userLogin.getPassWord().equals(password)){

            request.getSession().setAttribute("username",user.getUserName());
            request.getSession().setAttribute("userid",user.getUserId());
            return "redirect:/index";
        }else if (userLogin.getPassWord()==null||userLogin.getPassWord()==""){
            request.setAttribute("Msg","登录失败，密码不能为空！");
            return "jsp/logIn";
        }else if (userLogin.getUserName()==null||userLogin.getUserName()==""){
            request.setAttribute("Msg","登录失败，用户名不能为空！");
            return "jsp/logIn";
        }
        request.setAttribute("Msg", "用户名或密码错误！");
        return "jsp/error";
    }
    /*
    * int start = 0;
        int count = 5;
        try {
            start=Integer.parseInt(request.getParameter("page.start"));
            count=Integer.parseInt(request.getParameter("page.count"));
        }catch (Exception e){

        }
        Page page = new Page(start, count);
        //从数据库中取值 将 start 和count 传入
        // 后台sql语句如下：
        // SELECT * FROM user LIMIT #{start}, #{和count}
        //第一个参数是开始数据的索引位置
        //第二个参数是要查询多少条数据
        //这里解释一下原理，每次从数据库中取出部分数据，可防止内存溢出
        List<Blog> bloglist = blogService.getBloglist(page.getStart(), page.getCount());
        Integer blogSum = blogService.getBlogSum();
        page.setCount(blogSum);
        System.out.println("Start为"+page.getStart()+"Count为"+page.getCount());
        //request.setAttribute("blogs",bloglist);
        request.setAttribute("page",page);
        //request.setAttribute("blogs",bloglist);*/
    @RequestMapping("myBlog")
    public String userHomePage(@RequestParam(name = "page",required = true,defaultValue = "1") int page,@RequestParam(name = "size",required = true,defaultValue = "2") int size, HttpServletRequest request){
        Object userid = request.getSession().getAttribute("userid");
        List<Blog> blogs1 = blogService.listAllBlogByUserId(page,size, Integer.parseInt(userid.toString()));
        //request.setAttribute("blogs",blogs);
//        PageInfo就是一个分页的Bean
        PageInfo blogs = new PageInfo(blogs1);
        request.setAttribute("blogs",blogs);
        return "jsp/blog/myBlog";
    }
    @RequestMapping("logout")
    public String logout(HttpServletRequest request ){
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("userid");
        return "redirect:/index";
    }


}
