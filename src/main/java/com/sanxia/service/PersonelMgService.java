package com.sanxia.service;

import com.sanxia.po.Student;
import com.sanxia.po.Teacher;

import java.util.List;

/**
 * @ClassName PersonelMgService
 * @Description TODO
 * @Author YL
 * @Date 2019/4/6 23:02
 * @Version 1.0
 */
public interface PersonelMgService {
    List<Student> queryStudentList();

    List<Teacher> queryTeacherList();
}
