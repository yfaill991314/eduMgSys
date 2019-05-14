package com.sanxia.controller;

import com.sanxia.po.EntityCourse;
import com.sanxia.po.Grade;
import com.sanxia.service.GradeMgService;
import com.sanxia.utils.DrawClaTable;
import com.sanxia.utils.ResultView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName GradeMgController
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/5/14 13:27
 * @Version 1.0
 */
@Controller
@RequestMapping("/gradeMg")
public class GradeMgController {
    @Resource
    private GradeMgService gradeMgService;

    @RequestMapping("/addCourse")
    @ResponseBody
    public Map<String,Object> addCourse(EntityCourse entityCourse) {
        int i =gradeMgService.addCourse(entityCourse);
        if (i==1){
            return ResultView.getResultView(true,"添加成功");
        }else if (i==-1){
            return ResultView.getResultView(false,"课程不存在");
        }else if (i==-2){
            return ResultView.getResultView(false,"学生不存在");
        }else {
            return ResultView.getResultView(false,"添加失败，所选课程已经存在");
        }
    }

    @RequestMapping("/delmyCourse")
    @ResponseBody
    public Map<String,Object> delmyCourse(Grade grade) {
        int i =gradeMgService.delGradeByGradeId(grade);
        if (i==1){
            return ResultView.getResultView(true,"删除成功");
        }else {
            return ResultView.getResultView(false,"删除失败");
        }
    }

    @RequestMapping("/myCourse")
    @ResponseBody
    public Map<String,Object> findMyCourseList(@RequestParam Map<String,Object> queryParams) {
        return gradeMgService.findMyCourseList(queryParams);
    }


    @RequestMapping("/findClaImg")
    public void findClaImg(HttpServletResponse response) {


        DrawClaTable drawClaTable=new DrawClaTable();
        List<Map<String, Object>> studyingCourseList =gradeMgService.findMyStudyingCourseList();

        BufferedImage claTableImg = drawClaTable.getClaTableImg(studyingCourseList);

        response.setContentType("image/png");
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ImageIO.write(claTableImg, "png", outputStream);

            claTableImg.flush();
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/findTeaClaImg")
    public void findTeaClaImg(HttpServletResponse response) {

        DrawClaTable drawClaTable=new DrawClaTable();
        List<Map<String, Object>> TeaCourseList =gradeMgService.findCurTeaCourseList();

        BufferedImage claTableImg = drawClaTable.getClaTableImg(TeaCourseList);

        response.setContentType("image/png");
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ImageIO.write(claTableImg, "png", outputStream);

            claTableImg.flush();
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/endCourse")
    @ResponseBody
    public Map<String,Object> endCourse(EntityCourse entityCourse) {
        int i = gradeMgService.endCourse(entityCourse);
        if (i<1){
            return ResultView.getResultView(false,"结课失败");
        }else {
            return ResultView.getResultView(true,"结课成功");
        }

    }
}
