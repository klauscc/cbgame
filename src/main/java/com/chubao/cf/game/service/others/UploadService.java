package com.chubao.cf.game.service.others;

import com.chubao.cf.game.config.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 创建者: 程峰
 * 创建时间: 16/1/23 下午11:19
 * 任务号:
 * 创建说明: 处理上传相关service
 */
@Service
public class UploadService {
    private final static Logger logger = LoggerFactory.getLogger(UploadService.class);


    public String  saveImage(MultipartFile image, String uploadSecondDir,HttpServletRequest request){
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String relativePath = Constants.getUploadDir()+ uploadSecondDir + "/"+date;
        String realPath = request.getSession().getServletContext().getRealPath(relativePath);
        String originalFilename = image.getOriginalFilename();
        String fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "_" + new Random().nextInt()+originalFilename.substring(originalFilename.lastIndexOf("."));
        logger.warn("save image path:{}",realPath+"/"+fileName);
        File targetFile = new File(realPath, fileName);
        try {
            if(!targetFile.exists()){
                new File(realPath).mkdirs();
            }
            image.transferTo(targetFile);
            return relativePath+"/"+fileName;
        } catch (Exception e) {
            logger.warn("upload image failed:{}",e.getLocalizedMessage());
            e.printStackTrace();
            return "";
        }
    }
}
