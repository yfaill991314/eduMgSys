package com.sanxia.service.impl;

import com.sanxia.po.User;
import com.sanxia.service.CommonService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 * @ClassName CommonServiceImpl
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/8 21:29
 * @Version 1.0
 */
@Service
public class CommonServiceImpl implements CommonService {

    @Override
    public User findCurrentUserInfo() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return user;
    }
}
