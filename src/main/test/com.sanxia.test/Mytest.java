package com.sanxia.test;

import com.sanxia.po.Menu;
import com.sanxia.service.impl.MenuServiceImpl;
import com.sanxia.utils.DrawClaTable;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLOutput;
import java.util.List;

/**
 * @ClassName Mytest
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/4/5 20:55
 * @Version 1.0
 */
public class Mytest {
    @Test
    public void Mytest01() {
        String path = "C:\\Users\\YL\\Desktop\\2015级计算机科学与技术1班\\查重报告";
        File file = new File(path);
        // get the folder list
        File[] array = file.listFiles();

        for (int i = 0; i < array.length; i++) {
            if (array[i].isFile()) {
                // only take file name
                System.out.println("文件名是：" + array[i].getName());


            } else if (array[i].isDirectory()) {
                System.out.println("发现文件件");
            }
        }
    }

    @Test
    public void Mytest02() {
        BufferedImage bi = new BufferedImage(1200, 600, BufferedImage.TYPE_INT_RGB);

        final File file = new File("C:\\Users\\YL\\Desktop\\123\\123.png");

        try {
            if(file.exists()) {
                file.delete();
                file.createNewFile();
            }
        }catch(IOException e) {
            e.printStackTrace();
        }


        writeImage(bi, "png", file);
        System.out.println("绘图成功");
    }



    public boolean writeImage(BufferedImage bi, String picType, File file) {
        //获取画刷
//        Graphics g = bi.getGraphics();
        Graphics2D g = bi.createGraphics();
        //刷白背景
//        g.setColor(Color.WHITE);//设置笔刷白色
//        g.fillRect(0,0,1200,600);//填充整个屏幕
        g.setBackground(new Color(255,255,255));
        g.clearRect(0, 0, 1200, 600);

        //设置颜色
        g.setColor(new Color(0, 0, 0));

        int y=0;
        int x=0;
        for (int i=0;i<12;i++){
            g.drawLine(75, i*45+55, 1125, i*45+55);
        }
        for (int i=0;i<8;i++){
            g.drawLine(i*150+75, 55, i*150+75, 550);
        }


        g.setColor(Color.WHITE);//设置笔刷白色
        g.fillRect(75,55,150,90);
        g.setColor(Color.black);
        g.drawRect(75,55,150,90);

        Font font=new Font("宋体",Font.PLAIN,14);
        g.setFont(font);
        // 抗锯齿
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        // 计算文字长度，计算居中的x点坐标
        String text="第三个反倒是是个范德萨噶梵蒂冈公司发呆功夫大使馆";
        FontMetrics fm = g.getFontMetrics(font);
        int textWidth = fm.stringWidth(text);

        int widthX = (150 - textWidth) / 2;

        int staindex=0;
        String printstr="";
        while (staindex<text.length()){
            if (staindex+8<text.length()){
                printstr= text.substring(staindex,staindex+8);
            }else {
                printstr= text.substring(staindex,text.length());
            }

            g.drawString(printstr,(150-fm.stringWidth(printstr))/2+75,55+fm.getHeight()*(staindex/8+1));
            staindex+=8;
        }


//        g.drawString(text,widthX+75,55+fm.getHeight());

        g.dispose();
        boolean val = false;
        try {
            val = ImageIO.write(bi, picType, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return val;
    }


    @Test
    public void Mytest03() {

//        DrawClaTable drawClaTable=new DrawClaTable();
//        BufferedImage claTableImg ;
//        File file;
//
//        for (int i=0;i<100;i++){
//            file = new File("C:\\Users\\YL\\Desktop\\123\\xixi"+i+".png");
//            try {
//                if(file.exists()) {
//                    file.delete();
//                    file.createNewFile();
//                }
//            }catch(IOException e) {
//                e.printStackTrace();
//            }
////            claTableImg =drawClaTable.getClaTableImg();
//            try {
//                ImageIO.write(claTableImg, "png", file);
//                claTableImg.flush();
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//
//        System.out.println("输出完成");
    }



}
