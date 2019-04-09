package com.sanxia.service.impl;

import com.sanxia.dao.StudentMapper;
import com.sanxia.dao.TeacherMapper;
import com.sanxia.po.Student;
import com.sanxia.po.Teacher;
import com.sanxia.service.PersonelMgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName PersonelMgServiceImpl
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/6 23:02
 * @Version 1.0
 */
@Service
public class PersonelMgServiceImpl implements PersonelMgService {
    @Resource
    private StudentMapper studentMapper;
    @Resource
    private TeacherMapper teacherMapper;
    @Override
    public List<Student> queryStudentList() {
       return studentMapper.queryStudentList();
    }

    @Override
    public List<Teacher> queryTeacherList() {
        return teacherMapper.queryTeacherList();
    }
}
