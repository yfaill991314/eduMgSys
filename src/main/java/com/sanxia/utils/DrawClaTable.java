package com.sanxia.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName DrawClaTable
 * @Description TODO
 * @Author Feng.Yang
 * @Date 2019/5/12 23:36
 * @Version 1.0
 */
public class DrawClaTable {
    private final static int img_WIDTH = 1350;
    private final static int img_HEIGT = 645;
    private final static int CELL_WIDTH = 150;
    private final static int CELL_HEIGT = 45;
    private final static int CELL_ONE_LINE_CHAR_NUM = 8;
    //行
    private final static int LINE_NUM = 12;
    //列
    private final static int ROW_NUM = 8;
    //
    private final static int CLA_CELL_PADDING_TOP=10;

    private int distanceTop;
    private int distanceLeft;

    public DrawClaTable() {
        distanceLeft = (img_WIDTH - CELL_WIDTH * ROW_NUM) / 2;
        distanceTop = (img_HEIGT - CELL_HEIGT * LINE_NUM) / 2;
    }

    private void drawTable(BufferedImage bufImg) {

        //获取画刷
        Graphics2D g = bufImg.createGraphics();
        //设置背景颜色
        g.setBackground(Color.white);
        //绘制背景
        g.clearRect(0, 0, bufImg.getWidth(), bufImg.getHeight());

        //设置表格颜色
        g.setColor(Color.black);

        for (int i = 0; i <= LINE_NUM; i++) {
            g.drawLine(distanceLeft, i * CELL_HEIGT + distanceTop, img_WIDTH - distanceLeft, i * CELL_HEIGT + distanceTop);
        }
        for (int i = 0; i <= ROW_NUM; i++) {
            g.drawLine(i * CELL_WIDTH + distanceLeft, distanceTop, i * CELL_WIDTH + distanceLeft, img_HEIGT - distanceTop);
        }

        //绘制表头
        String[] weeks=new  String[]{"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
        String[] nodes=new String[]{"一","二","三","四","五","六","七","八","九","十","十一"};
        //设置字体
        Font font=new Font("宋体",Font.PLAIN,14);
        g.setFont(font);
        // 抗锯齿
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        //字体度量
        FontMetrics fm = g.getFontMetrics(font);
        int stax;
        int stay;
        for (int i=0;i<weeks.length;i++){
            stax = distanceLeft + (i+1)* CELL_WIDTH;
            stay = distanceTop;
            g.drawString(weeks[i],(CELL_WIDTH-fm.stringWidth(weeks[i]))/2+stax,stay+(CELL_HEIGT-fm.getHeight())/2+fm.getHeight());
        }
        String nodeName;
        for (int i=0;i<nodes.length;i++){
            nodeName="第"+nodes[i]+"节";
            stax = distanceLeft + (CELL_WIDTH-fm.stringWidth(nodeName))/2;
            stay = distanceTop+CELL_HEIGT*(i+1)+(CELL_HEIGT-fm.getHeight())/2+fm.getHeight();
            g.drawString(nodeName,stax,stay);
        }
        //绘制侧栏
        g.dispose();

    }

    private void drawCla(List<Map<String, Object>> claList, BufferedImage bufImg) {
        Graphics2D g = bufImg.createGraphics();
        //星期
        int week;
        //开始节
        int startNode;
        //结束节
        int endNode;
        //课程名
        String text;

        //开始位置x坐标
        int stax;
        //开始位置y坐标
        int stay;
        //该节课程高度
        int he;


        //设置字体
        Font font=new Font("宋体",Font.PLAIN,14);
        g.setFont(font);
        // 抗锯齿
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        //字体度量
        FontMetrics fm = g.getFontMetrics(font);

        for (Map<String, Object> claItem : claList) {
            //绘制课程的边框
            week = (int) claItem.get("week");
            startNode = (int) claItem.get("startNode");
            endNode = (int) claItem.get("endNode");
            text=claItem.get("text").toString();

            stax = distanceLeft + (week - 1+1) * CELL_WIDTH;
            stay = distanceTop + (startNode - 1+1) * CELL_HEIGT;
            he = (endNode - startNode + 1) * CELL_HEIGT;

            g.setColor(Color.WHITE);//设置笔刷白色
            g.fillRect(stax, stay, CELL_WIDTH, he);
            g.setColor(Color.black);
            g.drawRect(stax, stay, CELL_WIDTH, he);





            // 计算文字长度，计算居中的x点坐标
            int staindex=0;
            String printstr="";
            while (staindex<text.length()){
                if (staindex+CELL_ONE_LINE_CHAR_NUM<text.length()){
                    printstr= text.substring(staindex,staindex+CELL_ONE_LINE_CHAR_NUM);
                }else {
                    printstr= text.substring(staindex,text.length());
                }

                g.drawString(printstr,(CELL_WIDTH-fm.stringWidth(printstr))/2+stax,stay+CLA_CELL_PADDING_TOP+fm.getHeight()*(staindex/CELL_ONE_LINE_CHAR_NUM+1));
                staindex+=CELL_ONE_LINE_CHAR_NUM;
            }
        }
        g.dispose();
    }


    public BufferedImage getClaTableImg(List<Map<String,Object>> claList) {
        BufferedImage bi = new BufferedImage(img_WIDTH, img_HEIGT, BufferedImage.TYPE_INT_RGB);
//        final File file = new File("C:\\Users\\YL\\Desktop\\123\\123.png");
//        try {
//            if (file.exists()) {
//                file.delete();
//                file.createNewFile();
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        this.drawTable(bi);
        this.drawCla(claList, bi);


//        try {
//            ImageIO.write(bi, "png", file);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        System.out.println("绘图成功");
        return bi;
    }
}
