package client;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.DatagramPacket;
import java.net.Socket;
import java.util.Calendar;
import javax.xml.ws.handler.MessageContext;

public class Client {
    
    
    public static final int MAX_SIZE = 4096;
    public static final int TIMEOUT = 5;
    public static final int PORT = 6001;
    
  
    
    public static void main(String[] args)
    {
        String time = "TIME";

        String hostName = "10.204.128.70";
        
        Socket socket;
        
        ObjectInputStream in;
        ObjectOutputStream out;
        

        
        try {
            
            socket = new Socket(hostName, PORT);
            
            System.out.println("Connection established");

            in = new ObjectInputStream(socket.getInputStream());
            out = new ObjectOutputStream(socket.getOutputStream());
            
            out.writeObject(time);
            out.flush();

            Calendar calendar;
            
            calendar = (Calendar)in.readObject();

            System.out.println("Time: " + calendar.getTime());

            
        } catch (Exception e) {
            
            System.out.println("Unable to send the obj");
            e.printStackTrace();
        }
        
    }
}

