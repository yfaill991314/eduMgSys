package com.sanxia.dao;

import com.sanxia.po.Student;
import com.sanxia.po.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer teaNum);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer teaNum);
    Teacher selectByUuid(String uuid);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    List<Teacher> queryTeacherList(Map<String, Object> queryParams);
}