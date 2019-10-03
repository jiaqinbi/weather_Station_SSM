package cn.njut.test;

import cn.njut.domain.Datal;
import cn.njut.services.DataService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @author Bijiaqin
 * @date 2019/6/28 13:50
 */
public class TestSpring {
    @Test
    public void run1(){
        //加载Spring配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        
        //获取对象
        DataService us = (DataService) ac.getBean("dataService");
        //调用方法
//        us.findUser();
        List<Datal> datalists = us.dataQuery();
        System.out.println(datalists+"=========");

    }
}
