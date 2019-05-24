package com.sanxia.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sanxia.dao.*;
import com.sanxia.po.*;
import com.sanxia.service.CommonService;
import com.sanxia.service.GradeMgService;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName GradeMgServiceImpl
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/5/14 13:35
 * @Version 1.0
 */
@Service
public class GradeMgServiceImpl implements GradeMgService {
    @Resource
    private CommonService commonService;
    @Resource
    private StudentMapper studentMapper;
    @Resource
    private TeacherMapper teacherMapper;
    @Resource
    private SysUtilsMapper sysUtilsMapper;
    @Resource
    private EntityCourseMapper entityCourseMapper;
    @Resource
    private GradeMapper gradeMapper;


    @Override
    public int addCourse(EntityCourse entityCourse) {
        EntityCourse sleEntityCourse = entityCourseMapper.selectByPrimaryKey(entityCourse.getId());
        if (sleEntityCourse ==null) {
            //课程不存在
            return -1;
        }
        User currentUserInfo = commonService.findCurrentUserInfo();
        Student student = studentMapper.selectByUuid(currentUserInfo.getInfoUuid());
        if (student==null){
            //学生不存在
            return -2;
        }
        String gradeUuid = sysUtilsMapper.findUuid();
        Grade grade=new Grade(gradeUuid,sleEntityCourse.getId(),student.getStuNum());
        List<Grade> grades= gradeMapper.isExisteGrade(grade);
        if (grades.size()!=0){
            return -3;
        }
        return gradeMapper.insertSelective(grade);
    }

    @Override
    public Map<String, Object> findMyCourseList(Map<String, Object> queryParams) {
        int pageNum = Integer.parseInt(queryParams.get("page").toString());
        int pageSize= Integer.parseInt(queryParams.get("limit").toString());
        Student student = studentMapper.selectByUuid(commonService.findCurrentUserInfo().getInfoUuid());
        queryParams.put("stuId",student.getStuNum());
        PageHelper.startPage(pageNum, pageSize);
        List<Map<String, Object>> couresGrades = gradeMapper.queryCouresGradeList(queryParams);


        for (Map<String,Object> item:couresGrades) {
            SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy-MM-dd" );
            String startDate = dateFormat.format((Date) item.get("strDate"));
            String endDate = dateFormat.format((Date) item.get("endDate"));
            item.put("strDate",startDate);
            item.put("endDate",endDate);
        }

        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(couresGrades);

        long total = pageInfo.getTotal();
        Map<String, Object> result = new HashMap<>();
        result.put("rows", couresGrades);
        result.put("total", total);
        return result;
    }

    @Override
    public int delGradeByGradeId(Grade grade) {
        return gradeMapper.deleteByPrimaryKey(grade.getId());
    }

    @Override
    public List<Map<String, Object>> findMyStudyingCourseList() {
        Map<String, Object> queryParams=new HashMap<>();
        Student student = studentMapper.selectByUuid(commonService.findCurrentUserInfo().getInfoUuid());
        queryParams.put("stuId",student.getStuNum());
        queryParams.put("status","正在授课");
        List<Map<String, Object>> couresGrades = gradeMapper.queryCouresGradeList(queryParams);

        List<Map<String,Object>> claNodes=new ArrayList<>();
        Map<String,Object> claNode;
        for (Map<String,Object> item:couresGrades) {
            claNode=new HashMap<>();
            switch (item.get("week").toString()){
                case "星期一":
                    claNode.put("week",1);
                    break;
                case "星期二":
                    claNode.put("week",2);
                    break;
                case "星期三":
                    claNode.put("week",3);
                    break;
                case "星期四":
                    claNode.put("week",4);
                    break;
                case "星期五":
                    claNode.put("week",5);
                    break;
                case "星期六":
                    claNode.put("week",6);
                    break;
                case "星期日":
                    claNode.put("week",7);
                    break;
            }
            claNode.put("startNode",item.get("startNode"));
            claNode.put("endNode",item.get("endNode"));
            claNode.put("text",item.get("couName")+"-"+item.get("tName")+"-"+item.get("week")+"-"+item.get("claTime")+"-"+item.get("location"));

            claNodes.add(claNode);
        }
        return claNodes;
    }

    @Override
    public int endCourse(EntityCourse entityCourse) {
        entityCourse.setStatus("已结课");
        return entityCourseMapper.updateByPrimaryKeySelective(entityCourse);
    }

    @Override
    public List<Map<String, Object>> findCurTeaCourseList() {
        Map<String, Object> queryParams=new HashMap<>();
        Teacher teacher = teacherMapper.selectByUuid(commonService.findCurrentUserInfo().getInfoUuid());
        queryParams.put("tid",teacher.getTeaNum());
        queryParams.put("status","正在授课");
        List<Map<String, Object>> teaCourses = entityCourseMapper.findTeaCourseByTeaUuid(queryParams);
//        List<Map<String, Object>> couresGrades = gradeMapper.queryCouresGradeList(queryParams);

        List<Map<String,Object>> claNodes=new ArrayList<>();
        Map<String,Object> claNode;
        for (Map<String,Object> item:teaCourses) {
            claNode=new HashMap<>();
            switch (item.get("week").toString()){
                case "星期一":
                    claNode.put("week",1);
                    break;
                case "星期二":
                    claNode.put("week",2);
                    break;
                case "星期三":
                    claNode.put("week",3);
                    break;
                case "星期四":
                    claNode.put("week",4);
                    break;
                case "星期五":
                    claNode.put("week",5);
                    break;
                case "星期六":
                    claNode.put("week",6);
                    break;
                case "星期日":
                    claNode.put("week",7);
                    break;
            }
            claNode.put("startNode",item.get("startNode"));
            claNode.put("endNode",item.get("endNode"));
            claNode.put("text",item.get("couName")+"-"+item.get("week")+"-"+item.get("claTime")+"-"+item.get("location"));

            claNodes.add(claNode);
        }
        return claNodes;
    }

    @Override
    public Map<String, Object> findStudentGradeListByCurrentCourse(Map<String, Object> queryParams) {
        int pageNum = Integer.parseInt(queryParams.get("page").toString());
        int pageSize= Integer.parseInt(queryParams.get("limit").toString());
        PageHelper.startPage(pageNum, pageSize);
        List<Map<String, Object>> StudentGradeList = gradeMapper.findStudentGradeListByCurrentCourse(queryParams);
        PageInfo<Map<String,Object>> pageInfo = new PageInfo<>(StudentGradeList);

        long total = pageInfo.getTotal();
        Map<String, Object> result = new HashMap<>();
        result.put("rows", StudentGradeList);
        result.put("total", total);
        return result;
    }

    @Override
    public Map<String, Object> findGradeByGradeId(Grade grade) {
        return gradeMapper.findGradeByGradeId(grade);
    }

    @Override
    public int saveGradeByGradeId(Grade grade) {

        return gradeMapper.updateByPrimaryKeySelective(grade);
    }

}
