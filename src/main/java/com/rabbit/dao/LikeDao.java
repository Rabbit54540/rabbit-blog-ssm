package com.rabbit.dao;

import com.rabbit.pojo.Like;

public interface LikeDao {
    void addLike(Like like);
    Like selectLikeForUserIdAndBlogId(int userid,int blogId);
}
