package netty;

import java.io.BufferedInputStream;
import java.net.Socket;

public class Client {
    public Client() throws Exception {
        Socket socket = new Socket("localhost", 80);

        BufferedInputStream bis = new BufferedInputStream(socket.getInputStream());

        byte[] buf = new byte[256];

        System.out.println("reading...");
        int count = bis.read(buf);
        System.out.println("read data len:" + count);
        System.out.println(new String(buf));

        bis.close();
        socket.close();
    }

    public static void main(String[] args) {
        try {
            new Client();
        } catch (Exception e) {
//            e.printStackTrace();
        }
    }
}