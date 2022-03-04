package com.rabbit.controller;

import com.github.pagehelper.PageInfo;
import com.rabbit.pojo.Blog;
import com.rabbit.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/blog")
@Controller
public class BlogController {
    private final BlogService blogService;

    @Autowired
    public BlogController(BlogService blogService) {
        this.blogService = blogService;
    }


    @RequestMapping(value = "addblog",method = RequestMethod.POST)
//    @RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
//    批量上传CommonsMultipartFile则为数组即可
    public String addblog(@RequestParam("file") CommonsMultipartFile file, Blog blogadd, HttpServletRequest request) throws IOException {
        Blog blog = blogadd;
        if (blog!=null){
            try {

                Integer a = (Integer) request.getSession().getAttribute("userid");
                String blogType = request.getParameter("blogType");
                Integer integer = Integer.valueOf(blogType);
                blog.setBlogType(integer);
                blog.setUserId(a);


////        获取文件名
//        String uploadFileName = file.getOriginalFilename();
//        System.out.println(uploadFileName);
////        上传路径保存设置
//        String path = request.getSession().getServletContext().getRealPath("/image");
////        如果路径不存在，创造一个
//        File realPath = new File(path);
//        if (!realPath.exists()){
//            realPath.mkdir();
//        }
//
//        InputStream is = file.getInputStream();
//        OutputStream os = new FileOutputStream(new File(realPath, uploadFileName));
//
//        int len=0;
//        byte[] buffer=new byte[1024];
//        while ((len=is.read(buffer))!=-1){
//            os.write(buffer,0,len);
//            os.flush();
//        }
//        os.close();
//        is.close();

                String path = request.getSession().getServletContext().getRealPath("/image");
                File realPath = new File(path);
                if (!realPath.exists()){
                    realPath.mkdir();
                }
                System.out.println("上传文件地址"+realPath);
                file.transferTo(new File(realPath+"/"+file.getOriginalFilename()));
                String fileName= new String(realPath+"\\"+file.getOriginalFilename());
                blog.setBlogImage("/image/"+file.getOriginalFilename());
                System.out.println(fileName);
            }catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("Msg", "封面不能为空！");
                return "jsp/error";
            }
            if (blogadd!=null){
                blogService.addBlog(blog);
//                List<Blog> blogs = blogService.listAllBlog();
//                request.setAttribute("blogs",blogs);
                return "redirect:/user/myBlog";
            }
        }


        request.setAttribute("Msg", "发生未知错误！");
        return "jsp/error";
    }

    @RequestMapping("deleteBlogById")
    public String deleteBlogById(HttpServletRequest request){
        String userid = request.getParameter("blogId");
        System.out.println(userid);
        blogService.deleteBlogById(Integer.valueOf(userid));
//        List<Blog> blogs = blogService.listAllBlog();
//        request.setAttribute("blogs",blogs);
        return "redirect:/user/myBlog";

    }
    @RequestMapping("updateBlog")
    public String updateBlog(HttpServletRequest request){
        String blogId = request.getParameter("blogId");
        Blog blog = blogService.selectBlogById(Integer.parseInt(blogId));
        System.out.println(blog.getBlogTitle());
        System.out.println(blog.getBlogBody());
        request.setAttribute("blogId",blogId);
        request.setAttribute("blogTitle",blog.getBlogTitle());
        request.setAttribute("blogBody",blog.getBlogBody());
        request.setAttribute("blogType",blog.getBlogType());
        return "jsp/blog/updateBlog";

    }
    @RequestMapping(value = "updateBlogById",method = RequestMethod.POST)
    public String updateBlogById(@RequestParam("file") CommonsMultipartFile file,Blog blogadd,HttpServletRequest request) throws IOException {
//        Blog blog = new Blog();
        //String blogId = request.getParameter("blogId");
       // blogadd.setBlogId(Integer.valueOf(blogId));
//        String blogType = request.getParameter("blogType");
//        String blogBody = request.getParameter("blogBody");
//        blog.setBlogTitle(blogType);
//        blog.setBlogBody(blogBody);
//        System.out.println("blogId为"+blogId);
        Object userid = request.getSession().getAttribute("userid");
        Blog blog = new Blog();
        blog.setUserId(Integer.parseInt(userid.toString()));
        blog.setBlogBody(blogadd.getBlogBody());
        blog.setBlogTitle(blogadd.getBlogTitle());
        blog.setBlogId(blogadd.getBlogId());
        try {
            String path = request.getSession().getServletContext().getRealPath("/image");
            File realPath = new File(path);
            if (!realPath.exists()){
                realPath.mkdir();
            }
            System.out.println("上传文件地址"+realPath);
            file.transferTo(new File(realPath+"/"+file.getOriginalFilename()));
            String fileName= new String(realPath+"\\"+file.getOriginalFilename());
            blog.setBlogImage("/image/"+file.getOriginalFilename());
            System.out.println(blog.toString());
            blogService.updateBlog(blog);
//            List<Blog> blogs = blogService.listAllBlog();
//            request.setAttribute("blogs",blogs);
            return "redirect:/user/myBlog";

        }catch (Exception e) {
            e.printStackTrace();
            blogService.updateBlog(blog);
//            List<Blog> blogs = blogService.listAllBlog();
//            request.setAttribute("blogs",blogs);
            return "redirect:/user/myBlog";

        }

    }
    @RequestMapping("blogContent")
    public String blogContent(HttpServletRequest request){
        String blogId = request.getParameter("blogId");
        Blog blog = blogService.selectBlogById(Integer.parseInt(blogId));
        request.setAttribute("boardDesc",blog.getBlogBody());
        request.setAttribute("blogTitle",blog.getBlogTitle());
        return "jsp/blog/blogContent";
    }

    @RequestMapping("blogContentForIndex")
    public String blogContentForIdex(HttpServletRequest request){
        String blogId = request.getParameter("blogId");
        Blog blog = blogService.selectBlogById(Integer.parseInt(blogId));
        request.setAttribute("boardDesc",blog.getBlogBody());
        request.setAttribute("blogId",blog.getBlogId());
        request.setAttribute("blogTitle",blog.getBlogTitle());
        request.setAttribute("blogLikeQuantity",blog.getBlogLikeQuantity());
        return "jsp/blog/blogContentForIndex";
    }
    @RequestMapping("selectBlogByBlogTypeFive")
    @ResponseBody
    public List<Blog> selectBlogByBlogTypeFive(HttpServletRequest request){
        Object blogtype = request.getParameter("blogtype");
        List<Blog> BlogByBlogTypeFive = blogService.selectBlogByBlogTypeFive(Integer.parseInt(blogtype.toString()));
        return BlogByBlogTypeFive;
    }
    @RequestMapping("/allBlog")
    public String allBlog(@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "5") int size, HttpServletRequest request){
        List<Blog> AllBlogPaging = blogService.listAllBlogPaging(page,size);
        PageInfo blogs = new PageInfo(AllBlogPaging);
        request.setAttribute("blogs",blogs);
        return "/jsp/blog/allBlog";
    }

    @RequestMapping("selectBlogByType")
    public String selectBlogByType(@RequestParam(name = "page",required = true,defaultValue = "1") int page, @RequestParam(name = "size",required = true,defaultValue = "5") int size, HttpServletRequest request){
        String type = request.getParameter("type");
        int i = Integer.parseInt(type);
        List<Blog> AllBlogPaging = blogService.selectBlogByType(page,size,i);
        for (Blog blog : AllBlogPaging) {
            System.out.println("aaaaa"+blog);
        }
        PageInfo blogs = new PageInfo(AllBlogPaging);
        request.setAttribute("blogs",blogs);
        return "/jsp/blog/allBlog";
    }
    @RequestMapping(value = "selectBlogByTitleAndBody",method = RequestMethod.POST)
    public String selectBlogByTitleAndBody(HttpServletRequest request){
        String value = request.getParameter("value");
        Blog blog = new Blog();
        blog.setBlogTitle(value);
        blog.setBlogBody(value);
        List<Blog> blogs = blogService.selectBlogByTitleAndBody(blog);
        for (Blog blog1 : blogs) {
            System.out.println("kkkkkkk"+blog1);
        }
        request.setAttribute("blogs",blogs);
        return "/jsp/blog/selectBlog";
    }
}
