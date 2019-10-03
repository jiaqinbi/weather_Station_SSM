package cn.njut.server;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

/**
 * Tcp网络数据传输服务器
 * @author Bijiaqin
 * @date 2019/7/10 11:32
 */
public class Demo_Server_Tcp {

    public static void main(String[] args) throws IOException {
        //创建一个服务端Socket对象,绑定端口
        ServerSocket serverSocket = new ServerSocket(9000);
        while(true){
            //监听客户端连接
            Socket clientSocket = serverSocket.accept();

            //接收客户端发送的数据
            //开启线程，若不开启子线程，则只能接收一个客户端的连接
            new Thread(){
                public void run(){
                    try {
                        //读写数据都是通过I/O流
                        InputStream is = clientSocket.getInputStream();
                        OutputStream os = clientSocket.getOutputStream();

                        BufferedReader br = new BufferedReader(new InputStreamReader(is));
                        PrintWriter pw = new PrintWriter(os);

                        while(true){
                            //读取客户端的数据
                            String line = br.readLine();
                            if(line != null){
                                System.out.println(new Date() + "--" + clientSocket + "接收到客户端发送的数据:" + line);

                                //响应客户端面
                                pw.write("receiver success \r\n");
                                pw.flush();
                            }


                        }


                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            }.start();
        }



    }
}
