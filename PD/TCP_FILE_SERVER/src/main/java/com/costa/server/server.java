package com.costa.server;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;




public class server {
    
    public static final int MAX_SIZE = 4096;
    public static final int PORT = 6001;
    
    public static void main(String[] args)
    {
        String filename = "foto1.jpg";   
        int nBytes;
        
        File file;
        FileInputStream fileInStream;

        ServerSocket serverScoket;
        
        

        InputStreamReader inStreamReader;
        BufferedReader bufReader;

        byte [] buffer = new byte[MAX_SIZE];

        try {
            
            serverScoket = new ServerSocket(PORT);
            System.out.println("Server is running!");
            
            
            while(true)
            {
                Socket cli = serverScoket.accept();
                
                System.out.println("Request receive from: " +
                        cli.getInetAddress() + ":"+
                        cli.getPort());
                
                inStreamReader = new InputStreamReader(cli.getInputStream());
                bufReader = new BufferedReader(inStreamReader);
                
                System.out.println("file requested: " + bufReader.readLine());
                
                file = new File(filename);
                fileInStream = new FileInputStream(file);
                
                
                while((nBytes = fileInStream.read(buffer)) > 0)
                {
                    cli.getOutputStream().write(buffer,0, buffer.length);
                }
               
                System.out.println("File send complete!");
                
            }
            
        } catch (Exception e) {
            
            System.out.println("File not send");
            e.printStackTrace();
            
        }
    
    
    }
    

}
