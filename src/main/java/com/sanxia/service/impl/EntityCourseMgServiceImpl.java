package com.sanxia.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sanxia.dao.EntityCourseMapper;
import com.sanxia.po.EntityCourse;
import com.sanxia.po.Student;
import com.sanxia.service.EntityCourseMgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName EntityCourseMgServiceImpl
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/16 21:21
 * @Version 1.0
 */
@Service
public class EntityCourseMgServiceImpl implements EntityCourseMgService {
    @Resource
    private EntityCourseMapper entityCourseMapper;

    @Override
    public Map<String, Object> queryEntityCouList(Map<String, Object> queryParams) {
        int pageNum = Integer.parseInt(queryParams.get("page").toString());
        int pageSize= Integer.parseInt(queryParams.get("limit").toString());
        PageHelper.startPage(pageNum, pageSize);

        List<Map<String, Object>> entityCoures = entityCourseMapper.queryEntityCouresList();

        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(entityCoures);

        long total = pageInfo.getTotal();
        Map<String, Object> result = new HashMap<>();
        result.put("rows", entityCoures);
        result.put("total", total);
        return result;
    }
}
