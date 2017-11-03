/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcp_daytime_serv;

import java.io.*;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.BindException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author Costa
 */
public class DaytimeServer {

public static final int SERVICE_PORT = 5001;
    public static void main(String args[])
    {
        try {
            // BIND TO THE SERVICE PORT
            ServerSocket server = new ServerSocket(SERVICE_PORT);
                System.out.println ("Daytime service started");

            while(true){
                try ( // GET THE NEXT TCP CLIENT
                        Socket nextClient = server.accept()) {
                    System.out.println ("Received request from " +
                            nextClient.getInetAddress() + ":" + nextClient.getPort() );
                    
                    BufferedReader in = new BufferedReader (new InputStreamReader(nextClient.getInputStream()));
                    
                    System.out.println("MSG: " + in.readLine());
                    
                    // WRITE THE CURRENT DATE OUT TO THE USER
                    try (PrintStream cliStream = new PrintStream (nextClient.getOutputStream())) {
                        // WRITE THE CURRENT DATE OUT TO THE USER
                        cliStream.println(new java.util.Date());
                        
                        cliStream.flush();
                    }
                }
            }
        }catch (BindException e){
            System.err.println("Service already running on port " +
        SERVICE_PORT);
        }catch (IOException e){
            System.err.println ("I/O error - " + e);
        }
        
    }
}
