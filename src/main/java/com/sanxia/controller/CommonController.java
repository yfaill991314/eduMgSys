package com.sanxia.controller;

import com.sanxia.po.User;
import com.sanxia.service.CommonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName CommonController
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/8 21:22
 * @Version 1.0
 */
@Controller
@RequestMapping("/common")
public class CommonController {
    @Resource
    CommonService commonService;

    @RequestMapping("/findCurrentUserInfo")
    @ResponseBody
    public Map<String,Object> findCurrentUserInfo() {
        User currentUser = commonService.findCurrentUserInfo();
        Map<String,Object> resultView=new HashMap<>();
        resultView.put("success",true);
        resultView.put("result",currentUser);
        return resultView;
    }
}
