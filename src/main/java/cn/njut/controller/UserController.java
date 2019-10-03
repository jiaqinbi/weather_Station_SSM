package cn.njut.controller;

import cn.njut.domain.Datal;
import cn.njut.domain.User;
import cn.njut.services.DataService;
import cn.njut.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 表现层：用户控制类
 * @author Bijiaqin
 * @date 2019/6/27 9:42
 */
@Controller
@RequestMapping(path = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private DataService dataService;

    /**
     * Ajax发送数据测试,模拟异步请求,@ResponseBody响应，@RequestBody接收
     * @return
     */
    @RequestMapping("/testAjax")
    public @ResponseBody User testAjax(@RequestBody User user){

        List<User> list = userService.findUser(user);
        System.out.println(list);
        if(list.size() != 0) {
            user.setUsername(list.get(0).getUsername());
            user.setPassword(list.get(0).getPassword());
            return user;
        }else{
            user.setUsername("");
            user.setPassword("");
            return null;
        }
    }

    /**
     * 登陆确定
     * @param model
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public String login(Model model,String username,String password){

        List<Datal> datalists = dataService.dataQuery();
       // System.out.println("-------------------"+datalists+"-------");
        model.addAttribute("datalists",datalists);

        System.out.println(username+"--"+password);
        model.addAttribute("username",username);
        model.addAttribute("password",password);


        return "index";
    }


    /**
     * springmvc项目框架搭建测试
     * @return
     */
    @RequestMapping("/springmvcTest")
    public String springmvcTest(Model model,User user){
        System.out.println("表现层:springmvcTest执行了....");
        //若"@Autowired"注解成功注入UserService，则可调用其方法，表明自动Spring成功整合了Springmvc框架
        List<User> list = userService.findAllUser();
        List<Datal> datalists = dataService.dataQuery();
        model.addAttribute("dadatalists",datalists);
         model.addAttribute("list",list);
        System.out.println(list);
        return "list";
    }
}
