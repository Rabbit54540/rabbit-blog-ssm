package com.rabbit.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog {
    private int blogId;
    private String blogTitle;
    private String blogBody;
    private int blogType;
    private String blogImage;
    private int userId;
    private int blogLikeQuantity;
}
