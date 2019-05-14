package com.sanxia.dao;

import com.sanxia.po.Grade;

import java.util.List;
import java.util.Map;

public interface GradeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);

    List<Map<String,Object>> queryCouresGradeList(Map<String,Object> queryParams);

    List<Grade> isExisteGrade(Grade grade);
}