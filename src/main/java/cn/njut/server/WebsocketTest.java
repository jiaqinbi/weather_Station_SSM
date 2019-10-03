package cn.njut.server;

import org.junit.Test;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 测试TCP
 * @author Bijiaqin
 * @date 2019/7/9 16:34
 */
public class WebsocketTest {

    public static void main(String[] args) {
        try {
            InetAddress localIP = InetAddress.getLocalHost();
            InetAddress remote = InetAddress.getByName("www.baidu.com");
            System.out.println("本机IP:"+ localIP.getHostAddress());
            System.out.println("百度IP:"+ remote.getHostAddress());
            System.out.println("百度主机名:"+ remote.getHostName());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }

}
