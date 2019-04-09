package com.sanxia.test;

import com.sanxia.po.Menu;
import com.sanxia.service.impl.MenuServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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
    public void Mytest01(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/spring.xml");

        MenuServiceImpl menuService = (MenuServiceImpl) ctx.getBean("menuServiceImpl");
//        Menu menu=new Menu();
//        menu.setName("开课管理");
//        menu.setLeaf(true);
//        menu.setParentid(10004);
//        menu.setUrl("kaikeGuanLi");
//        menuService.insertMenuItem(menu);
        menuService.findMenuItemList();
        int i=0;
        System.out.println(i);

    }
}
