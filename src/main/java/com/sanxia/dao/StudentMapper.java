package com.sanxia.dao;

import com.sanxia.po.Student;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer stuNum);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer stuNum);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    List<Student> queryStudentList(Map<String, Object> queryParams);
}