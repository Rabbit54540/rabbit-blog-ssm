package com.rabbit.service;

import com.rabbit.dao.LikeDao;
import com.rabbit.pojo.Like;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeServiceImpl implements LikeService {
    private final LikeDao likeDao;

    @Autowired
    public LikeServiceImpl(LikeDao likeDao) {
        this.likeDao = likeDao;
    }

    @Override
    public void addLike(Like like) {
        if (like!=null){
            likeDao.addLike(like);
        }
    }

    @Override
    public Like selectLikeForUserIdAndBlogId(int userid,int blogId) {
        return likeDao.selectLikeForUserIdAndBlogId(userid,blogId);
    }
}
