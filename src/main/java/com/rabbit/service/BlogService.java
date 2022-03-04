package com.rabbit.service;

import com.rabbit.pojo.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogService {
    void addBlog(Blog blog);
    List<Blog> listAllBlogPaging(int page,int size);
    List<Blog> selectBlogByType(int page,int size,int blogType);
    List<Blog> listAllBlogByUserId(int page,int size,int userId);
    List<Blog> listAllBlog();
    void deleteBlogById(int blogId);
    void updateBlog(Blog blog);
    Blog selectBlogById(int blogId);
    Integer  getBlogSum();
    List<Blog> getBloglist(int start,int count);
    List<Blog> selectTheFirstFour();
    List<Blog> QueryFive();
    List<Blog> selectBlogByBlogTypeFive(int blogType);
    List<Blog> selectBlogeBylike();
    List<Blog> selectBlogByTitleAndBody(Blog blog);
}
