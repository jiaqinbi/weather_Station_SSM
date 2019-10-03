package cn.njut.controller;

import cn.njut.domain.Datal;
import cn.njut.services.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Bijiaqin
 * @date 2019/7/1 14:38
 */
@Controller
@RequestMapping("/highchart")
public class ChartController {

    @Autowired
    private DataService dataService;

    //////////////////动态折线图显示begin///////////////////////////
    /**
     * 收集温度、湿度、气压近五条数据进行折线图动态显示，待完善
     * @param data
     * @return
     */
    @RequestMapping("/data_line_collection")
    public @ResponseBody Datal data_line_collection(@RequestBody Datal data){
        /*可能补充硬件传过来的data*/
        return data;
    }
    /**
     * 温度动态折线图显示
     * @param model
     * @param username
     * @return
     */
    @RequestMapping("/dynamic_chart_temperature")
    public String dynamic_chart_temperature(Model model, String username){
        model.addAttribute("username",username);
        return "dynamic-chart-temperature";  //跳转到温度动态折线图展示页面
    }
    /**
     * 湿度动态折线图显示
     * @param model
     * @param username
     * @return
     */
    @RequestMapping("/dynamic_chart_humidity")
    public String dynamic_chart_humidity(Model model, String username){
        model.addAttribute("username",username);
        return "dynamic-chart-humidity";  //跳转到湿度动态折线图展示页面
    }
    /**
     * 气压态折线图显示
     * @param model
     * @param username
     * @return
     */
    @RequestMapping("/dynamic_chart_airpressure")
    public String dynamic_chart_airpressure(Model model, String username){
        model.addAttribute("username",username);
        return "dynamic-chart-airpressure";  //跳转到气压动态折线图展示页面
    }
    //////////////////////动态折线图显示end//////////////////////////

    /////////////////////////速度仪显示begin////////////////////////
    /**
     * 收集风速、风向近五条数据进行速度仪图动态显示，待完善
     * @param data
     * @return
     */
    @RequestMapping("/data_speedmeter_collection")
    public @ResponseBody Datal data_speedmeter_collection(@RequestBody Datal data){

        //System.out.println(data+"--"+"可视化收集数据.......");
        return data;
    }
    /**
     * 风速、风向速度仪图显示
     * @param model
     * @param username
     * @return
     */
    @RequestMapping("/chartSpeedmeter")
    public String chartSpeedmeter(Model model, String username){
        model.addAttribute("username",username);
        //System.out.println(username+"--"+"可视化图表页面显示.......");
        return "dynamic-chart-windspeed"; //跳转到速度仪展示页面
    }

    /////////////////////////速度仪显示end//////////////////////////

}
