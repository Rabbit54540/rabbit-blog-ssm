package com.rabbit.service;

import com.rabbit.pojo.Like;

public interface LikeService {
    void addLike(Like like);
    Like selectLikeForUserIdAndBlogId(int userid,int blogId);


}
