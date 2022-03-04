package com.rabbit.service;

import com.github.pagehelper.PageHelper;
import com.rabbit.dao.BlogDao;
import com.rabbit.pojo.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    private final BlogDao blogDao;

    @Autowired
    public BlogServiceImpl(BlogDao blogDao) {
        this.blogDao = blogDao;
    }

    @Override
    public void addBlog(Blog blog) {
        if (blog!=null){
            blogDao.addBlog(blog);
        }
    }

    @Override
    public List<Blog> listAllBlogPaging(int page,int size) {
//        页码值和每页条数
        PageHelper.startPage(page,size);
       return blogDao.listAllBlog();
    }
    @Override
    public List<Blog> selectBlogByType(int page,int size,int blogType) {
//        页码值和每页条数
        PageHelper.startPage(page,size);
        return blogDao.selectBlogByType(blogType);
    }

    @Override
    public List<Blog> listAllBlogByUserId(int page, int size, int userId) {
        //        页码值和每页条数
        PageHelper.startPage(page,size);
        return blogDao.listAllBlogByUserId(userId);
    }

    @Override
    public List<Blog> listAllBlog() {
        return blogDao.listAllBlog();
    }

    @Override
    public void deleteBlogById(int blogId) {
        blogDao.deleteBlogById(blogId);
    }

    @Override
    public void updateBlog(Blog blog) {
        blogDao.updateBlog(blog);
    }

    @Override
    public Blog selectBlogById(int blogId) {
       return blogDao.selectBlogById(blogId);
    }

    @Override
    public Integer  getBlogSum() {
        return blogDao.getBlogSum();
    }

    @Override
    public List<Blog> getBloglist(int start, int count) {
        return blogDao.getBloglist(start, count);
    }

    @Override
    public List<Blog> selectTheFirstFour() {
        return blogDao.selectTheFirstFour();
    }

    @Override
    public List<Blog> QueryFive() {
        return blogDao.QueryFive();
    }

    @Override
    public List<Blog> selectBlogByBlogTypeFive(int blogType) {
        return blogDao.selectBlogByBlogTypeFive(blogType);
    }

    @Override
    public List<Blog> selectBlogeBylike() {
        return blogDao.selectBlogeBylike();
    }

    @Override
    public List<Blog> selectBlogByTitleAndBody(Blog blog) {
        return blogDao.selectBlogByTitleAndBody(blog);
    }
}
