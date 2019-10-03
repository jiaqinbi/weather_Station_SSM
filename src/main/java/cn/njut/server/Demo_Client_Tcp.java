package cn.njut.server;

import java.io.*;
import java.net.Socket;
import java.util.Date;
import java.util.Scanner;

/**
 * Tcp客户端
 * @author Bijiaqin
 * @date 2019/7/10 11:32
 */
public class Demo_Client_Tcp{
    //private static final String ip = "10.13.118.29";
    private static final String ip = "192.168.4.1";
    private static final int port = 6000;

   public static void main(String[] args) throws IOException {

       //创建Socket对象
       Socket socket = new Socket(ip,port);

       //向服务器端发送数据
       OutputStream os= socket.getOutputStream();
       PrintWriter pw = new PrintWriter(os);
       System.out.println("与"+ ip + ":" + port +"服务器的连接已建立！");
       pw.write("hello server,我是端口号为"+ socket.getLocalPort()+ "的客户端 \r\n");
       pw.flush();
//       OutputStreamWriter osw = new OutputStreamWriter(os);
//       BufferedWriter bw = new BufferedWriter(osw);
//       bw.write("hello server,I am " + socket + "\r\n");
//       bw.flush();


       System.out.println("请选择操作：\r\n 1.向服务器发送数据 \r\n 2.接收服务器发送的数据");
       Scanner sc = new Scanner(System.in);
       System.out.println("您的选择是：");
       int choose = sc.nextInt();
       switch(choose){
           case 1:
               System.out.println("您的选择是:向服务器发送数据，您有三次机会发送数据\r\n");
               int counto = 1;
               while(counto <= 3){
                   System.out.println("第"+ counto +"次向服务器发送数据,请输入\r\n");
                   String str = sc.next();
                   pw.write(str);
                   pw.flush();
                   counto ++;
               }
               break;
           case 2:
               System.out.println("您的选择是:接收服务器发送的数据\r\n");
               //接收服务器发送的数据
               InputStream is = socket.getInputStream();
               //BufferedReader br = new BufferedReader(new InputStreamReader(is));
               //经过测试java这边接收编码需要设置成GBK，UTF-8依旧会乱码
               InputStreamReader isr = new InputStreamReader(is,"GBK");
               BufferedReader br = new BufferedReader(isr);
               char[] bi = new char[1024];
               int leni = 0;
               //String str = "";
               //while((str = br.readLine()) != null){/*此种方法无法实时读取数据*/
               int count = 1;
               while((leni = br.read(bi)) != -1){
                   String strr = new String(bi, 0, leni);
                   System.out.println(new Date() + "接收到的服务器发送的第" + count + "数据:" + strr);
                   count++;
               }
               //关闭流
               br.close();
               break;
           default:
               System.out.println("输入错误！");
               break;
       }
       socket.close();
       System.out.println("与"+ ip + ":" + port +"服务器的连接连接已关闭！");
    }

}
