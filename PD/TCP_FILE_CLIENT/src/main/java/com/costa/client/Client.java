package com.costa.client;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.Socket;
import javax.xml.ws.handler.MessageContext;

public class Client {
    
    
    public static final int MAX_SIZE = 4096;
    public static final int TIMEOUT = 5;
    public static final int PORT = 6001;
    
  
    
    public static void main(String[] args)
    {
        String hostName;
        String fileName;
        int nBytes;
        
        File file;
        FileOutputStream fileOutStream;
        
        Socket socket;
        
        PrintWriter pout;
        InputStream in;
        
        byte [] buffer = new byte[MAX_SIZE];
        
        if(args.length != 2)
        {
            System.out.println("syntax: Hostname filename");
            return;
        }
        
        hostName = args[0];
        fileName = args[1];
        
        
        try {
            
            file = new File(fileName);
            fileOutStream = new FileOutputStream(file);
             
        } catch (Exception e) {
            System.out.println("Unable to open the file: " + fileName);
            e.printStackTrace();
            return;
        }
        
        try {
            
            socket = new Socket(hostName, PORT);
            socket.setSoTimeout(TIMEOUT);
            
            System.out.println("Connection established");
            
            pout = new PrintWriter(socket.getOutputStream(),true);
            pout.println(fileName);
            
            System.out.println("File: " + fileName +" requested to the server");
            
            in = socket.getInputStream();
          
            
            while((nBytes = in.read(buffer)) > 0 )
            {
                fileOutStream.write(buffer,0,buffer.length);
            }
            
        } catch (Exception e) {
            
            System.out.println("Unable to receive the file!" + fileName);
            e.printStackTrace();
        }
        
    }
}
