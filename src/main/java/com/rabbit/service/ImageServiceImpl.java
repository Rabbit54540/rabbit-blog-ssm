package com.rabbit.service;

import com.rabbit.dao.ImageDao;
import com.rabbit.pojo.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {
    private final ImageDao imageDao;

    @Autowired
    public ImageServiceImpl(ImageDao imageDao) {
        this.imageDao = imageDao;
    }

    @Override
    public void addImage(Image image) {
        if (image!=null){
            imageDao.addImage(image);
        }
    }

    @Override
    public List<Image> selectImageByUserId(int userId) {
        return imageDao.selectImageByUserId(userId);
    }

    @Override
    public void deleteImageById(int Id) {
        imageDao.deleteImageById(Id);
    }
}
