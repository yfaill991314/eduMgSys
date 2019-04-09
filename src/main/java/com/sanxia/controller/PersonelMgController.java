package com.sanxia.controller;

import com.sanxia.po.Student;
import com.sanxia.po.Teacher;
import com.sanxia.service.PersonelMgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName PersonelMgController
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/6 22:55
 * @Version 1.0
 */
@Controller
@RequestMapping("/PersonelMg")
public class PersonelMgController {
    @Resource
    private PersonelMgService personelMgService;

    @RequestMapping("/queryStudentList")
    @ResponseBody
    public List<Student> queryStudentList() {
        return personelMgService.queryStudentList();
    }

    @RequestMapping("/queryTeacherList")
    @ResponseBody
    public List<Teacher> queryTeacherList() {
        return personelMgService.queryTeacherList();
    }
}
