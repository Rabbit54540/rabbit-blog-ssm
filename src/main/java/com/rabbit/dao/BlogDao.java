package com.rabbit.dao;

import com.rabbit.pojo.Blog;
import com.rabbit.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogDao {
    void addBlog(Blog blog);
    List<Blog> listAllBlog();
    List<Blog> listAllBlogByUserId(int userId);
    void deleteBlogById(int blogId);
    void updateBlog(Blog blog);
    Blog selectBlogById(int blogId);
    List<Blog> selectTheFirstFour();
    List<Blog> QueryFive();
    List<Blog> selectBlogByType(int blogType);
    List<Blog> selectBlogByBlogTypeFive(int blogType);
    Integer  getBlogSum();
    List<Blog> getBloglist(@Param("start") int start,@Param("count") int count);
    List<Blog> selectBlogeBylike();
    List<Blog> selectBlogByTitleAndBody(Blog blog);
}
