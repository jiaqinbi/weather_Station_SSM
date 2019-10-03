package cn.njut.controller;

import cn.njut.domain.Datal;
import cn.njut.services.DataService;
import cn.njut.tcpclient.TcpClient;
import net.sf.json.JSONArray;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * @author Bijiaqin
 * @date 2019/7/1 14:38
 */
@Controller
@RequestMapping("/data")
public class DataController {

    @Autowired
    private DataService dataService;

    @Autowired
    private TcpClient tcpClient;

    /**
     * 全局更新五个数据
     * @param data
     * @return
     */
    /*public @ResponseBody Datal updateData(@RequestBody Datal data){

        Random random = new Random();
        data.setTemperature(Integer.toString(random.nextInt(100)));
        data.setHumidity(Integer.toString(random.nextInt(200)-50));
        data.setAir_pressure(Integer.toString(random.nextInt(100)-1));
        data.setWind_direction(Integer.toString(random.nextInt(100)));
        data.setWind_speed(Integer.toString(random.nextInt(100)));

         return data;
    }*/


    @RequestMapping("/updateData")
    public void updateData(@RequestBody Datal data, HttpServletResponse response, HttpSession session) throws IOException {

        /*TcpClient tcpClient = new TcpClient();
        String str_data = tcpClient.tcp_client();
        System.out.println("接收到的esp8266发送的数据:"+str_data);
        data.setTemperature(str_data.substring(1,3));
        data.setHumidity(str_data.substring(4,6));
        data.setAir_pressure(str_data.substring(7,9));
        data.setWind_direction(str_data.substring(10,12));
        data.setWind_speed(str_data.substring(13,15));*/

        Random random = new Random();
        data.setTemperature("100");
        data.setHumidity(Integer.toString(random.nextInt(200)-50));
        data.setAir_pressure(Integer.toString(random.nextInt(100)-1));
        data.setWind_direction(Integer.toString(random.nextInt(100)));
        data.setWind_speed(Integer.toString(random.nextInt(100)));



        List list = new ArrayList();
        list.add(data);

        JSONArray jsonArray2 = JSONArray.fromObject(list);//将集合转换为json格式
        String jsonString=jsonArray2.toString();//将jisn转换为字符串

        System.out.println("jsonString"+jsonString);

        session.setAttribute("newList",list);
        response.getWriter().print(jsonString);//返回json信息
    }

    /*public void updateData1(@RequestBody Datal data, HttpServletResponse response, HttpSession session) throws IOException {
        Random random = new Random();

        //Datal datal = new Datal();
        data.setTemperature(Integer.toString(random.nextInt(100)));
        data.setHumidity(Integer.toString(random.nextInt(200)-50));
        data.setAir_pressure(Integer.toString(random.nextInt(100)-1));
        data.setWind_direction(Integer.toString(random.nextInt(100)));
        data.setWind_speed(Integer.toString(random.nextInt(100)));
*//*

        Datal data2 = new Datal();
        data2.setTemperature(Integer.toString(random.nextInt(100)));
        data2.setHumidity(Integer.toString(random.nextInt(200)-50));
        data2.setAir_pressure(Integer.toString(random.nextInt(100)-1));
        data2.setWind_direction(Integer.toString(random.nextInt(100)));
        data2.setWind_speed(Integer.toString(random.nextInt(100)));

        Datal data3= new Datal();
        data3.setTemperature(Integer.toString(random.nextInt(100)));
        data3.setHumidity(Integer.toString(random.nextInt(200)-50));
        data3.setAir_pressure(Integer.toString(random.nextInt(100)-1));
        data3.setWind_direction(Integer.toString(random.nextInt(100)));
        data3.setWind_speed(Integer.toString(random.nextInt(100)));*//*
        List list = new ArrayList();
        list.add(data);
       *//* list.add(1, data2);
        list.add(2, data3);*//*

        System.out.println("list+++++++++++++++++++++++++++"+list);

      //  List newList = chandeList(list);
        JSONArray jsonArray2 = JSONArray.fromObject(list);//将集合转换为json格式
        String jsonString=jsonArray2.toString();//将jisn转换为字符串
        System.out.println("jsonString"+jsonString);

        session.setAttribute("newList",list);
        session.setAttribute("sessiondataJSON",jsonArray2);
        session.setAttribute("sessiondataString",jsonString);

        response.getWriter().print(jsonString);//返回json信息
       // return data;
    }*/


    /**
     * 刷新温度值
     * @param data
     * @return
     */
    @RequestMapping("/updateTemperature")
    public @ResponseBody Datal updateTemperature(@RequestBody Datal data){
        List<Datal> data1 = dataService.dataQuery();//省略代码，更新单个数据时也用了全局更新的查询方法
        data.setTemperature(data1.get(data1.size()-1).getTemperature());
        return data;
    }
    /**
     * 刷新湿度值
     * @param data
     * @return
     */
    @RequestMapping("/updateHumidity")
    public @ResponseBody Datal updateHumidity(@RequestBody Datal data){
        List<Datal> data1 = dataService.dataQuery();
        data.setHumidity(data1.get(data1.size()-1).getHumidity());
        return data;
    }
    /**
     * 刷新风速值
     * @param data
     * @return
     */
    @RequestMapping("/updateWind_speed")
    public @ResponseBody Datal updateWind_speed(@RequestBody Datal data){
        List<Datal> data1 = dataService.dataQuery();
        data.setWind_speed(data1.get(data1.size()-1).getWind_speed());
        return data;
    }
    /**
     * 刷新风向值
     * @param data
     * @return
     */
    @RequestMapping("/updateWind_direction")
    public @ResponseBody Datal updateWind_direction(@RequestBody Datal data){
        List<Datal> data1 = dataService.dataQuery();
        data.setWind_direction(data1.get(data1.size()-1).getWind_direction());
        return data;
    }
    /**
     * 刷新气压值
     * @param data
     * @return
     */
    @RequestMapping("/updateAir_pressure")
    public @ResponseBody Datal updateAir_pressure(@RequestBody Datal data){
        List<Datal> data1 = dataService.dataQuery();
        data.setAir_pressure(data1.get(data1.size()-1).getAir_pressure());
        return data;
    }

    /**
     * 导航栏"chartDisplay展示"
     * @param model
     * @param username
     * @return
     */
    @RequestMapping("/chartDisplay")
    public String chartDisplay(Model model,String username){
        model.addAttribute("username",username);
        //System.out.println("图表显示页面跳转..."+username);
        return "dynamic-chart-display";
    }


    @RequestMapping("/chartTemperature")
    public @ResponseBody Datal chartTemperature(@RequestBody Datal datalist){
        System.out.println(datalist+"--"+"数据收集转发.......");
        return datalist;
    }



    /**
     * 查询数据返回到jsp页面
     * @param datalist
     * @return
     */
    @RequestMapping("/dataQuery")
    public Datal dataQuery(Datal datalist){

        return datalist;
    }

    /*
    * 改变；list集合， 一进去一出去
    * */
    private static List  chandeList(List list){
         List list2 = new ArrayList();


       list2.add(0,list.get(1));
       list2.add(1,list.get(2));

         Random random = new Random();
         int tem = random.nextInt(100);
         String temstr = Integer.toString(tem);
         int hum = random.nextInt(200)-50;
         String humstr = Integer.toString(hum);
         int air = random.nextInt(100)-1;
         String airstr = Integer.toString(air);
         int win_d = random.nextInt(100);
         String win_dstr = Integer.toString(win_d);
         int win_s = random.nextInt(100);
         String win_sstr = Integer.toString(win_s);

         Datal data= new Datal();
         data.setTemperature(Integer.toString(random.nextInt(100)));
         data.setHumidity(Integer.toString(random.nextInt(200)-50));
         data.setAir_pressure(Integer.toString(random.nextInt(100)-1));
         data.setWind_direction(Integer.toString(random.nextInt(100)));
         data.setWind_speed(Integer.toString(random.nextInt(100)));
         list2.add(2,data);


         System.out.println("listsize2  "+list2.size());
         return  list;
     }


    /**
     * map集合转化成json格式
     * @param data
     * @return
     */
    private String conversion(Map<String, String> data){

        StringBuilder str = new StringBuilder("{");

        for (String key : data.keySet()) {

            str.append("\"").append(key).append("\"").append(":").append("\"").append(data.get(key)).append("\"").append(",");
        }
        str.append("}");
        return str.toString();

    }

    @Test
    public void test_str() throws IOException {
        TcpClient tcpClient = new TcpClient();
        String s = tcpClient.tcp_client();
        String temp = s.substring(1,3);
        System.out.println("--"+s+"--"+s.substring(1,3)+"--"+s.substring(4,6)+"--"+s.substring(9,11)+"--"+s.substring(13,15)+"--");
    }

    public static void main(String[] args) {
        //while(true){
        Random random = new Random();
        int tem = random.nextInt(100);
        String temstr = Integer.toString(tem);
        int hum = random.nextInt(200)-50;
        String humstr = Integer.toString(hum);
        int air = random.nextInt(100)-1;
        String airstr = Integer.toString(air);
        int win_d = random.nextInt(100);
        String win_dstr = Integer.toString(win_d);
        int win_s = random.nextInt(100);
        String win_sstr = Integer.toString(win_s);

        Map map1 = new HashMap();
        map1.put("temperature",temstr);
        map1.put("temperature","100");
        map1.put("humidity",humstr);
        map1.put("air_pressure",airstr);
        map1.put("wind_direction",win_dstr);
        map1.put("wind_speed",win_sstr);

        Map map2 = new HashMap();
        map2.put("temperature",temstr);
        map2.put("temperature","100");
        map2.put("humidity",humstr);
        map2.put("air_pressure",airstr);
        map2.put("wind_direction",win_dstr);
        map2.put("wind_speed",win_sstr);

        Map map3 = new HashMap();
        map3.put("temperature",temstr);
        map3.put("temperature","100");
        map3.put("humidity",humstr);
        map3.put("air_pressure",airstr);
        map3.put("wind_direction",win_dstr);
        map3.put("wind_speed",win_sstr);

        List list = new ArrayList();
        list.add(0, map1);
        list.add(1, map2);
        list.add(2, map3);

        System.out.println("list+++++++++++++++++++++++++++"+list);

        // JSONPObject object = JSONPObject.
        DataController dataController = new DataController();
        // String json = dataController.conversion(list);
        List newList = chandeList(list);


        // System.out.println(json);
        JSONArray jsonArray2 = JSONArray.fromObject(newList);//将集合转换为json格式
        String jsonString=jsonArray2.toString();//将jisn转换为字符串
        //  response.getWriter().print(jsonString);//返回json信息


        System.out.println("jsonString"+jsonArray2);

        //    }

    }
}
