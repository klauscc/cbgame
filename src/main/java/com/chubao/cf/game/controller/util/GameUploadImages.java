package com.chubao.cf.game.controller.util;

import com.chubao.cf.game.config.Constants;
import com.chubao.cf.game.service.others.UploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/23 上午10:17
 * 任务号:
 * 创建说明:
 */
@Controller
@RequestMapping(value = "/admin/upload")
public class GameUploadImages {

    @Autowired
    private UploadService uploadService;

    private final static String imagesUploadSecondDir = "/images";

    private static Logger logger = LoggerFactory.getLogger(GameUploadImages.class);

    @RequestMapping(value = "/images")
    @ResponseBody
    public Object uploadGameImages(@RequestPart("image[]") MultipartFile image,HttpServletRequest request) {
        String savedImageUrl = uploadService.saveImage(image, Constants.getImagesUploadSecondDir(),request);
        HashMap<String, Object> data = new HashMap<>();
        if (null == savedImageUrl) {
            data.put("error", image.getOriginalFilename() + " 上传失败");
        } else {
            //data.put("initialPreview","[\"<img src=\""+savedImageUrl+"\" class=\"file-preview-image\" title=\""+image.getOriginalFilename()+"\" alt=\"\"+image.getOriginalFilename()+\"\" style=\"width:auto;height:160px;\"> <input type=\"text\" name=\"imageUrl[]\" value=\""+savedImageUrl+"\" hidden>]");
            data.put("url",savedImageUrl);
        }
        return data;
    }
}
