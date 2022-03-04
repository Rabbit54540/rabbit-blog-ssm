package com.rabbit.dao;

import com.rabbit.pojo.Image;

import java.util.List;

public interface ImageDao {
    void addImage(Image image);
    List<Image> selectImageByUserId(int userId);
    void deleteImageById(int Id);
}
