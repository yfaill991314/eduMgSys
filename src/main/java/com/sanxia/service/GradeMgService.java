package com.sanxia.service;

import com.sanxia.po.EntityCourse;
import com.sanxia.po.Grade;

import java.util.List;
import java.util.Map;

/**
 * @ClassName GradeMgService
 * @Description TODO
 * @Author YL
 * @Date 2019/5/14 13:31
 * @Version 1.0
 */
public interface GradeMgService {
    int addCourse(EntityCourse entityCourse);

    Map<String,Object> findMyCourseList(Map<String,Object> queryParams);

    int delGradeByGradeId(Grade grade);

    List<Map<String, Object>> findMyStudyingCourseList();

    int endCourse(EntityCourse entityCourse);

    List<Map<String,Object>> findCurTeaCourseList();

    Map<String,Object> findStudentGradeListByCurrentCourse(Map<String,Object> queryParams);

    Map<String,Object> findGradeByGradeId(Grade grade);

    int saveGradeByGradeId(Grade grade);
}
