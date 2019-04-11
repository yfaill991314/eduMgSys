package com.sanxia.controller;

import com.sanxia.po.Student;
import com.sanxia.po.SysAdmin;
import com.sanxia.po.Teacher;
import com.sanxia.service.PersonelMgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    /**
     * @Author Feng.Yang
     * @Description //学生列表
     * @Date 17:40 2019/4/10
     * @Param []
     * @return java.util.List<com.sanxia.po.Student>
     **/
    @RequestMapping("/queryStudentList")
    @ResponseBody
    public List<Student> queryStudentList() {
        return personelMgService.queryStudentList();
    }
    /**
     * @Author Feng.Yang
     * @Description //学生详细信息
     * @Date 17:41 2019/4/10
     * @Param []
     * @return java.util.List<com.sanxia.po.Student>
     **/
    @RequestMapping("/findStudentInfo")
    @ResponseBody
    public Map<String,Object> findStudentInfo(Student student) {
        Map<String,Object> resultView=new HashMap<>();
        resultView.put("success",true);
        resultView.put("result",personelMgService.findStudentInfo(student));
        return resultView;
    }
    @RequestMapping("/addStudent")
    @ResponseBody
    public Map<String,Object> addStudent(Student student) {
        int i= personelMgService.addStudent(student);
        Map<String,Object> resultView=new HashMap<>();
        resultView.put("success",true);
        resultView.put("message","添加成功");
        return resultView;
    }

    @RequestMapping("/exitStudent")
    @ResponseBody
    public Map<String,Object> exitStudent(Student student) {
        Map<String,Object> resultView=new HashMap<>();
        int i= personelMgService.exitStudent(student);
        if (1<0){
            resultView.put("success",false);
            resultView.put("message","修改失败");
        }else {
            resultView.put("success",true);
            resultView.put("message","修改成功");
        }
        return resultView;
    }

    @RequestMapping("/queryTeacherList")
    @ResponseBody
    public List<Teacher> queryTeacherList() {
        return personelMgService.queryTeacherList();
    }

    @RequestMapping("/queryAdminList")
    @ResponseBody
    public List<SysAdmin> queryAdminList() {
        return personelMgService.queryAdminList();
    }

}
