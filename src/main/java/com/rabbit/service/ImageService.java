package com.rabbit.service;

import com.rabbit.pojo.Image;

import java.util.List;

public interface ImageService {
    void addImage(Image image);
    List<Image> selectImageByUserId(int userId);
    void deleteImageById(int Id);

}
