package com.sanxia.service.impl;

import com.sanxia.dao.*;
import com.sanxia.po.Student;
import com.sanxia.po.SysAdmin;
import com.sanxia.po.Teacher;
import com.sanxia.po.User;
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
    @Resource
    private SysAdminMapper sysAdminMapper;
    @Resource
    private SysUtilsMapper sysUtilsMapper;
    @Resource
    private UserMapper userMapper;

    @Override
    public List<Student> queryStudentList() {
       return studentMapper.queryStudentList();
    }
    @Override
    public Student findStudentInfo(Student student) {
        return studentMapper.selectByPrimaryKey(student.getStuNum());
    }

    @Override
    public int addStudent(Student student) {
        String stuUuid= sysUtilsMapper.findUuid();
        String userUuid=sysUtilsMapper.findUuid();
        student.setUuid(stuUuid);
        student.setUserUuid(userUuid);
        studentMapper.insertSelective(student);
        User user=new User();
        user.setUuid(userUuid);
        user.setInfoTableName("student");
        user.setInfoUuid(sysUtilsMapper.findUuid());
        user.setInfoUuid(stuUuid);
        user.setRoleUuid("1385f4a3587711e9b2ad00163e0ed0cd");
        user.setUserName(student.getStuNum().toString());
        user.setUserPsd("123456");


        return userMapper.insertSelective(user);
    }

    @Override
    public int exitStudent(Student student) {
        Student oldStu = studentMapper.selectByPrimaryKey(student.getStuNum());
        if (oldStu!=null){
            return studentMapper.updateByPrimaryKeySelective(student);
        }else {
            return -1;

        }
    }


    @Override
    public List<Teacher> queryTeacherList() {
        return teacherMapper.queryTeacherList();
    }

    @Override
    public List<SysAdmin> queryAdminList() {
        return sysAdminMapper.queryAdminList();
    }


}
