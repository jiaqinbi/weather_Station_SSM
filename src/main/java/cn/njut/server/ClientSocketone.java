package cn.njut.server;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * @author Bijiaqin
 * @date 2019/7/9 17:04
 */
public class ClientSocketone {

    /**
     * 向服务端发送数据
     */
    public void sendSocket(){
        try {
            Socket socket =new Socket("192.168.4.1",6000);
            BufferedWriter bufferedWriter =new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(),"UTF-8"));
            String str="Hello, This is my first socket.";
            String strU = new String(str.getBytes("ISO-8859-1"),"utf-8");
            bufferedWriter.write(strU);       //刷新输入流
            bufferedWriter.flush();        //关闭socket的输出流           
            socket.shutdownOutput();

        }catch (IOException e) {e.printStackTrace();
        }
    }
    /**
     * 接收服务端的数据
     */
    public void receiveSocket() throws IOException {
        //向服务器端发送请求，服务器IP地址和服务器监听的端口号
        Socket client = new Socket("10.13.118.29",6000);

        //通过printWriter 来向服务器发送消息
        PrintWriter printWriter = new PrintWriter(client.getOutputStream());
        System.out.println("连接已建立...");

        //发送消息
        printWriter.println("hello Server");

        printWriter.flush();

        //InputStreamReader是低层和高层串流之间的桥梁
        //client.getInputStream()从Socket取得输入串流
        InputStreamReader streamReader = new InputStreamReader(client.getInputStream(),"UTF-8");

        //链接数据串流，建立BufferedReader来读取，将BufferReader链接到InputStreamReder
        BufferedReader reader = new BufferedReader(streamReader);
        String advice =reader.readLine();


        System.out.println("接收到服务器的消息 ："+advice);
        reader.close();
    }

    public static void main(String[] args) throws IOException {
        new ClientSocketone().sendSocket();
    }
}
