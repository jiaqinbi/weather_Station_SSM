package cn.njut.tcpclient;

import org.junit.Test;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.net.Socket;
import java.util.Date;

/**
 * Tcp客户机，接收并解析服务器发送的数据
 * @author Bijiaqin
 * @date 2019/7/10 14:55
 */
@Controller
public class TcpClient {
    private static final String ip = "192.168.4.1";
    //private static final String ip = "192.168.148.1";
    private static final int port = 6000;
    private static String strr = "";
    public String tcp_client() throws IOException {
        //创建Scoket对象
        Socket socket = new Socket(ip, port);

        //连接服务器
        OutputStream os = socket.getOutputStream();
        PrintWriter pw = new PrintWriter(os);
        System.out.println("与"+ ip + ":" + port +"服务器的连接已建立！");
        pw.write("hello server,port"+ socket.getLocalPort()+ "client \r\n");
        pw.flush();

        //接收服务器发送的数据
        InputStream is = socket.getInputStream();
        InputStreamReader isr = new InputStreamReader(is,"GBK");
        BufferedReader br = new BufferedReader(isr);
        char[] b = new char[1024];
        int len = 0;
        int count = 1;
        String str="";
        while((len = br.read(b)) != -1){
            str = new String(b, 0, len);
            //strr = str;
            System.out.println(new Date() + "接收到的服务器发送的第" + count + "数据:" + str);
            //count++;
            break;
        }
//        BufferedReader reader = new BufferedReader(isr);
//        String advice =reader.readLine();
        //关闭流
        br.close();
        //返回接收到的数据
//        return advice;
        return str;
    }

    public static void main(String[] args) throws IOException {
        //System.out.println("拿到"+strr );
       while(true){
           String s = new TcpClient().tcp_client();
           System.out.println("拿到" + s + "--");
       }
    }
}
