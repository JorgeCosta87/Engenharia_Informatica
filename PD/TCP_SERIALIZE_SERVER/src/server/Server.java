/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Calendar;

/**
 *
 * @author Costa
 */
public class Server {

 
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
        
       byte[] recbuf = new byte[4096];
       
        if(args.length != 2)
        {
            System.out.println("syntax: Hostname filename");
            return;
        }
        
        try {
            
            socket = new Socket(hostName, PORT);
            socket.setSoTimeout(TIMEOUT);
            
            System.out.println("Connection established");

            in = new ObjectInputStream(socket.getInputStream());
            out = new ObjectOutputStream(socket.getOutputStream());
            
            out.writeObject(time);
            
            out.flush();

            Calendar calendar = (Calendar)in.readObject();

            System.out.println("Time: " + calendar.getTime());

            
        } catch (Exception e) {
            
            System.out.println("Unable to send the obj");
            e.printStackTrace();
        }
        
    }
}
