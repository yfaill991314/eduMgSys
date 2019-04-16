package com.sanxia.controller;

import com.sanxia.service.EntityCourseMgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @ClassName EntityCourseMgController
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/16 21:18
 * @Version 1.0
 */
@Controller
@RequestMapping("/entityCourse")
public class EntityCourseMgController {

    @Resource
    private EntityCourseMgService entityCourseMgService;

    @RequestMapping("/queryEntityCouList")
    @ResponseBody
    public Map<String,Object> queryEntityCouList(@RequestParam Map<String,Object> queryParams) {
        return entityCourseMgService.queryEntityCouList(queryParams);
    }
}
