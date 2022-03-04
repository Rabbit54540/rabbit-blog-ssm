package com.rabbit.controller;

import com.rabbit.pojo.Image;
import com.rabbit.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/image")
public class ImageController {
    private final ImageService imageService;

    @Autowired
    public ImageController(ImageService imageService) {
        this.imageService = imageService;
    }

    @RequestMapping("myImage")
    public String myImage(HttpServletRequest request){
        Object userid = request.getSession().getAttribute("userid");
        System.out.println(userid);
        List<Image> images = imageService.selectImageByUserId(Integer.parseInt(userid.toString()));
        request.setAttribute("images",images);
        return "jsp/blog/myImage";
    }
    @RequestMapping(value = "addimage",method = RequestMethod.POST)
    public String addimage(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        Image image = new Image();
        image.setUserId(Integer.parseInt(request.getSession().getAttribute("userid").toString()));
        String path = request.getSession().getServletContext().getRealPath("/image");
        File realPath = new File(path);
        if (!realPath.exists()){
            realPath.mkdir();
        }
        System.out.println("上传文件地址"+realPath);
        file.transferTo(new File(realPath+"/"+file.getOriginalFilename()));
        String fileName= new String(realPath+"\\"+file.getOriginalFilename());
        image.setUserImage("/image/"+file.getOriginalFilename());
        System.out.println(fileName);
        imageService.addImage(image);
        return "redirect:/image/myImage";
    }
    @RequestMapping("deleteImage")
    public String deleteImage(HttpServletRequest request){
        String id = request.getParameter("id");
        imageService.deleteImageById(Integer.parseInt(id.toString()));
        return "redirect:/image/myImage";
    }
}
