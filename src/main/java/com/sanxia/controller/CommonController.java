package com.sanxia.controller;

import com.sanxia.po.User;
import com.sanxia.service.CommonService;
import com.sanxia.utils.ResultView;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    private CommonService commonService;



    @RequestMapping("/findCurrentUserInfo")
    @ResponseBody
    public Map<String, Object> findCurrentUserInfo() {
        User currentUser = commonService.findCurrentUserInfo();
        Map<String, Object> resultView = new HashMap<>();
        resultView.put("success", true);
        resultView.put("result", currentUser);
        return resultView;
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map<String, Object> updatePwd(@RequestParam("oldPwd") String oldPwd, @RequestParam("newPwd") String newPwd) {
        User currentUser = commonService.findCurrentUserInfo();

        Md5PasswordEncoder encoder = new Md5PasswordEncoder();
        String md5OldPwd = encoder.encodePassword(oldPwd, currentUser.getUserName());
        String md5NewPwd=encoder.encodePassword(newPwd, currentUser.getUserName());

        if (currentUser.getPassword().equals(md5OldPwd)) {
            User newUser = new User();
            newUser.setUserId(currentUser.getUserId());
            newUser.setUserPsd(md5NewPwd);
            int i = commonService.updateUserPwd(newUser);
            if (i>0){
                return ResultView.getResultView(true, "修改成功");
            }else {
                return ResultView.getResultView(false, "修改失败");
            }
        } else {
            return ResultView.getResultView(false, "修改失败，密码错误");
        }

    }
}
